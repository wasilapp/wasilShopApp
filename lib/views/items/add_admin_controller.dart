import 'dart:convert';
import 'dart:developer';

import 'package:get/get.dart';
import 'package:http/http.dart'as http;
import 'package:shared_preferences/shared_preferences.dart';
import '../../model/general_status.dart';
import 'item_admin_model.dart';

class ItemController extends GetxController{
  var subCategoriesActive = [].obs;
  var walletCategoriesActive = [].obs;
var subCategoriesPendung = [].obs;
  var walletCategoriesPendung = [].obs;
  var category = [].obs;

  late var statusModel=GeneralStatusModel().obs;
  @override
  void onInit(){
    getCategory();
    fetchSubCategories();
    fetchWalletCategories();
  }
  //------------------------ Get all categories -----------------------------------------//
  Future<void> getCategory() async {
    SharedPreferences prefs =
    await SharedPreferences.getInstance();
    // Define the request headers
    var bearerToken=prefs.getString('token');
    final headers = {

      'Authorization': 'Bearer $bearerToken'
    };
    statusModel.value.updateStatus(GeneralStatus.waiting);
    var url = Uri.parse(
        "https://admin.wasiljo.com/public/api/v1/manager/categories");
    var response= await http.get(url, headers: headers);
    if((response.statusCode>=200&& response.statusCode<300)){
      if(response.body.isEmpty){
        statusModel.value.updateStatus(GeneralStatus.error);
        statusModel.value.updateError('some thing error');
        return ;
      }
      statusModel.value.updateStatus(GeneralStatus.success);
print(json.decode(response.body)['data']['allCategories'][0]['subAdminCategories']);
      List listCategory=json.decode(response.body)['data']['allCategories'][0]['subAdminCategories'];

      for(int i=0;i<listCategory.length;i++){
log('lllllllllllllllllllllllllll');
        category.add(SubAdminCategories.fromJson(listCategory[i]));

      }
      print(response.body);
      return;
    }
    log(response.body);
    statusModel.value.updateStatus(GeneralStatus.error);
    statusModel.value.updateError('some thing error');


  }
  //------------------------ Get all categories -----------------------------------------//
 void fetchSubCategories() async {
    SharedPreferences prefs =
    await SharedPreferences.getInstance();
    var bearerToken =prefs.getString('token');

    final response = await http.get(Uri.parse(
      'https://admin.wasiljo.com/public/api/v1/manager/mySubCategories',
    ),    headers: {'Authorization': 'Bearer $bearerToken'},);

    if (response.statusCode == 200) {
      print('yes');
      final jsonData = json.decode(response.body);

        subCategoriesPendung.value = jsonData['data']['subCategoriesPending'];
        subCategoriesActive.value = jsonData['data']['subCategoriesAccepted'];
        print('subCategoriesPendung');
        print(subCategoriesPendung.length);
        print(subCategoriesPendung.value);

    } else {
      throw Exception('Failed to load subcategories');
    }}
fetchWalletCategories() async {
    SharedPreferences prefs =
    await SharedPreferences.getInstance();
    var bearerToken =prefs.getString('token');

    final response = await http.get(Uri.parse(
      'https://admin.wasiljo.com/public/api/v1/manager/my-wallets',
    ),    headers: {'Authorization': 'Bearer $bearerToken'},);

    if (response.statusCode == 200) {
      print('yes');
      final jsonData = json.decode(response.body);

        walletCategoriesPendung.value = jsonData['data']['walletsPending'];
        walletCategoriesActive.value  = jsonData['data']['walletsAccepted'];
        print(walletCategoriesPendung.value );

    } else {
      throw Exception('Failed to load subcategories');
    }}
  get isWaiting=>statusModel.value.status.value==GeneralStatus.waiting;
  get isError=>statusModel.value.status.value==GeneralStatus.error;
  get isSuccess=>statusModel.value.status.value==GeneralStatus.success;
}







