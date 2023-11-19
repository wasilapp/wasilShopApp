


import 'package:firebase_core/firebase_core.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:flutter/material.dart';
import 'package:get/get_navigation/src/root/get_material_app.dart';
import 'package:mangerapp/config/custom_package.dart';
import 'package:mangerapp/l10n/app_language.dart';
import 'package:mangerapp/views/splash_screen/splash_screen.dart';
import 'package:scoped_model/scoped_model.dart';

import 'package:sizer/sizer.dart';

import 'firebase_options.dart';
import 'generated/l10n.dart';

Future<void> main() async {

  //You will need to initialize AppThemeNotifier class for theme changes.
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  // await Firebase.initializeApp(
  //
  //  // options: DefaultFirebaseOptions.currentPlatform,
  // );
  // SystemChrome.setPreferredOrientations(
  //     [DeviceOrientation.portraitUp, DeviceOrientation.portraitDown])
  //     .then((_) async {
  // String langCode = await AllLanguage.getLanguage();
  // await Translator.load(langCode);

  runApp(ScopedModel<AppLanguage>(
    model: AppLanguage(),
    child:  const MyApp(),
  ));
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});



  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    // return Consumer<AppThemeNotifier>(
    //     builder: (BuildContext context, AppThemeNotifier value, Widget? child) {
    return ScopedModelDescendant<AppLanguage>(builder: (context, child, model)
    {
      print('k');
      print(model.appLocale);
      return Sizer(builder: (context, orientation, deviceType) {
        return
          GetMaterialApp(
              locale: Locale('ar'),
              supportedLocales: S.delegate.supportedLocales,
              localizationsDelegates: const [
                S.delegate,
                GlobalMaterialLocalizations.delegate,
                GlobalCupertinoLocalizations.delegate,
                GlobalWidgetsLocalizations.delegate,
              ],
              debugShowCheckedModeBanner: false,
              // theme: AppTheme.getThemeFromThemeMode(value.themeMode()),
              home: const SplashScreen());
      }, // class MyHomePage extends StatefulWidget {
//   MyHomePage({Key? key}) : super(key: key);
//
//   @override
//   _MyHomePageState createState() => _MyHomePageState();
// }
//
// class _MyHomePageState extends State<MyHomePage> {
//   ThemeData? themeData;
//
//   @override
//   void initState() {
//     super.initState();
//     initFCM();
//
//     getAppData();
//   }
//
//   getAppData() async {
//     MyResponse<AppData> myResponse = await AppDataController.getAppData();
//
//
//     if(myResponse.data!=null) {
//       log("response data" + myResponse.data!.paymentMethod.toString());
//       print('asoom1');
//       if (!myResponse.data!.isAppUpdated()) {
//         print('asoom2');
//         Navigator.pushAndRemoveUntil(
//           context,
//           MaterialPageRoute(
//             builder: (BuildContext context) => MaintenanceScreen(
//               isNeedUpdate: true,
//             ),
//           ),
//               (route) => false,
//         );
//         return;
//       } else {
//         print('asoom3');
//         if (myResponse.data!.user != null) {
//           AuthController.saveUserFromUser(myResponse.data!.user!);
//         }
//       }
//     } else {
//       print(myResponse.responseCode);
//       ApiUtil.checkRedirectNavigation(context, myResponse.responseCode);
//     }
//   }
//
//   initFCM() async {
//     PushNotificationsManager pushNotificationsManager =
//     PushNotificationsManager();
//     await pushNotificationsManager.init();
//   }
//
//
//
//   @override
//   Widget build(BuildContext context) {
//     MySize().init(context);
//     themeData = Theme.of(context);
//     return FutureBuilder<AuthType>(
//         future: AuthController.userAuthType(),
//         builder: (context, AsyncSnapshot<AuthType> snapshot) {
//           if (snapshot.hasData) {
//             if (snapshot.data == AuthType.VERIFIED) {
//               return HomeScreen();
//             } else if (snapshot.data == AuthType.LOGIN) {
//               return OTPVerificationScreen();
//             } else if (snapshot.data == AuthType.BLOCKED) {
//               return BlockedScreen();
//             } else {
//               return LoginScreen();
//             }
//           } else {
//             return CircularProgressIndicator();
//           }
//         }
//     );
//   }
// }
      );
    });}

}