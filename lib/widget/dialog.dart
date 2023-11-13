
import 'package:flutter/material.dart';
import 'package:mangerapp/utils/colors.dart';
import 'package:shared_preferences/shared_preferences.dart';

class GlobalMethods {
  static navigateTo({required BuildContext ctx, required String routeName}) {
    Navigator.pushNamed(ctx, routeName);
  }

  static Future<void> warningDialog({
    required String title,
    required String subtitle,
    required Function fct,
    required BuildContext context,
  }) async {
    await
    showDialog(
        context: context,
        builder: (context) {
          return
            AlertDialog(
            backgroundColor: Colors.white,
            title: Row(children: [

              // Image.asset(
              //   'assets/warning-sign.png',
              //   height: 20,
              //   width: 20,
              //   fit: BoxFit.fill,
              // ),
              const SizedBox(
                width: 8,
              ),
              Text(title,style: const TextStyle(fontSize: 20,color: Colors.black),),
            ]),
            content: Text(subtitle),
            actions: [
              TextButton(
                onPressed: () {
                  if (Navigator.canPop(context)) {
                    Navigator.pop(context);
                  }
                },
                child: const Text(
                  style: TextStyle(
                    color:  primaryColor,

                    fontSize:  18,
                  ),
                  'Cancel',
                ),),
              TextButton(
onPressed:(){} ,

                child: const Text(
                  style: TextStyle(
                    color:  primaryColor,
                    fontSize:  18,
                  ),
                  'OK',

                ),
              ),
            ],
          );
        });
  }
  saveSignIn(bool signIn) async {
    var prefs = await SharedPreferences.getInstance();
    prefs.setBool('signIn', signIn);
  }
}
class AlertDialogWidget {
  static navigateTo({required BuildContext ctx, required String routeName}) {
    Navigator.pushNamed(ctx, routeName);
  }

  static Future<void> warningDialog({
    required String title,
    required String subtitle,
    required Function fct,
    required BuildContext context,
  }) async {
    await showDialog(
        context: context,
        builder: (context) {
          return SizedBox(height: 100,child:
          AlertDialog(

            backgroundColor: Colors.white,
            title:
            Text(title),

            content:    const Column(
              children: [
                Text("Name",  style: TextStyle(
                  color:  Color(0xffde0a1e),

                  fontSize:  18,
                ),),
                Text("Email",  style: TextStyle(
                  color:  Color(0xffde0a1e),

                  fontSize:  18,
                ),),
                Text("Phone",  style: TextStyle(
                  color:  Color(0xffde0a1e),

                  fontSize:  18,
                ),),
                Text("Location",  style: TextStyle(
                  color:  Color(0xffde0a1e),

                  fontSize:  18,
                ),),
              ],
            ),

          )   );
        });
  }}