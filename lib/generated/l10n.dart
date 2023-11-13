// GENERATED CODE - DO NOT MODIFY BY HAND
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'intl/messages_all.dart';

// **************************************************************************
// Generator: Flutter Intl IDE plugin
// Made by Localizely
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, lines_longer_than_80_chars
// ignore_for_file: join_return_with_assignment, prefer_final_in_for_each
// ignore_for_file: avoid_redundant_argument_values, avoid_escaping_inner_quotes

class S {
  S();

  static S? _current;

  static S get current {
    assert(_current != null,
        'No instance of S was loaded. Try to initialize the S delegate before accessing S.current.');
    return _current!;
  }

  static const AppLocalizationDelegate delegate = AppLocalizationDelegate();

  static Future<S> load(Locale locale) {
    final name = (locale.countryCode?.isEmpty ?? false)
        ? locale.languageCode
        : locale.toString();
    final localeName = Intl.canonicalizedLocale(name);
    return initializeMessages(localeName).then((_) {
      Intl.defaultLocale = localeName;
      final instance = S();
      S._current = instance;

      return instance;
    });
  }

  static S of(BuildContext context) {
    final instance = S.maybeOf(context);
    assert(instance != null,
        'No instance of S present in the widget tree. Did you add S.delegate in localizationsDelegates?');
    return instance!;
  }

  static S? maybeOf(BuildContext context) {
    return Localizations.of<S>(context, S);
  }

  /// `contact_us`
  String get contactus {
    return Intl.message(
      'contact_us',
      name: 'contactus',
      desc: '',
      args: [],
    );
  }

  /// `English`
  String get english {
    return Intl.message(
      'English',
      name: 'english',
      desc: '',
      args: [],
    );
  }

  /// `Transaction`
  String get transaction {
    return Intl.message(
      'Transaction',
      name: 'transaction',
      desc: '',
      args: [],
    );
  }

  /// `Transaction`
  String get changelanguage {
    return Intl.message(
      'Transaction',
      name: 'changelanguage',
      desc: '',
      args: [],
    );
  }

  /// `Transaction`
  String get arabic {
    return Intl.message(
      'Transaction',
      name: 'arabic',
      desc: '',
      args: [],
    );
  }

  /// `Sign in`
  String get signIn {
    return Intl.message(
      'Sign in',
      name: 'signIn',
      desc: '',
      args: [],
    );
  }

  /// `Please enter your  password`
  String get pleaseEnterYourPassword {
    return Intl.message(
      'Please enter your  password',
      name: 'pleaseEnterYourPassword',
      desc: '',
      args: [],
    );
  }

  /// `password length at least 8 character`
  String get passwordLengthAtLeast8Character {
    return Intl.message(
      'password length at least 8 character',
      name: 'passwordLengthAtLeast8Character',
      desc: '',
      args: [],
    );
  }

  /// `password`
  String get password {
    return Intl.message(
      'password',
      name: 'password',
      desc: '',
      args: [],
    );
  }

  /// `Please enter your mobile number`
  String get pleaseEnterYourMobileNumber {
    return Intl.message(
      'Please enter your mobile number',
      name: 'pleaseEnterYourMobileNumber',
      desc: '',
      args: [],
    );
  }

  /// `mobile number not eqiual 9`
  String get mobileNumberNotEqiual9 {
    return Intl.message(
      'mobile number not eqiual 9',
      name: 'mobileNumberNotEqiual9',
      desc: '',
      args: [],
    );
  }

  /// `Don't have an Account?`
  String get dontHaveAnAccount {
    return Intl.message(
      'Don\'t have an Account?',
      name: 'dontHaveAnAccount',
      desc: '',
      args: [],
    );
  }

  /// `SignUp`
  String get signup {
    return Intl.message(
      'SignUp',
      name: 'signup',
      desc: '',
      args: [],
    );
  }

  /// `SignIn with vistor`
  String get signinWithVistor {
    return Intl.message(
      'SignIn with vistor',
      name: 'signinWithVistor',
      desc: '',
      args: [],
    );
  }

  /// `mobile Number`
  String get mobileNumber {
    return Intl.message(
      'mobile Number',
      name: 'mobileNumber',
      desc: '',
      args: [],
    );
  }

  /// `Sign Up`
  String get signUp {
    return Intl.message(
      'Sign Up',
      name: 'signUp',
      desc: '',
      args: [],
    );
  }

  /// `Please enter your Email number`
  String get pleaseEnterYourEmailNumber {
    return Intl.message(
      'Please enter your Email number',
      name: 'pleaseEnterYourEmailNumber',
      desc: '',
      args: [],
    );
  }

  /// `Email`
  String get email {
    return Intl.message(
      'Email',
      name: 'email',
      desc: '',
      args: [],
    );
  }

  /// `Please enter your  shop Name English`
  String get pleaseEnterYourShopNameEnglish {
    return Intl.message(
      'Please enter your  shop Name English',
      name: 'pleaseEnterYourShopNameEnglish',
      desc: '',
      args: [],
    );
  }

  /// `please only character in English`
  String get pleaseOnlyCharacterInEnglish {
    return Intl.message(
      'please only character in English',
      name: 'pleaseOnlyCharacterInEnglish',
      desc: '',
      args: [],
    );
  }

  /// `Shop name in English`
  String get shopNameInEnglish {
    return Intl.message(
      'Shop name in English',
      name: 'shopNameInEnglish',
      desc: '',
      args: [],
    );
  }

