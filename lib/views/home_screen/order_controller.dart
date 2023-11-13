
import 'dart:convert';
import 'dart:developer';
import 'package:get/get.dart';
import 'package:http/http.dart'as http;

import 'package:mangerapp/views/home_screen/order_model.dart';

import '../../config/api/api_utils.dart';
import '../../config/custom_package.dart';
import '../../model/general_status.dart';
import '../../utils/ui/progress_hud.dart';





class OrderController extends GetxController {

  var productList = [].obs;
  var orderUrgent = [].obs;
  var selected='all'.obs;

var type='scheduled'.obs;






  //get cartList => productList.value.where((element) => element.counter!>0).toSet().toList();



  late var statusModel = GeneralStatusModel().obs;
  @override
  void onInit() {

   getProducts();

    super.onInit();
  }

  void getProducts() async {
print('ff');
    statusModel.value.updateStatus(GeneralStatus.waiting);
    SharedPreferences prefs =
    await SharedPreferences.getInstance();
    // Define the request headers
    var bearerToken=prefs.getString('token');
    final headers = <String, String>{
      'Content-Type': 'application/json',
      'Authorization': 'Bearer $bearerToken'
    };
    print(type);
    print(selected);
    var url = Uri.parse('https://news.wasiljo.com/public/api/v1/manager/orders/$selected/scheduled/get');
    var response = await http.get(
      url,headers: headers
    );
print(url);

    if ((response.statusCode >= 200 && response.statusCode < 300)) {
      productList.clear();
      print('response.statusCode  id${response.statusCode}');
      print('response.body  id${json.decode(response.body)['data']['orders']}');

      if (json.decode(response.body)['data']['orders'].isEmpty) {
        print('response.isEmpty  id${json.decode(response.body)['data']['orders']}');

        statusModel.value.updateStatus(GeneralStatus.error);
        statusModel.value.updateError("No Result Found");
        return;
      }
      List result = json.decode(response.body)['data']['orders'];
      print('start for');

      for (int index = 0; index < result.length; index++) {

        productList.add(Orders.fromJson(result[index]));

      }
      statusModel.value.updateStatus(GeneralStatus.success);

      return;
    }
    print(response.body);
    statusModel.value.updateStatus(GeneralStatus.error);
    statusModel.value.updateError("Something went wrong");
  }
  void getUrgentProducts() async {
print('ff');
    statusModel.value.updateStatus(GeneralStatus.waiting);
    SharedPreferences prefs =
    await SharedPreferences.getInstance();
    // Define the request headers
    var bearerToken=prefs.getString('token');
    final headers = <String, String>{
      'Content-Type': 'application/json',
      'Authorization': 'Bearer $bearerToken'
    };
    print(type);
    print('type');
    var url = Uri.parse('https://news.wasiljo.com/public/api/v1/manager/orders/all/urgent/get');
    var response = await http.get(
      url,headers: headers
    );
print(url);

    if ((response.statusCode >= 200 && response.statusCode < 300)) {
      productList.clear();
      print('response.statusCode  id${response.statusCode}');
      print('response.body  id${json.decode(response.body)['data']['orders']}');

      if (json.decode(response.body)['data']['orders'].isEmpty) {
        print('response.isEmpty  id${json.decode(response.body)['data']['orders']}');

        statusModel.value.updateStatus(GeneralStatus.error);
        statusModel.value.updateError("No Result Found");
        return;
      }
      List result = json.decode(response.body)['data']['orders'];
      print('start for');

      for (int index = 0; index < result.length; index++) {

        orderUrgent.add(Orders.fromJson(result[index]));

      }
      statusModel.value.updateStatus(GeneralStatus.success);

      return;
    }
    print(response.body);
    statusModel.value.updateStatus(GeneralStatus.error);
    statusModel.value.updateError("Something went wrong");
  }
  void statusOrder({
    required String id,required String status}) async {
    SharedPreferences prefs =
    await SharedPreferences.getInstance();
    // Define the request headers
    var bearerToken=prefs.getString('token');
    ProgressHud.shared.startLoading(Get.context);
    //Add FCM Token
    // PushNotificationsManager pushNotificationsManager = PushNotificationsManager();
    // await pushNotificationsManager.init();
    // String? fcmToken = await pushNotificationsManager.getToken();

    //URL
    var statusOrderUrl = Uri.parse(
        'https://news.wasiljo.com/public/api/v1/manager/order/$id/$status');
print(statusOrderUrl);






    //Response
    try {

      var response = await http.post(statusOrderUrl,
          headers: ApiUtil.getHeader(requestType: RequestType.PostWithAuth,token: bearerToken),
       );
      ProgressHud.shared.stopLoading();

print(response.body);
      if (response.statusCode == 200) {
        log("i am is the success method");

        Map<String, dynamic> data = json.decode(response.body);
  var masseage = data['message'];

print(masseage);

        Get.off(const homepage());
        Get.snackbar(status, '$masseage',
            backgroundColor:primaryColor, snackPosition: SnackPosition.BOTTOM,
            icon: const Icon(Icons.done_outline_rounded));
        return;
      }
      else {
        log("i am is the not 200 method");
        Map<String, dynamic> data = json.decode(response.body);
        log('error${data["error"]}');
        var errors = data['error'];
        Get.off(const homepage());
        Get.snackbar(status, '$errors',
            backgroundColor:Colors.redAccent, snackPosition: SnackPosition.BOTTOM,
            icon: const Icon(Icons.not_interested));

        return ;
      }
    } catch (e) {
      //If any server error...
      log("i am in the catch method");
      log(e.toString());
      return ;
    }
  }
  void assignOrderOrder({
    required String driverId,required String orderId}) async {
    SharedPreferences prefs =
    await SharedPreferences.getInstance();
    // Define the request headers
    var bearerToken=prefs.getString('token');
    ProgressHud.shared.startLoading(Get.context);
    //Add FCM Token
    // PushNotificationsManager pushNotificationsManager = PushNotificationsManager();
    // await pushNotificationsManager.init();
    // String? fcmToken = await pushNotificationsManager.getToken();

    //URL
    var statusOrderUrl = Uri.parse(
        'https://news.wasiljo.com/public/api/v1/manager/order/$orderId/assign-shop-to-delivery/$driverId');
    print(statusOrderUrl);






    //Response
    try {

      var response = await http.post(statusOrderUrl,
        headers: ApiUtil.getHeader(requestType: RequestType.PostWithAuth,token: bearerToken),
      );
      ProgressHud.shared.stopLoading();

      print(response.body);
      if (response.statusCode == 200) {
        log("i am is the success method");

        Map<String, dynamic> data = json.decode(response.body);
        var masseage = data['message'];

        print(masseage);

        Get.snackbar('status', '$masseage',
            backgroundColor:primaryColor, snackPosition: SnackPosition.BOTTOM,
            icon: const Icon(Icons.done_outline_rounded));
        return;
      }
      else {
        log("i am is the not 200 method");
        Map<String, dynamic> data = json.decode(response.body);
        log('error${data["error"]}');
        var errors = data['error'];
        Get.snackbar('filed', '$errors',
            backgroundColor:Colors.redAccent, snackPosition: SnackPosition.BOTTOM,
            icon: const Icon(Icons.not_interested));
        return ;
      }
    } catch (e) {
      //If any server error...
      log("i am in the catch method");
      log(e.toString());
      return ;
    }
  }

  get isWaiting => statusModel.value.status.value == GeneralStatus.waiting;

  get isError => statusModel.value.status.value == GeneralStatus.error;

  get isSuccess => statusModel.value.status.value == GeneralStatus.success;
}
