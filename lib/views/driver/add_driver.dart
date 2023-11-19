import 'package:dio/dio.dart';
import 'package:mangerapp/views/driver/driver.dart';
import '../../../config/custom_package.dart';
import '../../generated/l10n.dart';
import '../../services/push_notification.dart';



class AddDriver extends StatefulWidget {
  const AddDriver({super.key});

  @override
  State<AddDriver> createState() => _AddDriverState();
}

class _AddDriverState extends State<AddDriver> {
  List<String> errorMessages = [];
  String error = '';
  late TextEditingController mobile;
  late TextEditingController emailTFController;
  late TextEditingController driverNameEnglish;
  late TextEditingController driverNameArabic;

  TextEditingController shopCategory = TextEditingController();
  TextEditingController carNumber = TextEditingController();
  late TextEditingController passwordTFController;

  TextEditingController profile = TextEditingController();
  TextEditingController licence = TextEditingController();

  var successAlert;
  final GlobalKey<ScaffoldMessengerState> _scaffoldMessengerKey =
  GlobalKey<ScaffoldMessengerState>();


  int selectedCountryCode = 0;
  List<PopupMenuEntry<Object>>? countryList;
  List<dynamic> countryCode = TextUtils.countryCode;

  //Global Keys

  //Other Variables
  bool isInProgress = false;
  bool showPassword = false;
  String contryCode = "962";

  File? profilePic;
  File? historyPic;
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
                          child: const Column(
                            children: [
                              Icon(
                                Icons.image,
                                size: 60.0,
                                color: primaryColor,
                              ),
                              SizedBox(height: 12.0),
                              Text(
                                "Gallery",
                                textAlign: TextAlign.center,
                                style: TextStyle(fontSize: 16, color: Colors.black),
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
                          child: const SizedBox(
                            child: Column(
                              children: [
                                Icon(
                                  Icons.camera_alt,
                                  size: 60.0,
                                  color: primaryColor,
                                ),
                                SizedBox(height: 12.0),
                                Text(
                                  "Camera",
                                  textAlign: TextAlign.center,
                                  style:
                                  TextStyle(fontSize: 16, color: Colors.black),
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
                          child: const Column(
                            children: [
                              Icon(
                                Icons.image,
                                size: 60.0,
                                color: primaryColor,
                              ),
                              SizedBox(height: 12.0),
                              Text(
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
                          child: const SizedBox(
                            child: Column(
                              children: [
                                Icon(
                                  Icons.camera_alt,
                                  size: 60.0,
                                  color: primaryColor,
                                ),
                                SizedBox(height: 12.0),
                                Text(
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

    setState(() {
      if (pickedFile != null) {
        profilePic = File(pickedFile.path);
      } else {
        print('No image selected.');
      }
    });
  }

  getImageFromCamera() async {
    final pickedFile = await picker.pickImage(source: ImageSource.camera);

    setState(() {
      if (pickedFile != null) {
        profilePic = File(pickedFile.path);
      } else {
        print('No image selected.');
      }
    });
  }

  Future getImageLicenseFromGallery() async {
    final pickedFile = await picker.pickImage(source: ImageSource.gallery);

    setState(() {
      if (pickedFile != null) {
        licencePic = File(pickedFile.path);
      } else {
        print('No image selected.');
      }
    });
  }

  getImageLicenseFromCamera() async {
    final pickedFile = await picker.pickImage(source: ImageSource.camera);

    setState(() {
      if (pickedFile != null) {
        licencePic = File(pickedFile.path);
      } else {
        print('No image selected.');
      }
    });
  }

  String address = '';

  @override
  void initState() {
    super.initState();

    emailTFController = TextEditingController();
    passwordTFController = TextEditingController();
    mobile = TextEditingController();
    driverNameEnglish = TextEditingController();
    driverNameArabic = TextEditingController();

  }

  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
        iconTheme: IconThemeData(color: secondaryColor),
    backgroundColor: backgroundColor,),
          body: Form(
            key: _formKey,
            child: ListView(
              padding: Spacing.top(20),
              children: <Widget>[
                Row(
                  children: [
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 20.0),
                      child: Text(
                        Translator.translate(S.of(context).createNewDriver),
                        style: boldPrimary,
                      ),
                    ),
                  ],
                ),
                Row(
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(left: 20.00, right: 20,top: 10),
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
                                contryCode = country.phoneCode;
                              });
                              print('Select country: ${country.displayName}');
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
                                    color: const Color(0xFF8C98A8).withOpacity(0.2),
                                  ),
                                ),
                              ),
                              // Optional. Styles the text in the search field
                              searchTextStyle: const TextStyle(
                                color: Colors.green,
                                fontSize: 18,
                              ),
                            ),
                          );
                        },
                        child:
                        Text(contryCode, style: const TextStyle(color: Colors.white)),
                      ),
                    ),
                    Spacing.width(8),
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
                          prefixIconData: const Icon(Icons.phone_android),
                          keyBoard: TextInputType.number,
                        )),
                  ],
                ),
                CustomTextField(
                  keyBoard: TextInputType.emailAddress,
                  controller: emailTFController,
                  hintText: Translator.translate(S.of(context).email),
                  prefixIconData:const Icon(Icons.email_outlined),
                  onPrefixIconPress: () {
                    setState(() {});
                  },
                ),
                // CustomTextField(
                //   validator: (value) {
                //     if (driverNameEnglish == null) {
                //       return 'Please enter your  shop Name English';
                //     }
                //     if (!RegExp(r'^[a-zA-Z]+$').hasMatch(value!)) {
                //       return 'please only character in English';
                //     }
                //     return null;
                //   },
                //   keyBoard: TextInputType.text,
                //   controller: driverNameEnglish,
                //   hintText: Translator.translate("driver name in English"),
                //   prefixIconData:const Icon(Icons.perm_identity),
                //   onPrefixIconPress: () {
                //     setState(() {});
                //   },
                // ),
                CustomTextField(
                  validator: (value) {
                    if (driverNameArabic == null) {
                      return S.of(context).pleaseEnterYourDriverNameArabic;
                    }
                    if (!RegExp(r'^[؀-ۿ\s]+$').hasMatch(value!)) {
                      return 'الرجاء إدخال حروف عربية فقط';
                    }
                    return null;
                  },
                  keyBoard: TextInputType.text,
                  controller: driverNameArabic,
                  hintText: Translator.translate(S.of(context).driverNameInArabic),
                  prefixIconData: const Icon(Icons.perm_identity),

                  onPrefixIconPress: () {
                    setState(() {});
                  },
                ),

