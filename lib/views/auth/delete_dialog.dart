
import 'dart:convert';
import 'dart:developer';
import 'package:http/http.dart'as http;
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_state_manager/src/simple/get_controllers.dart';
import 'package:mangerapp/views/auth/signin_screen/login_screen.dart';

import '../../config/custom_package.dart';
import '../../controller/auth.dart';

class DeleteUserDialog extends StatelessWidget {
  const DeleteUserDialog({super.key});

  @override
  Widget build(BuildContext context) {
    DeleteUser controller=Get.put(DeleteUser());
    return AlertDialog(
      content:      Text("Are you sure you want to Delete account?".tr,style: TextStyle(color: Colors.black,fontWeight: FontWeight.w700,)),

      actions: [
        // hide

        TextButton(
            onPressed: () async {

              controller.deleteUser();
            },
            child:  Text("Delete".tr.tr,style: TextStyle(color: Colors.red),)),
        TextButton(
            onPressed: () {
              Navigator.of(context).pop();
            },
            child:  Text("Cancel".tr)),
      ],
      shadowColor: Colors.black,
      elevation: 20,
      shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(12)),
      backgroundColor: Colors.white,

      // ctrl space, command space
    );
  }

}class DeleteUser extends GetxController{

  Future deleteUser() async {
    SharedPreferences prefs= await SharedPreferences.getInstance();
    var bearerToken=   prefs.getString('token');


    var response = await http.post(Uri.parse('https://admin.wasiljo.com/public/api/v1/manager/delete'),
      headers: {'Authorization': 'Bearer $bearerToken'},);

    if(response.statusCode==200){
      Map<String, dynamic> data = json.decode(response.body);
      // Deleted Successfully
      if(data['stateNum']==204){
        log("Deleting : ");
        log(response.body.toString());
        SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
        //
        // await sharedPreferences.remove('id');
        // await sharedPreferences.remove('name');
        // await sharedPreferences.remove('email');
        // await sharedPreferences.remove('avatar_url');
        // await sharedPreferences.remove('token');
        // await sharedPreferences.remove('mobile');
        // await sharedPreferences.remove('mobile_verified');
        // await sharedPreferences.remove('blocked');

        Get.snackbar('success delete ', data['message'],
            backgroundColor: primaryColor, snackPosition: SnackPosition.BOTTOM,
            icon: const Icon(Icons.done_outline_rounded));
        Get.to(const LoginScreen());
        return true;
      }

      else{
        // if stateNum==200 =>You have active orders, please cancel all orders first
        Get.back();
        Get.snackbar('error massage ', data['error'],messageText: Text(data['error'],style: TextStyle(fontWeight: FontWeight.bold,color: Colors.white)),
            backgroundColor: Colors.red, snackPosition: SnackPosition.BOTTOM,colorText: Colors.white,
            icon: const Icon(Icons.error,color: Colors.white,));

      }
    }



  }
}