// import 'dart:convert';
// import 'dart:developer';
//
// import 'package:DeliveryBoyApp/api/api_util.dart';
// import 'package:DeliveryBoyApp/controllers/AuthController.dart';
// import 'package:DeliveryBoyApp/models/MyResponse.dart';
// import 'package:DeliveryBoyApp/services/Network.dart';
// import 'package:DeliveryBoyApp/utils/InternetUtils.dart';
//
// import 'Categories.dart';
//
//
// class CategoryController {
//
//   //------------------------ Get all categories -----------------------------------------//
//   static Future<MyResponse<List<Category>>> getAllCategory() async {
//     print("category sttart");
//       String CATEGORIES = "categories/";
//
//
//     //Getting User Api Token
//     String? token = await AuthController.getApiToken();
//     String url = "https://wasiljo.com/public/api/v1/user/" + CATEGORIES;
//     Map<String, String> headers =
//         ApiUtil.getHeader(requestType: RequestType.GetWithAuth,);
//
//     //Check Internet
//     bool isConnected = await InternetUtils.checkConnection();
//     if (!isConnected) {
//       return MyResponse.makeInternetConnectionError<List<Category>>();
//     }
//
//     try {
//       NetworkResponse response = await Network.get(url, headers: headers);
//       MyResponse<List<Category>> myResponse = MyResponse(response.statusCode);
//       log(response.body.toString());
//       if (response.statusCode == 200) {
//         log("category done");
//
//         List<Category> list =
//             categoryFromMap(response.body!);
//           log("category done 2");
//         myResponse.success = true;
//         myResponse.data = list;
//
//       } else {
//         print("category error");
//         myResponse.setError(json.decode(response.body!));
//       }
//
//       return myResponse;
//     } catch (e) {
//       //If any server error...
//       return MyResponse.makeServerProblemError<List<Category>>();
//     }
//   }
//
//
//   //------------------------ Get category SubCategory -----------------------------------------//
//
//
//   //------------------------ Get category shop -----------------------------------------//
//
//   static Future<MyResponse<List<Shop>>> getCategoryShops(int categoryId) async {
//       String CATEGORIES = "categories/";
// const String SHOPS = "shops/";
//     //Getting User Api Token
//     String? token = await AuthController.getApiToken();
//     String url = ApiUtil.MAIN_API_URL +
//         CATEGORIES +
//         categoryId.toString() +
//         "/" +
//       SHOPS;
//     Map<String, String> headers =
//     ApiUtil.getHeader(requestType: RequestType.GetWithAuth, token: token);
//
//     //Check Internet
//     bool isConnected = await InternetUtils.checkConnection();
//     if (!isConnected) {
//       return MyResponse.makeInternetConnectionError<List<Shop>>();
//     }
//
//     try {
//       NetworkResponse response = await Network.get(url, headers: headers);
//       MyResponse<List<Shop>> myResponse = MyResponse(response.statusCode);
//       print("shop sta");
//       if (response.statusCode == 200) {
//         print("shop done");
//         myResponse.success = true;
//         print(response.body);
//         myResponse.data = shopsFromMap(response.body!);
//
//       } else {
//         print("shop error");
//         myResponse.setError(json.decode(response.body!));
//       }
//
//       return myResponse;
//     } catch (e) {
//       print(e.toString());
//       //If any server error...
//       return MyResponse.makeServerProblemError<List<Shop>>();
//     }
//   }
//
//
//
//
// }
import 'dart:convert';
import 'dart:developer';

import 'package:dio/dio.dart';
import 'package:get/get.dart';
import 'package:http/http.dart'as http;
import 'package:shared_preferences/shared_preferences.dart';
import '../../config/api/api_utils.dart';
import '../../model/general_status.dart';
import '../../utils/ui/progress_hud.dart';
import '../all_items/all_item_model.dart';
import '../home_screen/home_screen.dart';


class SubCategoryController extends GetxController {
  var category = [].obs;
  var shops = [].obs;
  late var statusModel=GeneralStatusModel().obs;
  @override
  void onInit(){print('satat1');
    getSubCategory();

  }
  //------------------------ Get all categories -----------------------------------------//
  Future<void> getSubCategory() async {
    statusModel.value.updateStatus(GeneralStatus.waiting);
    print('satat1');
    var url = Uri.parse("https://admin.wasiljo.com/public/api/v1/manager/mySubCategories");
    SharedPreferences prefs =
    await SharedPreferences.getInstance();
    // Define the request headers
    var bearerToken=prefs.getString('token');
    final headers = {

      'Authorization': 'Bearer $bearerToken'
    };
    var response= await http.get(url,headers: headers);
    if((response.statusCode>=200&& response.statusCode<300)){
      print('satat1');
      if(json.decode(response.body)['data']['subCategoriesAccepted'].isEmpty){
        print('satat1');
        print(json.decode(response.body)['data']['subCategoriesAccepted']);
        print(json.decode(response.body)['data']['subCategoriesAccepted'].isEmpty);
        statusModel.value.updateStatus(GeneralStatus.error);
        statusModel.value.updateError('some thing error');
        return ;
      }
      statusModel.value.updateStatus(GeneralStatus.success);
      print('satat111');
      List listSubCategory=json.decode(response.body)['data']['subCategoriesAccepted'];

      for(int i=0;i<listSubCategory.length;i++){
        print('satat1');
        category.add(SubCategoriesAccepted.fromJson(listSubCategory[i]));

      }
      return;
    }
    statusModel.value.updateStatus(GeneralStatus.error);
    statusModel.value.updateError('some thing error');


  }

  get isWaiting=>statusModel.value.status.value==GeneralStatus.waiting;
  get isError=>statusModel.value.status.value==GeneralStatus.error;
  get isSuccess=>statusModel.value.status.value==GeneralStatus.success;
}










