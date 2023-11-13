
import 'package:flutter/material.dart';
import 'package:mangerapp/views/home_screen/home_screen.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../utils/navigator.dart';
import '../../utils/size_config.dart';
import '../auth/signin_screen/login_screen.dart';
import '../onboard_screen/onboard_screen.dart';


class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {


  @override
  void initState() {
    super.initState();

    // Add a delay to simulate a long-running task
    Future.delayed(const Duration(seconds: 3), () {
      checkOnBoard();
    });
  }

  checkOnBoard()async{


    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();


    String? isChecked = sharedPreferences.getString("isChecked");
    String? token = sharedPreferences.getString("token");
    // isChecked=null;
    if(isChecked==null){
      sharedPreferences.setString("isChecked","1");
     pushReplacementScreen(context, const LoginScreen());
    }else if(token==null){
      pushReplacementScreen(context, const LoginScreen());
    }
    else{
      pushReplacementScreen(context, const LoginScreen());
    }
}

  @override
  Widget build(BuildContext context) {
    MySize().init(context);
    return Scaffold(
      body: Center(
        child: Image.asset(
          'assets/images/logo.png',
          width: 200.0,
          height: 200.0,
        ),
      ),
    );
  }
}

