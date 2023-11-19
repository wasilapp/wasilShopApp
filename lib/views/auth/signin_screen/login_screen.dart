import 'dart:developer';
import 'package:get/get.dart';
import 'package:mangerapp/config/custom_package.dart';
import 'package:sizer/sizer.dart';

import '../../../generated/l10n.dart';
import 'login_controller.dart';


class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  //Text-Field Controller
  TextEditingController? passwordTFController;
  TextEditingController? _numberController;

  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  bool showPassword = false;
  String countryCode = "962";
  List<String> errorMessages = [];

  @override
  void initState() {
    super.initState();
    passwordTFController = TextEditingController();
    _numberController = TextEditingController();
  }

  @override
  void dispose() {
    _numberController!.dispose();
    passwordTFController!.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    SignInController controllerSignIn = Get.put(SignInController());

    return Scaffold(
        body: Form(
            key: _formKey,
            child: ListView(
              //    padding: EdgeInsets.symmetric(horizontal: 20),
              children: <Widget>[
                SizedBox(height: 10.h,),
                Center(
                  child: Image.asset(
                    'assets/images/logo.png',
                    width: 20.0.w,
                    height: 12.0.h,
                  ),
                ),
                Row(
                  children: [
                    Padding(
                      padding:  EdgeInsets.symmetric(horizontal: 5.0.w),
                      child: Text(
                        (S.of(context).signIn),
                        style: boldPrimary,
                      ),
                    ),
                  ],
                ),
                SizedBox(
                  height: 5.h,
                ),
                Row(
                  children: [

                    Padding(
                      padding:  EdgeInsets.symmetric(horizontal: 2.w),
                      child: ElevatedButton(
                        style: ElevatedButton.styleFrom(
                          backgroundColor: primaryColor,
                          textStyle: const TextStyle(color: Colors.white),
                        ),
                        onPressed: () {
                          showCountryPicker(
                            context: context,
                            //Optional.  Can be used to exclude(remove) one ore more country from the countries list (optional).
                            exclude: <String>['KN', 'MF'],
                            favorite: <String>['SE'],
                            //Optional. Shows phone code before the country name.
                            showPhoneCode: true,
                            onSelect: (Country country) {
                              setState(() {
                                countryCode = country.phoneCode;
                              });
                              log('Select country: ${country.displayName}');
                            },
                            // Optional. Sets the theme for the country list picker.
                            countryListTheme: CountryListThemeData(
                              // Optional. Sets the border radius for the bottomsheet.
                              borderRadius: const BorderRadius.only(
                                topLeft: Radius.circular(40.0),
                                topRight: Radius.circular(40.0),
                              ),
                              // Optional. Styles the search field.
                              inputDecoration: InputDecoration(
                                labelText: 'Search',
                                hintText: 'Start typing to search',
                                prefixIcon: const Icon(Icons.search),
                                border: OutlineInputBorder(
                                  borderSide: BorderSide(
                                    color: const Color(0xFF8C98A8)
                                        .withOpacity(0.2),
                                  ),
                                ),
                              ),
                              // Optional. Styles the text in the search field
                              searchTextStyle:  TextStyle(
                                color: Colors.green,
                                fontSize: 18.sp,
                              ),
                            ),
                          );
                        },
                        child: Text(countryCode,
                            style: const TextStyle(color: Colors.white)),
                      ),
                    ),
                    Expanded(
                        child: CustomTextField(
                          validator: (value) {
                            if (value == null || value.isEmpty) {
                              return S.of(context).pleaseEnterYourMobileNumber;
                            }
                            if (value.length != 9) {
                              return S.of(context).mobileNumberNotEqiual9;
                            }
                            return null;
                          },
                          hintText: S.of(context).mobileNumber,
                          controller: _numberController!,
                          prefixIconData:const Icon (Icons.phone_android),
                          keyBoard: TextInputType.number,
                        )),
                  ],
                ),
                SizedBox(
                  height: 2.h,
                ),
                CustomTextField(
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return S.of(context).pleaseEnterYourPassword;
                    }
                    if (value.length <= 8) {
                      return S.of(context).passwordLengthAtLeast8Character;
                    }
                    return null;
                  },
                  keyBoard: TextInputType.text,
                  controller: passwordTFController!,
                  isPassword: showPassword,
                  hintText:(S.of(context).password),
                  prefixIconData:const Icon( Icons.lock),
                  onPrefixIconPress: () {
                    setState(() {
                      showPassword = !showPassword;
                    });
                  },
                ),
                // TextButton(
                //   style: const ButtonStyle(alignment: Alignment.bottomRight),
                //   onPressed: () =>
                //       MangerNavigator.of(context).push(const ForgetPassword()),
                //   child: Text(
                //     "${Translator.translate("forget password")} ?",
                //   ),
                // ),
                Padding(
                  padding:  EdgeInsets.symmetric(horizontal: 2.0.w,vertical: 2.h),
                  child: Obx(() =>    Text(
                    controllerSignIn.errorText.value,
                    style: const TextStyle(
                      color: Colors.red,
                    ),
                  ) ),
                ),
                Padding(
                  padding:  EdgeInsets.symmetric(
                      horizontal: 5.0.w, vertical: 5.h),
                  child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                        backgroundColor: primaryColor,
                        minimumSize: const Size(50, 50),
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(5)),
                        textStyle: const TextStyle(
                            fontSize: 20, fontWeight: FontWeight.bold)),
                    onPressed: () {
                      if (_formKey.currentState!.validate()) {

                        controllerSignIn.SignInUser(mobile:
                        countryCode.toString() + _numberController!.text,
                            password:   passwordTFController!.text);
                      } },

                    child: Text(
                      style: const TextStyle(color: Colors.white),
                      (S.of(context).signIn),
                    ),
                  ),
                ),
                Center(
                  child: Container(

                    child: InkWell(
                      onTap: () {
                        controllerSignIn.errorText.value='';
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => const SignupScreen()));
                      },
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            Translator.translate(S.of(context).dontHaveAnAccount),
                          ),
                          const SizedBox(
                            width: 1,
                          ),
                          Text(
                            Translator.translate(S.of(context).signup),
                            style: basicPrimary,
                          )
                        ],
                      ),
                    ),
                  ),
                ),
                SizedBox(
                  height: 15.h,
                ),

              ],
            )));
  }}
