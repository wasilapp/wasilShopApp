import 'dart:convert';
import 'dart:developer';

import 'package:get/get.dart';
import 'package:mangerapp/views/transaction/transaction_model.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../model/general_status.dart';
import 'package:http/http.dart'as http;

class TransactionController extends GetxController{
  var deliveryBoy =[].obs;
  static DriverOneTransaction oneDriver=DriverOneTransaction();
  late var statusModel = GeneralStatusModel().obs;
  @override
  void onInit(){
    getProducts();
  }
  void getProducts() async {
        statusModel.value.updateStatus(GeneralStatus.waiting);
    SharedPreferences prefs =
    await SharedPreferences.getInstance();
    // Define the request headers
    var bearerToken=prefs.getString('token');
    var headers = {
      'Authorization': 'Bearer $bearerToken'
    };
    var response =await http.get( Uri.parse('https://news.wasiljo.com/public/api/v1/manager/get_transaction_delivery_boys_orders_total',
       ) ,headers:headers);




    if (response.statusCode == 200) {
      print(json.decode(response.body)['data']['shopDeliveryBoys']);
      List result=json.decode(response.body)['data']['shopDeliveryBoys'];
      if (json.decode(response.body)['data']['shopDeliveryBoys'].isEmpty) {
        print('response.isEmpty  id${json.decode(response.body)['data']['shopDeliveryBoys']}');

        statusModel.value.updateStatus(GeneralStatus.error);
        statusModel.value.updateError("No Result Found");
        return;
      }
else {
      for( int index=0; index<result.length;index++) {

        deliveryBoy.add(ShopDeliveryBoys.fromJson(result[index]));
        print(deliveryBoy);

      }}
      statusModel.value.updateStatus(GeneralStatus.success);
      print(await response.body);
      return;

    }
        statusModel.value.updateStatus(GeneralStatus.error);
    statusModel.value.updateError(response.body);


//     if ((response.statusCode >= 200 && response.statusCode < 300)) {
//       //deliveryBoy.clear();
//
//
//       if (json.decode(response.body)['data']['shopDeliveryBoys'].isEmpty) {
//         print('response.isEmpty  id${json.decode(response.body)['data']['shopDeliveryBoys']}');
//
//         statusModel.value.updateStatus(GeneralStatus.error);
//         statusModel.value.updateError("No Result Found");
//         return;
//       }
//       List result = json.decode(response.body)['data']['shopDeliveryBoys'];
//       print('start for');
//
//       for (int index = 0; index < result.length; index++) {
//
//         deliveryBoy.add(ShopDeliveryBoys.fromJson(result[index]));
// log(';;;;;;;');
//       }
//       statusModel.value.updateStatus(GeneralStatus.success);
//
//       return;
//     }
//     print(response.body);
//     statusModel.value.updateStatus(GeneralStatus.error);
//     statusModel.value.updateError(response.body);
  }
  void getTransactionId({id,startDate,endDate}) async {
    log('$id$startDate$endDate');
        statusModel.value.updateStatus(GeneralStatus.waiting);
    SharedPreferences prefs =
    await SharedPreferences.getInstance();
    // Define the request headers
    var bearerToken=prefs.getString('token');
    var headers = {
      'Authorization': 'Bearer $bearerToken'
    };  var body = {
       'startDate':startDate,
          'endDate': endDate
    };
    var response =await http.post( Uri.parse('https://news.wasiljo.com/public/api/v1/manager/get_orders_date_not_paid_cache/$id',
       ) ,headers:headers);




    if (response.statusCode == 200) {
      print(json.decode(response.body)['data']['deliveryBoy']);
      var result=json.decode(response.body)['data']['deliveryBoy'];
      if (json.decode(response.body)['data']['deliveryBoy'].isEmpty) {
        print('response.isEmpty  id${json.decode(response.body)['data']['deliveryBoy']}');

        statusModel.value.updateStatus(GeneralStatus.error);
        statusModel.value.updateError("No Result Found");
        return;
      }
else {

         oneDriver = DriverOneTransaction.fromJson(result);

        print(oneDriver);

      }
      statusModel.value.updateStatus(GeneralStatus.success);
      print(await response.body);
      return;

    }
        statusModel.value.updateStatus(GeneralStatus.error);
    statusModel.value.updateError(response.body);


//     if ((response.statusCode >= 200 && response.statusCode < 300)) {
//       //deliveryBoy.clear();
//
//
//       if (json.decode(response.body)['data']['shopDeliveryBoys'].isEmpty) {
//         print('response.isEmpty  id${json.decode(response.body)['data']['shopDeliveryBoys']}');
//
//         statusModel.value.updateStatus(GeneralStatus.error);
//         statusModel.value.updateError("No Result Found");
//         return;
//       }
//       List result = json.decode(response.body)['data']['shopDeliveryBoys'];
//       print('start for');
//
//       for (int index = 0; index < result.length; index++) {
//
//         deliveryBoy.add(ShopDeliveryBoys.fromJson(result[index]));
// log(';;;;;;;');
//       }
//       statusModel.value.updateStatus(GeneralStatus.success);
//
//       return;
//     }
//     print(response.body);
//     statusModel.value.updateStatus(GeneralStatus.error);
//     statusModel.value.updateError(response.body);
  }
  get isWaiting => statusModel.value.status.value == GeneralStatus.waiting;

  get isError => statusModel.value.status.value == GeneralStatus.error;

  get isSuccess => statusModel.value.status.value == GeneralStatus.success;
}