  /// `Please enter your shop Name Arabic`
  String get pleaseEnterYourShopNameArabic {
    return Intl.message(
      'Please enter your shop Name Arabic',
      name: 'pleaseEnterYourShopNameArabic',
      desc: '',
      args: [],
    );
  }

  /// `please only character in Arabic`
  String get pleaseOnlyCharacterInArabic {
    return Intl.message(
      'please only character in Arabic',
      name: 'pleaseOnlyCharacterInArabic',
      desc: '',
      args: [],
    );
  }

  /// `Shop name in arabic`
  String get shopNameInArabic {
    return Intl.message(
      'Shop name in arabic',
      name: 'shopNameInArabic',
      desc: '',
      args: [],
    );
  }

  /// `Please enter your manger Name English`
  String get pleaseEnterYourMangerNameEnglish {
    return Intl.message(
      'Please enter your manger Name English',
      name: 'pleaseEnterYourMangerNameEnglish',
      desc: '',
      args: [],
    );
  }

  /// `Manger name in English`
  String get mangerNameInEnglish {
    return Intl.message(
      'Manger name in English',
      name: 'mangerNameInEnglish',
      desc: '',
      args: [],
    );
  }

  /// `Please enter your manger Name Arabic`
  String get pleaseEnterYourMangerNameArabic {
    return Intl.message(
      'Please enter your manger Name Arabic',
      name: 'pleaseEnterYourMangerNameArabic',
      desc: '',
      args: [],
    );
  }

  /// `Please enter only character   Arabic`
  String get pleaseEnterOnlyCharacterArabic {
    return Intl.message(
      'Please enter only character   Arabic',
      name: 'pleaseEnterOnlyCharacterArabic',
      desc: '',
      args: [],
    );
  }

  /// `Manger name in arabic`
  String get mangerNameInArabic {
    return Intl.message(
      'Manger name in arabic',
      name: 'mangerNameInArabic',
      desc: '',
      args: [],
    );
  }

  /// `Please enter your address`
  String get pleaseEnterYourAddress {
    return Intl.message(
      'Please enter your address',
      name: 'pleaseEnterYourAddress',
      desc: '',
      args: [],
    );
  }

  /// `Please enter your profilePic`
  String get pleaseEnterYourProfilepic {
    return Intl.message(
      'Please enter your profilePic',
      name: 'pleaseEnterYourProfilepic',
      desc: '',
      args: [],
    );
  }

  /// `profile_pic`
  String get profilepic {
    return Intl.message(
      'profile_pic',
      name: 'profilepic',
      desc: '',
      args: [],
    );
  }

  /// `Please enter your licencePic`
  String get pleaseEnterYourLicencepic {
    return Intl.message(
      'Please enter your licencePic',
      name: 'pleaseEnterYourLicencepic',
      desc: '',
      args: [],
    );
  }

  /// `licencePic`
  String get licencepic {
    return Intl.message(
      'licencePic',
      name: 'licencepic',
      desc: '',
      args: [],
    );
  }

  /// `Have Account ?`
  String get haveAccount {
    return Intl.message(
      'Have Account ?',
      name: 'haveAccount',
      desc: '',
      args: [],
    );
  }

  /// `SignIn`
  String get signin {
    return Intl.message(
      'SignIn',
      name: 'signin',
      desc: '',
      args: [],
    );
  }

  /// `Gallery`
  String get gallery {
    return Intl.message(
      'Gallery',
      name: 'gallery',
      desc: '',
      args: [],
    );
  }

  /// `Camera`
  String get camera {
    return Intl.message(
      'Camera',
      name: 'camera',
      desc: '',
      args: [],
    );
  }

  /// `Scheduled Order`
  String get scheduledOrder {
    return Intl.message(
      'Scheduled Order',
      name: 'scheduledOrder',
      desc: '',
      args: [],
    );
  }

  /// `Nearest Order`
  String get nearestOrder {
    return Intl.message(
      'Nearest Order',
      name: 'nearestOrder',
      desc: '',
      args: [],
    );
  }

  /// `orders`
  String get orders {
    return Intl.message(
      'orders',
      name: 'orders',
      desc: '',
      args: [],
    );
  }

  /// `Driver`
  String get driver {
    return Intl.message(
      'Driver',
      name: 'driver',
      desc: '',
      args: [],
    );
  }

  /// `Profile`
  String get profile {
    return Intl.message(
      'Profile',
      name: 'profile',
      desc: '',
      args: [],
    );
  }

  /// `Coupon`
  String get coupon {
    return Intl.message(
      'Coupon',
      name: 'coupon',
      desc: '',
      args: [],
    );
  }

  /// `Items`
  String get items {
    return Intl.message(
      'Items',
      name: 'items',
      desc: '',
      args: [],
    );
  }

  /// `share`
  String get share {
    return Intl.message(
      'share',
      name: 'share',
      desc: '',
      args: [],
    );
  }
}

class AppLocalizationDelegate extends LocalizationsDelegate<S> {
  const AppLocalizationDelegate();

  List<Locale> get supportedLocales {
    return const <Locale>[
      Locale.fromSubtags(languageCode: 'en'),
      Locale.fromSubtags(languageCode: 'ar'),
    ];
  }

  @override
  bool isSupported(Locale locale) => _isSupported(locale);
  @override
  Future<S> load(Locale locale) => S.load(locale);
  @override
  bool shouldReload(AppLocalizationDelegate old) => false;

  bool _isSupported(Locale locale) {
    for (var supportedLocale in supportedLocales) {
      if (supportedLocale.languageCode == locale.languageCode) {
        return true;
      }
    }
    return false;
  }
}
