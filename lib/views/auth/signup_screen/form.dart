import 'dart:developer';

import 'package:dio/dio.dart';
import 'package:get/get_utils/src/extensions/export.dart';
import 'package:sizer/sizer.dart';
import '../../../config/custom_package.dart';

import '../../../generated/l10n.dart';
import '../../../services/push_notification.dart';
import '../signin_screen/login_screen.dart';

class SignupForm extends StatefulWidget {
  const SignupForm({super.key});

  @override
  State<SignupForm> createState() => _SignupFormState();
}

class _SignupFormState extends State<SignupForm> {
  TextEditingController mobile = TextEditingController();
  TextEditingController email = TextEditingController();
  TextEditingController shopNameEnglish = TextEditingController();
  TextEditingController shopNameArabic = TextEditingController();
  TextEditingController mangerNameEnglish = TextEditingController();
  TextEditingController mangerNameArabic = TextEditingController();

  TextEditingController password = TextEditingController();
  TextEditingController profile = TextEditingController();
  TextEditingController licence = TextEditingController();
  TextEditingController address = TextEditingController();
  bool showPassword = false;
  String countryCode = "962";
  List<String> errorMessages = [];
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();
  File? profilePic;
  final picker = ImagePicker();

  File? licencePic;
  void showImagePicker(BuildContext context) {
    showModalBottomSheet(
        context: context,
        builder: (builder) {
          return Card(
            child: Container(
                width: MediaQuery.of(context).size.width,
                height: MediaQuery.of(context).size.height / 5.2,
                margin: const EdgeInsets.only(top: 8.0),
                padding: const EdgeInsets.all(12),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Expanded(
                        child: InkWell(
                          child:  Column(
                            children: [
                              const Icon(
                                Icons.image,
                                size: 60.0,
                                color: primaryColor,
                              ),
                              SizedBox(height: 2.0.h),
                              Text(
                                S.of(context).gallery,
                                textAlign: TextAlign.center,
                                style: const TextStyle(fontSize: 16, color: Colors.black),
                              )
                            ],
                          ),
                          onTap: () {
                            getImageFromGallery();
                            Navigator.pop(context);
                          },
                        )),
                    Expanded(
                        child: InkWell(
                          child:  SizedBox(
                            child: Column(
                              children: [
                                const Icon(
                                  Icons.camera_alt,
                                  size: 60.0,
                                  color: primaryColor,
                                ),
                                SizedBox(height: 2.0.h),
                                Text(
                                  S.of(context).camera,
                                  textAlign: TextAlign.center,
                                  style:
                                  const TextStyle(fontSize: 16, color: Colors.black),
                                )
                              ],
                            ),
                          ),
                          onTap: () {
                            getImageFromCamera();
                            Navigator.pop(context);
                          },
                        ))
                  ],
                )),
          );
        });
  }

  void showImagePicker2(BuildContext context) {
    showModalBottomSheet(
        context: context,
        builder: (builder) {
          return Card(
            child: Container(
                width: MediaQuery.of(context).size.width,
                height: MediaQuery.of(context).size.height / 5.2,
                margin: const EdgeInsets.only(top: 8.0),
                padding: const EdgeInsets.all(12),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Expanded(
                        child: InkWell(
                          child:  Column(
                            children: [
                              const Icon(
                                Icons.image,
                                size: 60.0,
                                color: primaryColor,
                              ),
                              SizedBox(height: 2.0.h),
                              const Text(
                                "Gallery",
                                textAlign: TextAlign.center,
                                style: TextStyle(fontSize: 16, color: Colors.black),
                              )
                            ],
                          ),
                          onTap: () {
                            getImageLicenseFromGallery();
                            Navigator.pop(context);
                          },
                        )),
                    Expanded(
                        child: InkWell(
                          child:  SizedBox(
                            child: Column(
                              children: [
                                const Icon(
                                  Icons.camera_alt,
                                  size: 60.0,
                                  color: primaryColor,
                                ),
                                SizedBox(height: 2.0.h),
                                const Text(
                                  "Camera",
                                  textAlign: TextAlign.center,
                                  style:
                                  TextStyle(fontSize: 16, color: Colors.black),
                                )
                              ],
                            ),
                          ),
                          onTap: () {
                            getImageLicenseFromCamera();
                            Navigator.pop(context);
                          },
                        ))
                  ],
                )),
          );
        });
  }

  Future getImageFromGallery() async {
    final pickedFile = await picker.pickImage(source: ImageSource.gallery);

    if (pickedFile != null) {
      setState(() {
        profilePic = File(pickedFile.path);
      });
    } else {
      log('No image selected.');
    }

  }

  getImageFromCamera() async {
    final pickedFile = await picker.pickImage(source: ImageSource.camera);


    if (pickedFile != null) {
      setState(() {
        profilePic = File(pickedFile.path);
      });
    } else {
      log('No image selected.');
    }

  }

  Future getImageLicenseFromGallery() async {
    final pickedFile = await picker.pickImage(source: ImageSource.gallery);


    if (pickedFile != null) {
      setState(() {
        licencePic = File(pickedFile.path);
      });

    } else {
      log('No image selected.');

    }


  }
  getImageLicenseFromCamera() async {
    final pickedFile = await picker.pickImage(source: ImageSource.camera);


    if (pickedFile != null) {
      setState(() {
        licencePic = File(pickedFile.path);
      });

    } else {
      log('No image selected.');
    }
  }


  @override
  Widget build(BuildContext context) {
    return Form(
      key: formKey,
      child: Column(crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [

          Row(
            children: [

              Padding(
                padding:  EdgeInsets.symmetric(horizontal: 5.w),
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    backgroundColor: primaryColor,
                    textStyle: const TextStyle(color: Colors.white),
                  ),
                  onPressed: () {
                    showCountryPicker(
                      context: context,
                      //Optional.  Can be used to exclude(remove) one ore more country from the countries list (optional).
                      exclude: <String>['KN', 'MF'],
                      favorite: <String>['SE'],
                      //Optional. Shows phone code before the country name.
                      showPhoneCode: true,
                      onSelect: (Country country) {
                        setState(() {
                          countryCode = country.phoneCode;
                        });
                        log('Select country: ${country.displayName}');
                      },
                      // Optional. Sets the theme for the country list picker.
                      countryListTheme: CountryListThemeData(
                        // Optional. Sets the border radius for the bottomsheet.
                        borderRadius: const BorderRadius.only(
                          topLeft: Radius.circular(40.0),
                          topRight: Radius.circular(40.0),
                        ),
                        // Optional. Styles the search field.
                        inputDecoration: InputDecoration(
                          labelText: 'Search',
                          hintText: 'Start typing to search',
                          prefixIcon: const Icon(Icons.search),
                          border: OutlineInputBorder(
                            borderSide: BorderSide(
                              color: const Color(0xFF8C98A8)
                                  .withOpacity(0.2),
                            ),
                          ),
                        ),
                        // Optional. Styles the text in the search field
                        searchTextStyle:  TextStyle(
                          color: Colors.green,
                          fontSize: 18.sp,
                        ),
                      ),
                    );
                  },
                  child: Text(countryCode,
                      style: const TextStyle(color: Colors.white)),
                ),
              ),
              Expanded(
                  child: CustomTextField(
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return S.of(context).pleaseEnterYourMobileNumber;
                      }
                      if (value.length != 9) {
                        return S.of(context).mobileNumberNotEqiual9;
                      }
                      return null;
                    },
                    hintText: S.of(context).mobileNumber,
                    controller: mobile,
                    prefixIconData:const Icon (Icons.phone_android),
                    keyBoard: TextInputType.number,
                  )),
            ],
          ),
          CustomTextField(
            validator: (value) {
              if (value == null || value.isEmpty) {
                return S.of(context).pleaseEnterYourEmailNumber;
              }
              return null;
            },
            keyBoard: TextInputType.text,
            controller: email,
            hintText: Translator.translate(S.of(context).email),
            prefixIconData:const Icon(Icons.email_outlined),
            onPrefixIconPress: () {
              setState(() {});
            },
          ),
          CustomTextField(
            validator: (value) {
              if (value == null || value.isEmpty) {
                return S.of(context).pleaseEnterYourShopNameEnglish;
              }
              // if (!RegExp(r'^[a-zA-Z]+$').hasMatch(value)) {
              //   return S.of(context).pleaseOnlyCharacterInEnglish;
              // }
              return null;
            },
            keyBoard: TextInputType.text,
            controller: shopNameEnglish,
            hintText: Translator.translate(S.of(context).shopNameInEnglish),
            prefixIconData:const Icon(Icons.store_mall_directory_outlined),
            onPrefixIconPress: () {
              setState(() {});
            },
          ),
          CustomTextField(
            validator: (value) {
              if (value == null || value.isEmpty) {
                return S.of(context).pleaseEnterYourShopNameArabic;
              }
              if (!RegExp(r'^[؀-ۿ\s]+$').hasMatch(value)) {
                return S.of(context).pleaseOnlyCharacterInArabic;
              }
              return null;
            },
            keyBoard: TextInputType.text,
            controller: shopNameArabic,
            hintText: Translator.translate(S.of(context).shopNameInArabic),
            prefixIconData:const Icon(Icons.store_mall_directory_outlined),
            onPrefixIconPress: () {
              setState(() {});
            },
          ),
          CustomTextField(
            validator: (value) {
              if (value == null || value.isEmpty) {
                return S.of(context).pleaseEnterYourMangerNameEnglish;
              }
              if (!RegExp(r'^[a-zA-Z]+$').hasMatch(value)) {
                return S.of(context).pleaseOnlyCharacterInEnglish;
              }
              return null;
            },
            keyBoard: TextInputType.text,
            controller: mangerNameEnglish,
            hintText: Translator.translate(S.of(context).mangerNameInEnglish),
            prefixIconData:const Icon(Icons.perm_identity),
            onPrefixIconPress: () {
              setState(() {});
            },
          ),
          CustomTextField(
            validator: (value) {
              if (value == null || value.isEmpty) {
                return S.of(context).pleaseEnterYourMangerNameArabic;
              }
              if (!RegExp(r'^[؀-ۿ\s]+$').hasMatch(value)) {
                return S.of(context).pleaseEnterOnlyCharacterArabic;
              }
              return null;
            },
            keyBoard: TextInputType.text,
            controller: mangerNameArabic,
            hintText: Translator.translate(S.of(context).mangerNameInArabic),
            prefixIconData:const Icon(Icons.perm_identity),
            onPrefixIconPress: () {
              setState(() {});
            },
          ),

          CustomTextField(
            validator: (value) {
              if (SearchLocationScreen.address == null) {
                return S.of(context).pleaseEnterYourAddress;
              }
              return null;
            },
            readOnly: true,
            press: () =>
                MangerNavigator.of(context).push(const SearchLocationScreen()),
            keyBoard: TextInputType.text,
            controller: address,
            prefixIconData:const Icon (Icons.location_on_outlined),

            hintText:SearchLocationScreen.address != null ?  SearchLocationScreen.address:'select address'.tr,),


          CustomTextField(
            validator: (value) {
              if (profilePic == null) {
                return S.of(context).pleaseEnterYourProfilepic;
              }
              return null;
            },
            controller: profile,
            keyBoard: TextInputType.text,
            prefixIconData: InkWell(onTap: () {
              showImagePicker(context);
            },
              child: const Icon(Icons.image_outlined),),


            readOnly: true,
            press: () => showImagePicker(context),
            hintText: profilePic != null ? profilePic!
                .path
                .split('/')
                .last : Translator.translate(S.of(context).profilepic),

          ),
          CustomTextField(
            validator: (value) {
              if (licencePic == null) {
                return S.of(context).pleaseEnterYourLicencepic;
              }
              return null;

            },
            readOnly: true,
            press: () {
              showImagePicker2(context);
            },
            keyBoard: TextInputType.text,
              prefixIconData:const Icon( Icons.image_outlined),

              controller: licence,
            hintText: licencePic != null
                ? licencePic!.path.split('/').last
                : Translator.translate(S.of(context).licencepic)),

          CustomTextField(
            validator: (value) {
              if (value == null || value.isEmpty) {
                return S.of(context).pleaseEnterYourPassword;
              }
              if (value.length <= 8) {
                return S.of(context).passwordLengthAtLeast8Character;
              }
              return null;
            },
            keyBoard: TextInputType.text,
            controller: password,
            isPassword: showPassword,
            hintText: Translator.translate(S.of(context).password),

prefixIconData: const Icon(Icons.lock_outline),
          ),
          buildErrorWidget(),
          buildButton(),
           SizedBox(
            height: 1.h,
          ),
          Center(
            child: Container(

              child: InkWell(
                onTap: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => const SignupScreen()));
                },
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      Translator.translate(S.of(context).haveAccount),
                    ),
                    const SizedBox(
                      width: 1,
                    ),
                    Text(
                      Translator.translate(S.of(context).signin),
                      style: basicPrimary,
                    )
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
Widget buildButton(){

    return
  CommonViews().createButton(
      title: S.of(context).signUp,
      onPressed: () async {
        PushNotificationsManager pushNotificationsManager =
        PushNotificationsManager();
        await pushNotificationsManager.init();
        String? fcmToken = await pushNotificationsManager.getToken();


        log("device token is : ${fcmToken.toString()}");
        if (formKey.currentState!.validate()) {
          final dio = Dio(); // Create a Dio instance
          final formData = FormData();
          const url =
              "https://news.wasiljo.com/public/api/v1/manager/register";
          final headers = {
            "Accept": "application/json",
            "Content-Type": "application/json",
          };
          // Define the request data (payload)
          formData.fields.addAll([
            MapEntry('shop[name][en]', shopNameEnglish.text),
            MapEntry('shop[name][ar]', shopNameArabic.text),
            MapEntry(
                'latitude', SearchLocationScreen.latitude.toString()),    MapEntry(
                'fcm_token',fcmToken.toString()),
            MapEntry(
                'address', SearchLocationScreen.address.toString()),
            MapEntry(
                'longitude', SearchLocationScreen.longitude.toString()),
            MapEntry('manager[name][ar]', mangerNameArabic.text),
            MapEntry('manager[name][en]', mangerNameEnglish.text),
            MapEntry('password', password.text),
            MapEntry('mobile', countryCode.toString() + mobile.text),
            MapEntry('email', email.text),
            const MapEntry('shop[category]', '1'),
          ]);

          if (profilePic != null) {
            formData.files.addAll([
              MapEntry(
                'manager[avatar_url]',
                await MultipartFile.fromFile(
                  profilePic!.path,
                  filename:
                  profilePic!.path.split('/').last,
                ),
              ),
            ]);
          }

          if (licencePic != null) {
            formData.files.addAll([
              MapEntry(
                'manager[license]',
                await MultipartFile.fromFile(
                  licencePic!.path,
                  filename:
                  licencePic!.path.split('/').last,
                ),
              ),
            ]);
          }

          try {
            final response = await dio.post(
              url,
              data: formData,
              options: Options(headers: headers),
            );

            if (response.statusCode == 200) {
              SharedPreferences sharedPreferences =
              await SharedPreferences.getInstance();
              Map<String, dynamic> data = response.data;
              String token = data['token'].toString();
              await sharedPreferences.setString('token', token);
              setState(() {
                errorMessages.clear();
              });
              log("Response data: ${response.data}");

              MangerNavigator.of(context)
                  .pushReplacement(const LoginScreen());
            } else {
              //not 200
              log("Registration failed with status code: ${response.statusCode}");
              log("Response data: ${response.data}");
            }
          } catch (e) {
            //error
            if (e is DioError) {
              if (e.response != null) {
                // log only the error message from the API response
                final responseData = e.response!.data;
                if (responseData is Map<String, dynamic> &&
                    responseData.containsKey('message')) {
                  log("Error during registration: ${responseData['message']}");
                } else {
                  setState(() {
                    errorMessages =
                    List<String>.from(responseData['error']+responseData.toString());
                  });
                  log("An error occurred: ${responseData['error']}");
                }
              } else {
                // If there's no response, log a generic error message
                log("An error ,,: ${e.message}");
              }
            } else {
              // Handle other exceptions, if any
              log("Unexpected error: $e");
            }
          }
        }
      });}
  // onPre;sed: () async {
  //       print("statr");
  //   try {
  //     final respone= await http.post(Uri.parse("https://news.wasiljo.com/public/api/v1/manager/register"),
  //     body: {
  //       'shop[name][en]': shopNameEnglish.text,
  //       'shop[name][ar]': shopNameArabic.text,
  //       'latitude': SearchLocationScreen.latitude.toString(),
  //       'address': SearchLocationScreen.address.toString(),
  //       'longitude': SearchLocationScreen.longitude.toString(),
  //       'manager[name][ar]': mangerNameArabic.text,
  //       'manager[name][en]': mangerNameEnglish.text,
  //       'password': password.text,
  //       'mobile': countryCode.toString() + mobile.text,
  //       'email': email.text,
  //       'shop[category]':'1',
  //       'manager[avatar_url]':profilePic.toString(),
  //       'manager[license]':profile.text,
  //
  //
  //     });
  //
  //     if(respone.statusCode==200){
  //       print("done");
  //       print(respone.body);
  //     }
  //     else{
  //       print("error");
  //       print(respone.body);
  //     }
  //   } catch (e) {
  //     print("catch");
  //     print(e);
  //   }
  // },

  Container buildErrorWidget() {
    return Container(
      margin: const EdgeInsets.only(left: 20, top: 5),
      height: 90,
      child: errorMessages.isNotEmpty
          ? ListView.builder(
              itemCount: errorMessages.length,
              itemBuilder: (context, index) {
                return Row(
                  children: [
                    const Icon(
                      Icons.error_outline,
                      color: Colors.red,
                    ),
                    const SizedBox(
                      width: 5,
                    ),
                    Text(
                      errorMessages[index],
                      style: const TextStyle(
                        color: Colors.red,
                      ),
                    ),
                  ],
                );
              },
            )
          : const Text(''),
    );
  }

  Widget buildDonotHaveAccount() {
    return TextButton(
        onPressed: () {
          MangerNavigator.of(context).pushReplacement(const LoginScreen());
        },
        child: const Text(
          'Already have an account?',
          style: TextStyle(color: Colors.grey),
        ));
  }
}
