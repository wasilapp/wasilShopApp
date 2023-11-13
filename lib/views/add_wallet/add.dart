import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:get/get_rx/src/rx_types/rx_types.dart';
import 'package:get/get_state_manager/get_state_manager.dart';
import 'package:shared_preferences/shared_preferences.dart';

class AddWalletController extends GetxController {
  var errorText = ''.obs;
  List errorList = [].obs;
//  LocaleController controller = Get.put(LocaleController());
//--------------------- Register  ---------------------------------------------//
//   Future AddWallet({
//     required String nameEn,nameAr,required String image,desAr,desEn,required String price,required String count,subcategoryId })
//   async {
//     ProgressHud.shared.startLoading(Get.context);
//     //Add FCM Token
//     // PushNotificationsManager pushNotificationsManager = PushNotificationsManager();
//     // await pushNotificationsManager.init();
//     // String? fcmToken = await pushNotificationsManager.getToken();
//
//     //URL
//     var loginUrl = Uri.parse(
//         'https://news.wasiljo.com/public/api/v1/manager/wallets');
//     print(nameEn);
//     //Body
//     Map data = {
//       'title[en]':nameEn,
//       'title[ar]': nameAr,
//       'description[en]': desEn,
//       'description[ar]':desAr,
//       'usage': count,
//       'price': price,
//       'subcategory_id': subcategoryId,
//       'image_url':image
//     };
//
//     // //Encode
//     String body = json.encode(data);
//
//
//
//     //Response
//     try {
//       SharedPreferences prefs =
//       await SharedPreferences.getInstance();
//       // Define the request headers
//       var bearerToken=prefs.getString('token');
//       final headers = {
//
//         'Authorization': 'Bearer $bearerToken'
//       };
//       print(body);
//       var response = await http.post(loginUrl,
//           headers: ApiUtil.getHeader(requestType: RequestType.PostWithAuth,token: bearerToken,),
//           body: body);
//       ProgressHud.shared.stopLoading();
//       log(response.body.toString());
//
//       if (response.statusCode == 200) {
//         log("i am is the success method");
//         Get.off(homepage());
//         // Get.snackbar('success register', 'welcome $name to application wasil',
//         //     backgroundColor: AppColors.primaryColor, snackPosition: SnackPosition.BOTTOM,
//         //     icon: Icon(Icons.waving_hand));
//         return;
//       } else {
//         log("i am is the not 200 method");
//         Map<String, dynamic> data = json.decode(response.body);
//         log('error${data["error"]}');
//         errorList = data['error'];
//
//         print(errorList);
//         return ;
//       }
//     } catch (e) {
//       //If any server error...
//       log("i am in the catch method");
//       log(e.toString());
//
//       log('error${data["error"]}');
//       errorList = data['error'];
//     }
//   }
  Future AddWallet({
    required String nameEn,nameAr,required String image,desAr,desEn,required String price,required String count,subcategoryId })
  async {
    SharedPreferences prefs =
    await SharedPreferences.getInstance();
    // Define the request headers
    var bearerToken = prefs.getString('token');
    // ProgressHud.shared.startLoading(Get.context);
    //Add FCM Token
    // PushNotificationsManager pushNotificationsManager = PushNotificationsManager();
    // await pushNotificationsManager.init();
    // String? fcmToken = await pushNotificationsManager.getToken();


    var headers = {
      'Authorization': 'Bearer $bearerToken'
    };
    var data = FormData.fromMap({

      'files': [
        await MultipartFile.fromFile(
           image,
            filename: image)
      ],

      'title[en]': nameEn,
      'title[ar]': nameAr,
      'description[en]': desEn,
      'description[ar]': desAr,
      'usage': count,
      'price': price,
      'subcategory_id': subcategoryId,
      'image_url': image
    });
    data.files.addAll([
      MapEntry(
        'manager[avatar_url]',
        await MultipartFile.fromFile(
         image,
          filename:
          image!.split('/').last,
        ),
      ),
    ]);
    var dio = Dio();
    var response = await dio.request(
      'https://news.wasiljo.com/public/api/v1/manager/wallets',
      options: Options(
        method: 'POST',
        headers: headers,
      ),
      data: data,
    );

    if (response.statusCode == 200) {
      print(json.encode(response.data));
    }
    else {
      print(response.statusMessage);
      print(response.data);
    }
  }}