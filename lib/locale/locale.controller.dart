
import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';
import 'package:get/get.dart';




import 'package:firebase_core/firebase_core.dart';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';


class MyServices extends GetxService {

  late SharedPreferences sharedPreferences;

  Future<MyServices> init() async {
    await Firebase.initializeApp();
    sharedPreferences = await SharedPreferences.getInstance();
    return this;
  }


}

initialServices() async {
  await Get.putAsync(() => MyServices().init());
}

class LocaleController extends GetxController {
  Locale? language;

  MyServices myServices = Get.find();



  changeLang(String langcode) {
    Locale locale = Locale('ar');
    myServices.sharedPreferences.setString("lang", 'ar');
    //appTheme = langcode == "ar" ? themeArabic : themeEnglish;
   // Get.changeTheme(appTheme);
    Get.updateLocale(locale);
  }

  requestPerLocation() async {
    bool serviceEnabled;
    LocationPermission permission;
    serviceEnabled = await Geolocator.isLocationServiceEnabled();
    if (!serviceEnabled) {
      return Get.snackbar("تنبيه", "الرجاء تشغيل خدمو تحديد الموقع");
    }
    permission = await Geolocator.checkPermission();
    if (permission == LocationPermission.denied) {
      permission = await Geolocator.requestPermission();
      if (permission == LocationPermission.denied) {
        return Get.snackbar("تنبيه", "الرجاء اعطاء صلاحية الموقع للتطبيق");
      }
    }

    if (permission == LocationPermission.deniedForever) {
      // Permissions are denied forever, handle appropriately.
      return Get.snackbar("تنبيه", "لا يمكن استعمال التطبيق من دون اللوكيشين");
    }
  }

  @override
  void onInit() {
    requestPerLocation();
    String? sharedPrefLang = myServices.sharedPreferences.getString("lang");
    language = const Locale("ar");
    // if (sharedPrefLang == "ar") {
    //   language = const Locale("ar");
    //  // appTheme = themeArabic;
    // } else if (sharedPrefLang == "en") {
    //   language = const Locale("en");
    //   // appTheme = themeEnglish;
    // } else {
    //   language = Locale(Get.deviceLocale!.languageCode);
    //
    // }
    super.onInit();
  }
}