                CustomTextField(
                  validator: (value) {
                    if (carNumber == null) {
                      return S.of(context).pleaseEnterYourCarnumber;
                    }
                    return null;
                  },
                  keyBoard: TextInputType.text,
                  controller: carNumber,
                  hintText: Translator.translate(S.of(context).carnumber),
                  prefixIconData:const Icon(Icons.onetwothree_outlined),
                  onPrefixIconPress: () {
                    setState(() {});
                  },
                ),

                CustomTextField(
                  validator: (value) {
                    if (profilePic == null) {
                      return S.of(context).pleaseEnterYourLicencepic;
                    }
                    return null;
                  },
                  readOnly: true,
                  press: () {
                    showImagePicker(context);
                  },
                  keyBoard: TextInputType.text,
                  controller: profile,
                  hintText: profilePic != null
                      ? profilePic!.path.split('/').last
                      : Translator.translate(S.of(context).profileDriver),
                  prefixIconData: const Icon(Icons.photo_library_outlined),
                  onPrefixIconPress: () {
                    setState(() {});
                  },
                ),
                CustomTextField(
                  validator: (value) {
                    if (profilePic == null) {
                      return S.of(context).pleaseEnterYourLicencepic;
                    }
                    return null;
                  },
                  readOnly: true,
                  press: () {
                    showImagePicker2(context);
                  },
                  keyBoard: TextInputType.text,
                  controller: licence,
                  hintText: licencePic != null
                      ? licencePic!.path.split('/').last
                      : Translator.translate(S.of(context).licencepicDriver),
                  prefixIconData: const Icon(Icons.photo_library_outlined),
                  onPrefixIconPress: () {
                    setState(() {});
                  },
                ),
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
                  controller: passwordTFController,
                  isPassword: showPassword,
                  hintText: Translator.translate(S.of(context).password),
                  prefixIconData: const Icon( Icons.lock_outline),
                  onPrefixIconPress: () {
                    setState(() {
                      showPassword = !showPassword;
                    });
                  },
                ),

                Container(
                  margin: const EdgeInsets.only(left: 20,top: 20),
                  height: 90,
                  child: errorMessages.isNotEmpty
                      ? ListView.builder(
                    itemCount: errorMessages.length,
                    itemBuilder: (context, index) {
                      return Row(
                        children: [
                          const Icon(Icons.error_outline,color: Colors.red,),
                          const SizedBox(width: 5,),
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
                ),

                CommonViews().createButton(
                    title: S.of(context).createNewDriver,
                    onPressed: () async {
                      PushNotificationsManager pushNotificationsManager = PushNotificationsManager();
                      await pushNotificationsManager.init();
                      String? fcmToken = await pushNotificationsManager.getToken();
                      print("fcmToken$fcmToken");
                      print('not');
                      if (_formKey.currentState!.validate()) {
                        print('ddd');

                        final dio = Dio(); // Create a Dio instance

                        final formData = FormData();

                        // Define the API endpoint URL
                        const url =
                            "https://news.wasiljo.com/public/api/v1/manager/delivery_boys/create?lang=ar";

                        // Define the request headers
                        SharedPreferences prefs= await SharedPreferences.getInstance();
                       var bearerToken=   prefs.getString('token');
print(bearerToken);
print('bearerToken');
                        final headers = {
                          "Accept": "application/json",
                          "Content-Type": "application/json",
                          'Authorization': 'Bearer $bearerToken'
                        };

                        // Define the request data (payload)
                        formData.fields.addAll([
                          MapEntry('name[en]', driverNameArabic.text),
                          MapEntry('name[ar]', driverNameArabic.text),



                          MapEntry('password', passwordTFController.text),
                          MapEntry('mobile', contryCode.toString()+mobile.text),
                          MapEntry('email', emailTFController.text),
                          MapEntry('car_number', carNumber.text),

                        ]);

                        if (profilePic != null) {
                          formData.files.addAll([
                            MapEntry(
                              'avatar_url',
                              await MultipartFile.fromFile(
                                profilePic!.path,
                                filename: profilePic!.path.split('/').last,
                              ),
                            ),
                          ]);
                        }

                        if (licencePic != null) {
                          formData.files.addAll([
                            MapEntry(
                              'driving_license',
                              await MultipartFile.fromFile(
                                licencePic!.path,
                                filename: licencePic!.path.split('/').last,
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
                            setState(() {
                              errorMessages.clear();

                            });

                            print("Registration successful!");
                            print("Response data: ${response.data}");

                            //showMessage(message: 'Please wait admin verification');


                      MangerNavigator.of(context).pushReplacement(const Driver());
                           // showMessage(message: 'Please wait admin verification');
                          } else {
                            print(
                                "Registration failed with status code: ${response.statusCode}");
                            print("Response data: ${response.data}");
                          }
                        } catch (e) {
                          if (e is DioError) {
                            if (e.response != null) {
                              // Print only the error message from the API response
                              final responseData = e.response!.data;
                              if (responseData is Map<String, dynamic> &&
                                  responseData.containsKey('message')) {

                                print(
                                    "Error during registration: ${responseData['message']}");
                              } else {

                                setState(() {
                                  errorMessages =
                                  List<String>.from(responseData['error']);
                                });
                                print(
                                    "An error occurred: ${responseData['error']}");

                                print(
                                    "An error occurred: ${responseData['error']}");
                              }
                            } else {
                              // If there's no response, print a generic error message
                              print("An error occurred: ${e.message}");
                            }
                          } else {
                            // Handle other exceptions, if any
                            print("Unexpected error: $e");
                          }
                        }
                      }
                    }),
                const SizedBox(
                  height: 10,
                ),

                const SizedBox(
                  height: 10,
                ),
              ],
            ),
          )),
    );
  }

  void showMessage({String message = "Something wrong", Duration? duration}) {
    duration ??= const Duration(seconds: 3);
    _scaffoldMessengerKey.currentState!.showSnackBar(
      SnackBar(
        duration: duration,
        content: Text(message,
           ),
        backgroundColor: primaryColor,
        behavior: SnackBarBehavior.fixed,
      ),
    );
  }
}

