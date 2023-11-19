import 'dart:convert';

import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:http/http.dart'as http;

import '../../config/custom_package.dart';
import '../../utils/colors.dart';
import 'all_item_model.dart';
class ItemsController extends GetxController{
  @override
  void onInit(){

    fetchSubCategories();
    //fetchWalletCategories();
  }
  var subCategoriesPendung = [].obs;
  var subCategoriesActive = [].obs;
  Future<void> deleteItem( id) async {
    SharedPreferences prefs =
        await SharedPreferences.getInstance();
    // Define the request headers
    var bearerToken=prefs.getString('token');
    var headers = {
      'Authorization': 'Bearer $bearerToken'
    };
    var response =await http.post(
        Uri.parse('https://news.wasiljo.com/public/api/v1/manager/subcategories/remove/$id'),
        headers: headers);





    if (response.statusCode == 200) {
      print('object');
      print(await response.body);

      Get.snackbar('deleted', '',
          backgroundColor:primaryColor, snackPosition: SnackPosition.BOTTOM,
          icon: const Icon(Icons.done_outline_rounded));

    }
    else {
      print(response.body);
    }

  }
  void fetchSubCategories() async {
    SharedPreferences prefs =
    await SharedPreferences.getInstance();
    var bearerToken =prefs.getString('token');

    final response = await http.get(Uri.parse(
      'https://news.wasiljo.com/public/api/v1/manager/mySubCategories',
    ),    headers: {'Authorization': 'Bearer $bearerToken'},);

    if (response.statusCode == 200) {
      print('yes');
      final jsonData = json.decode(response.body);
     List   resultSubCategoriesPendung = jsonData['data']['subCategoriesPending'];
      List resultSubCategoriesActive = jsonData['data']['subCategoriesAccepted'];

      print('start for');

      for (int index = 0; index < resultSubCategoriesPendung.length; index++) {

        subCategoriesPendung.add(SubCategoriesPending.fromJson(resultSubCategoriesPendung[index]));

      }
      for (int index = 0; index < resultSubCategoriesActive.length; index++) {

        subCategoriesActive.add(SubCategoriesAccepted.fromJson(resultSubCategoriesActive[index]));

      }
      print('subCategoriesPendung');
      print(subCategoriesActive.length);
      print(subCategoriesPendung.length);
      print(subCategoriesPendung);

    } else {
      throw Exception('Failed to load subcategories');
    }}
}