//     handleLogin() async {
//       // onPressed: () {
//       //   if (_formKey.currentState!.validate()) {
//       //
//       //     controllerSignIn.SignInUser(mobile:
//       //     countryCode.toString() + _mobileTFController!.text,
//       //         password:   passwordTFController!.text);
//       //   } },
// //   if (_formKey.currentState!.validate()) {
// //     try {
// //       final response = await http.post(
// //           Uri.parse('https://news.wasiljo.com/public/api/v1/manager/login'),
// //           body: {
// //             'mobile': countryCode.toString() + _numberController!.text,
// //             'password': passwordTFController!.text
// //           });
// //
// //
// //       if (response.statusCode == 200) {
// //
// //       final body=jsonDecode(response.body);
// //           SharedPreferences prefs =
// //   await SharedPreferences.getInstance();
// //
// //   setState(() {
// //   prefs.setString(
// //   'token',body['data']['token']);
// //         log(prefs.getString('token').toString());
// //         MangerNavigator.of(context).pushReplacement(HomePage());    });}
// //       else{
// //         log("Registration failed with status code: ${response.body}");
// //
// //       }
// //     }
// //     catch (e) {}
// //
// // //   final dio = Dio(); // Create a Dio instance
// // //
// // //   final formData = FormData();
// // //
// // //   // Define the API endpoint URL
// // //   const url =
// // //   "https://news.wasiljo.com/public/api/v1/manager/login";
// // //
// // //   // Define the request headers
// // //   final headers = {
// // //   "Accept": "application/json",
// // //   "Content-Type": "application/json",
// // //   };
// // //
// // //   // Define the request data (payload)
// // //   formData.fields.addAll([
// // //   MapEntry('password', passwordTFController!.text),
// // //   MapEntry('mobile',
// // //   countryCode.toString() + _numberController!.text),
// // //   ]);
// // //
// // //   try {
// // //   final response = await dio.post(
// // //   url,
// // //   data: formData,
// // //   options: Options(headers: headers),
// // //   );
// // //
// // //   if (response.statusCode == 200) {
// // //
// // //   SharedPreferences prefs =
// // //   await SharedPreferences.getInstance();
// // //
// // //   final managerData = response.data["data"]["manager"];
// // //   setState(() {
// // //   prefs.setString(
// // //   'token', response.data['data']['token']);
// // //   prefs.setString('nameEn', managerData["name_en"]);
// // //   prefs.setString('nameEn', managerData["name_en"]);
// // //   prefs.setString('nameAr', managerData["name_ar"]);
// // //   prefs.setString('mobile', managerData["mobile"]);
// // //   prefs.setInt('open', managerData["open"]);
// // //   prefs.setString('avatar_url', managerData["avatar_url"]);
// // //
// // //   print(managerData["name_en"]);
// // //   final manger = Manager(
// // //     id: managerData["id"],
// // //     nameEn: managerData["name_en"],
// // //     nameAr: managerData["name_ar"],
// // //     email: managerData["email"],
// // //     mobile: managerData["mobile"],
// // //     open: managerData["open"],
// // //     avatarUrl: managerData["avatar_url"],
// // //
// // //
// // //   );
// // //   // prefs.setString('email', response.data['data']['manager']['email']);
// // //   //     prefs.setInt('open', response.data['data']['token']['open']);
// // //
// // //   errorMessages.clear();
// // //   });
// // //
// // //   log("Registration successful!");
// // //   log("Response data: ${response.data}");
// // //   MangerNavigator.of(context)
// // //       .pushReplacement(const HomePage());
// // //   } else {
// // //   log("Registration failed with status code: ${response.statusCode}");
// // //   log("Response data: ${response.data}");
// // //   }
// // //   } catch (e) {
// // //   if (e is DioError) {
// // //   if (e.response != null) {
// // //   // log only the error message from the API response
// // //   final responseData = e.response!.data;
// // //   if (responseData is Map<String, dynamic> &&
// // //   responseData.containsKey('message')) {
// // //   log("Error during registration: ${responseData['message']}");
// // //   } else {
// // //   setState(() {
// // //   errorMessages =
// // //   List<String>.from(responseData['errors']);
// // //   });
// // //   log("An error occurred: ${responseData['errors']}");
// // //
// // //   log("An error occurred: ${responseData['errors']}");
// // //   }
// // //   } else {
// // //   // If there's no response, log a generic error message
// // //   log("An error occurred: ${e.message}");
// // //   }
// // //   } else {
// // //   // Handle other exceptions, if any
// // //   log("Unexpected error: $e");
// // //   }
// // //   }
// // //   }
// // // }
// // // }
// //   }}}
