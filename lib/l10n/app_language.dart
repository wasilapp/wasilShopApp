import 'dart:ui';

import 'package:get/get.dart';
import 'package:scoped_model/scoped_model.dart';

class AppLanguage extends Model{
  static final AppLanguage _appLanguage = AppLanguage._shared(); // abc123

  // singelton

  factory AppLanguage() {

    return _appLanguage;
  }

  AppLanguage._shared(); // private named constructor

  Locale appLocale = Locale(Get.deviceLocale!.languageCode); // default ar

  void changeLanguage([String? lang]) {
    appLocale=Locale(lang!);
    Get.updateLocale(appLocale);
    // if (appLocale.languageCode == 'en') {
    //   appLocale = Locale('ar');
    // } else {
    //   appLocale = Locale('en');
    // }
    notifyListeners();
  }
}