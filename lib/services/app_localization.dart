import 'dart:convert';
import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:shared_preferences/shared_preferences.dart';

class AllLanguage {
  static List<String> supportedLanguages = ['English', 'Arabic'];

  static List<String> supportedLanguagesCode = ['en', 'ar'];


  //If you use app localization packages
  static List<Locale> supportedLocales = [
    const Locale('en', ''),
    const Locale('ar', ''),

  ];

  static Future<void> changeLanguage(String langCode) async {
    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
    sharedPreferences.setString("langCode", langCode);
  }

  static Future<String> getLanguage() async {
    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
    String? langCode = sharedPreferences.getString("langCode");
    langCode ??= supportedLanguagesCode.first;
    return langCode;
  }
}

class Translator {
  static Map<String, String>? _localizedStrings;

  static Future<bool> load(String langCode) async {
    AllLanguage.changeLanguage(langCode);
    String jsonString =
    await rootBundle.loadString('assets/lang/$langCode.json');
    Map<String, dynamic> jsonLanguageMap = json.decode(jsonString);
    _localizedStrings = jsonLanguageMap.map((key, value) {
      return MapEntry(key, value.toString());
    });
    return true;
  }

  // called from every screens which needs a localized text
  static String translate(String text) {
    if (_localizedStrings != null) {
      String? value = _localizedStrings![text];
      return value ?? text;
    }
    return text;
  }
}