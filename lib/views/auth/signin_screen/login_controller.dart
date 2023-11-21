
import 'dart:convert';
import 'dart:developer';
import 'package:http/http.dart'as http;
import 'package:get/get.dart';

import '../../../config/api/api_utils.dart';
import '../../../config/custom_package.dart';

import '../../../utils/ui/progress_hud.dart';


class SignInController extends GetxController {
  var errorText = ''.obs;
  // LocaleController controller = Get.put(LocaleController());
//--------------------- Register  ---------------------------------------------//
  Future SignInUser({
    required String mobile, required String password,}) async {
    ProgressHud.shared.startLoading(Get.context);
    //Add FCM Token
    // PushNotificationsManager pushNotificationsManager = PushNotificationsManager();
    // await pushNotificationsManager.init();
    // String? fcmToken = await pushNotificationsManager.getToken();

    //URL
    var loginUrl = Uri.parse(
        'https://admin.wasiljo.com/public/api/v1/manager/login?lang=ar');

    //Body
    Map data = {
      "mobile": mobile,
      'password': password,
    };

    // //Encode
    String body = json.encode(data);



    //Response
    try {
      var response = await http.post(loginUrl,
          headers: ApiUtil.getHeader(requestType: RequestType.Post),
          body: body);
      ProgressHud.shared.stopLoading();


      if (response.statusCode == 200) {
        errorText.value='';
        log("i am is the success method");
        SharedPreferences sharedPreferences = await SharedPreferences
            .getInstance();
        Map<String, dynamic> data = json.decode(response.body);
        Map<String, dynamic> manager = data['data']['manager'];
        String token = data['data']['token'];
        await sharedPreferences.setString('referrer', manager['referrer']);
        print( manager['referrer']);
        // var name = await sharedPreferences.getString('name');
        // await sharedPreferences.setString('email', user['email']);
        await sharedPreferences.setString('token', token);
        // await sharedPreferences.setString('mobile', user['mobile']);
        // await sharedPreferences.setBool('mobile_verified', true);
        Get.to(const homepage());
        // Get.snackbar('success register', 'welcome $name to application wasil',
        //     backgroundColor: AppColors.primaryColor, snackPosition: SnackPosition.BOTTOM,
        //     icon: Icon(Icons.waving_hand));
        return;
      } else {
        log("i am is the not 200 method");
        Map<String, dynamic> data = json.decode(response.body);
        log('error${data["error"]}');
        var errors = data['error'];
        errorText.value = errors;
        print(errorText.value);
        return ;
      }
    } catch (e) {
      //If any server error...
      log("i am in the catch method");
      log(e.toString());
      return ;
    }
  }
}