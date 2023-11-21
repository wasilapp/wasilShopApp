import 'dart:convert';
import 'dart:developer';
import 'dart:io';

import 'package:dio/dio.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../model/response.dart';

enum AuthType { VERIFIED, LOGIN, NOT_FOUND }

class AuthController {



  static dynamic registerUser(
      String shopNameArabic,
      String mangerNameArabic,
      String shopNameEnglish,
      String deliveryRange,
      String mangerNameEnglish,
      String email,
      String password,
      mobile,
      category,
      File? mangerLicense,
      File? profilePic ,
      address,
      lat,
      long) async {




    final dio = Dio();


    // Create a new FormData object
    final formData = FormData();

    // Add text data to the form data
    formData.fields.addAll([
      MapEntry('shop[name][en]', shopNameEnglish),
      MapEntry('shop[name][ar]', shopNameArabic),
      MapEntry('password', password),
      MapEntry('mobile', mobile),
      MapEntry('email', email),
      MapEntry('manager[name][ar]', mangerNameArabic),
      MapEntry('manager[name][en]', mangerNameEnglish),
      MapEntry('shop[category]', category==null? "" : category.id.toString()),
      MapEntry('address', address),
      MapEntry('latitude', lat),
      MapEntry('longitude', long),
      MapEntry('delivery_range', deliveryRange ?? '50000'),

    ]);



    if(profilePic!=null){

      formData.files.addAll([

        MapEntry(
          'profile_img',
          await MultipartFile.fromFile(
            profilePic.path,
            filename: profilePic.path.split('/').last,
          ),
        ),
      ]);

    }

    if(mangerLicense!=null){

      formData.files.addAll([

        MapEntry(
          'driving_license',
          await MultipartFile.fromFile(
            mangerLicense.path,
            filename: mangerLicense.path.split('/').last,
          ),
        ),
      ]);

    }

    final headers = {
      'Content-Type': 'application/json',
      "Accept": "application/json",

    };

    try {
      final response = await dio.post(
     "https://admin.wasiljo.com/public/api/v1/manager/register",
        data: formData ,
        options: Options(headers: headers),
      );
      log("Error : ${response.data}");

      MyResponse myResponse = MyResponse(response.statusCode);

      if (response.statusCode == 200) {
        SharedPreferences sharedPreferences =
        await SharedPreferences.getInstance();

        Map<String, dynamic> data = response.data;
        Map<String, dynamic> user = data['delivery_boy'];
        String token = data['token'];
        log(data['type'].toString());
        //await saveUser(user,data['type'].toString());
        await sharedPreferences.setString('token', token);

        myResponse.success = true;
      } else {

        Map<String, dynamic> data = json.decode(response.data!);

        myResponse.success = false;
        myResponse.setError(data);

      }

      return myResponse;
    } on DioError catch (e) {

      MyResponse myResponse = MyResponse(422);
      Map<String, dynamic> data = json.decode(e.response.toString());
      log(data.toString());
      myResponse.success = false;
      myResponse.setError(data);

      log("Error:${e.response}");
      log(e.toString());
      return myResponse;

      //  return MyResponse.makeServerProblemError();
    }
  }

  /*-----------------   Forgot Password     ----------------------*/



  /*-----------------   Log Out    ----------------------*/



  /*-----------------   Save user in cache   ----------------------*/





  /*-----------------   Get user from cache     ----------------------*/



  /*-----------------   Update user     ----------------------*/



  /*-----------------   Check user login or not     ----------------------*/

  static Future<AuthType> userAuthType() async {
    try {
      SharedPreferences sharedPreferences =
      await SharedPreferences.getInstance();

      String? token = sharedPreferences.getString("token");
      bool mobileVerified =
          sharedPreferences.getBool('mobile_verified') ?? false;
      if (token == null) {
        return AuthType.NOT_FOUND;
      } else if (!mobileVerified) {
        return AuthType.LOGIN;
      }
      return AuthType.VERIFIED;
    } catch (e) {}
    return AuthType.NOT_FOUND;
  }

  /*-----------------   Get user login token     ----------------------*/

  static Future<String?> getApiToken() async {
    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();



    return sharedPreferences.getString("token");
  }

  /*-----------------   Change status (online/offline)     ----------------------*/



}
