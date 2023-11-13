import 'dart:convert';

import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:http/http.dart'as http;
class DriverController extends GetxController{
  var activeDrivers=[].obs;
  var waitAdminDrivers=[].obs;
  var pendingDrivers=[].obs;
 fetchData() async {

    SharedPreferences prefs= await SharedPreferences.getInstance();
    var bearerToken=   prefs.getString('token');
    print(bearerToken);
    final response = await http.get(
      Uri.parse(
          "https://news.wasiljo.com/public/api/v1/manager/delivery_boys/get_all"),
      headers: {'Authorization': 'Bearer $bearerToken'},
    );

    if (response.statusCode == 200) {
      final Map<String, dynamic> jsonResponse = json.decode(response.body);

      if (jsonResponse['status'] == true) {

          activeDrivers = jsonResponse['data']['shopDeliveryBoysAcceptAdmin'];
          pendingDrivers = jsonResponse['data']['shopDeliveryBoysPending'];
          waitAdminDrivers = jsonResponse['data']
          ['shopDeliveryBoysAcceptManager']
              .where((driver) => !activeDrivers
              .any((activeDriver) => activeDriver['id'] == driver['id']));

        print(activeDrivers);
        print("************************************************");
        print(pendingDrivers);
        print("************************************************");
        print(waitAdminDrivers);
      }
    } else {
      throw Exception("Failed to load data");
    }
  }
}