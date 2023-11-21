import 'dart:convert';
import 'dart:io';
import 'package:http/http.dart'as http;
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_instance/src/extension_instance.dart';
import 'package:image_picker/image_picker.dart';
import 'package:mangerapp/utils/ui/common_views.dart';
import 'package:mangerapp/views/all_items/all_items.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:sizer/sizer.dart';

import '../generated/l10n.dart';
import '../services/app_localization.dart';
import '../utils/colors.dart';
import '../utils/fonts.dart';
import '../utils/helper/navigator.dart';
import '../utils/helper/size.dart';
import '../widget/text_feild.dart';
import 'all_items/all_item_controller.dart';
import 'items/add_admin_controller.dart';

class AddItem extends StatefulWidget {
  const AddItem({super.key});

  @override
  State<AddItem> createState() => _AddItemState();
}

class _AddItemState extends State<AddItem> {

  List<String> errorMessages = [];
  TextEditingController?  nameItemEnglish = TextEditingController();
  TextEditingController?  nameItemArabic = TextEditingController();
  TextEditingController?  priceItem = TextEditingController();
  TextEditingController?  desItemArabic = TextEditingController();
  TextEditingController?  desItemEnglish = TextEditingController();
  TextEditingController?  imageItem = TextEditingController();
  TextEditingController?  id = TextEditingController();
  var subCategoriesActive = [];
  var walletCategoriesActive = [];
  var subCategoriesPendung = [];
  var walletCategoriesPendung = [];
  File? profilePic;
  final imagePicker=ImagePicker();
  Future getImageFromGallery() async {
    final pickedFile = await imagePicker.pickImage(source: ImageSource.gallery);

    setState(() {
      if (pickedFile != null) {
        profilePic = File(pickedFile.path);
      } else {
        print('No image selected.');
      }
    });
  }
  getImageFromCamera()  async {
    final pickedFile = await imagePicker.pickImage(source: ImageSource.camera);

    setState(() {
      if (pickedFile != null) {
        profilePic = File(pickedFile.path);
      } else {
        print('No image selected.');
      }
    });
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

      subCategoriesPendung = jsonData['data']['subCategoriesPending'];
      subCategoriesActive = jsonData['data']['subCategoriesAccepted'];
      print('subCategoriesPendung');
      print(subCategoriesPendung.length);
      print(subCategoriesPendung);

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

      walletCategoriesPendung = jsonData['data']['walletsPending'];
      walletCategoriesActive  = jsonData['data']['walletsAccepted'];
      print(walletCategoriesPendung );

    } else {
      throw Exception('Failed to load subcategories');
    }}

  @override
  Widget build(BuildContext context) {
    ItemsController controllerItem =Get.put(ItemsController());
    final GlobalKey<FormState> formKey = GlobalKey<FormState>();
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(backgroundColor: backgroundColor,actionsIconTheme: IconThemeData(color: Colors.black),
            iconTheme: IconThemeData(color: Colors.black),
            elevation: 0, ),
        body:Form(
          key: formKey,
          child: ListView(
            children: [
              const SizedBox(height: 0,),
              Row(
                children: [
                  Padding(
                    padding:  EdgeInsets.symmetric(horizontal: 5.0.w),
                    child: Text(Translator.translate(S.of(context).addNewItems),style: boldPrimary,),
                  ),
                ],
              ),
              // InkWell(
              //   onTap: () {
              //     MangerNavigator.of(context).push(const AddItem());
              //   },
              //   child: Container(
              //     margin: Spacing.fromLTRB(16, 8, 16, 8),
              //     padding: Spacing.all(16),
              //     decoration: BoxDecoration(
              //         color:backgroundColor,
              //         borderRadius: const BorderRadius.all(Radius.circular(8)),
              //         border: Border.all(color: primaryColor,width: 1.5)),
              //     child: Row(
              //       children: <Widget>[
              //         Container(
              //           width: 48,
              //           height: 48,
              //           decoration: const BoxDecoration(
              //             image: DecorationImage(
              //                 image: AssetImage('assets/images/item-icon-2179.png'),
              //                 fit: BoxFit.fill),
              //           ),
              //         ),
              //         Expanded(
              //           child: Container(
              //             margin: Spacing.only(left: 16),
              //             child: const Column(
              //               crossAxisAlignment: CrossAxisAlignment.start,
              //               children: [
              //                 Text("Through our application, you will add this product and users will see this information about the product",
              //                     style:TextStyle(
              //                         fontWeight: FontWeight.w500,
              //                         letterSpacing: 0.2)),
              //
              //               ],
              //             ),
              //           ),
              //         )
              //       ],
              //     ),
              //   ),
              // ),


              const SizedBox(height: 10,),
              CustomTextField(
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return S.of(context).pleaseEnterYourItemNameArabic;
                  }
                  if (!RegExp(r'^[؀-ۿ\s]+$').hasMatch(value)) {
                    return S.of(context).pleaseEnterOnlyCharacterArabic;
                  }
                  return null;
                },
                keyBoard: TextInputType.text,
                controller: nameItemArabic! ,

                hintText: Translator.translate(S.of(context).nameItemArabic),

                onPrefixIconPress: () {
                  setState(() {

                  });
                }, prefixIconData: null,

              ),
              // CustomTextField(
              //   validator: (value) {
              //     if (value == null || value.isEmpty) {
              //       return 'Please enter your item Name English';
              //     }
              //     if (!RegExp(r'^[a-zA-Z0-9 ]*$').hasMatch(value)) {
              //       return 'please only character in English';
              //     }
              //     return null;
              //   },
              //   keyBoard: TextInputType.text,
              //   controller: nameItemEnglish! ,
              //
              //   hintText: Translator.translate("Name Item in English"),
              //
              //   onPrefixIconPress: () {
              //     setState(() {
              //
              //     });
              //   }, prefixIconData: null,
              //
              // ),
              CustomTextField(
                keyBoard: TextInputType.text,
                controller: priceItem! ,

                hintText: Translator.translate(S.of(context).priceItem),

                onPrefixIconPress: () {
                  setState(() {

                  });
                }, prefixIconData: null,

              ),
              CustomTextField(
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return S.of(context).pleaseEnterYourDescriptionNameArabic;
                  }
                  if (!RegExp(r'^[؀-ۿ\s]+$').hasMatch(value)) {
                    return 'Please enter only character  Arabic';
                  }
                  return null;
                },
                keyBoard: TextInputType.text,
                controller: desItemArabic! ,

                hintText: Translator.translate(S.of(context).descriptionItemInArabic),

                onPrefixIconPress: () {
                  setState(() {

                  });
                }, prefixIconData: null,

              ),
              // CustomTextField(
              //   validator: (value) {
              //     if (value == null || value.isEmpty) {
              //       return 'Please enter your manger Name English';
              //     }
              //     if (!RegExp(r'^[a-zA-Z0-9 ]*$').hasMatch(value)) {
              //       return 'please only character in English';
              //     }
              //     return null;
              //   },
              //   keyBoard: TextInputType.text,
              //   controller: desItemEnglish! ,
              //
              //   hintText: Translator.translate("Description Item in English"),
              //
              //   onPrefixIconPress: () {
              //     setState(() {
              //
              //     });
              //   }, prefixIconData: null,
              //
              // ),
              // profilePic !=null ? Container(
              //     margin: Spacing.fromLTRB(24, 16, 24, 0),
              //     child: Image.file(profilePic!)
              // ):Container(),



              Container(
                  margin: Spacing.fromLTRB(24, 16, 24, 0),
                  child: TextField(
                      readOnly: true,
                      onTap: () {
                        // showImagePicker(context);
                      },
                      style:const TextStyle(
                          fontWeight:FontWeight.w500),
                      decoration: InputDecoration(
                          focusedBorder:  const OutlineInputBorder(


                            borderRadius: BorderRadius.all(
                              Radius.circular(8),
                            ),),

                          //labelText:profilePic!=null ?  profilePic!.path.split('/').last :Translator.translate("Logo")  ,
                          hintText: profilePic!=null ?  profilePic!.path.split('/').last :Translator.translate(S.of(context).logo)  ,
                          border:const OutlineInputBorder(


                              borderRadius: BorderRadius.all(
                                Radius.circular(8),
                              ),
                              borderSide: BorderSide(color: Color(0xffdcdee3), width: 1.5)),
                          isDense: true,
                          suffixIcon: IconButton(
                            onPressed: () {
                              getImageFromGallery();
                            },
                            icon: const Icon(Icons.photo_library),
                          ))
                  )
              ),
              Container(
                margin: EdgeInsets.only(left: 20,top: 20),
                height: 90,
                child: errorMessages.isNotEmpty
                    ? ListView.builder(
                  itemCount: errorMessages.length,
                  itemBuilder: (context, index) {
                    return Row(
                      children: [
                        Icon(Icons.error_outline,color: Colors.red,),
                        SizedBox(width: 5,),
                        Text(
                          errorMessages[index],
                          softWrap: false,
                          style: TextStyle(

                            overflow: TextOverflow.ellipsis,

                            color: Colors.red,
                          ),
                        ),
                      ],
                    );
                  },
                )
                    : Text(''),
              ),
   const SizedBox(height: 20,),

   CommonViews().createButton(title: 'Add Item',    onPressed: () async {
       print('not');
       if (formKey.currentState!.validate()) {
           print('not');

           final dio = Dio(); // Create a Dio instance

           final formData = FormData();

           // Define the API endpoint URL
           const url =
               "https://admin.wasiljo.com/public/api/v1/manager/mySubCategories";
           SharedPreferences prefs =
           await SharedPreferences.getInstance();
           // Define the request headers
           var bearerToken=prefs.getString('token');
           final headers = {

             'Authorization': 'Bearer $bearerToken'
           };

           // Define the request data (payload)
           formData.fields.addAll([
             MapEntry('title[ar]', nameItemArabic!.text),
         MapEntry('title[en]', nameItemEnglish!.text),
             MapEntry('description[en]', desItemEnglish!.text),
         MapEntry('description[ar]', desItemArabic!.text),



             MapEntry('price', priceItem!.text),
             const MapEntry('active', '1'),




           ]);

           if (profilePic != null) {
             formData.files.addAll([
               MapEntry(
                 'image_url',
                 await MultipartFile.fromFile(
                   profilePic!.path,
                   filename: profilePic!.path.split('/').last,
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

fetchSubCategories();
fetchWalletCategories();
controllerItem.fetchSubCategories();


               MangerNavigator.of(context).pushReplacement(const AllItems());
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
                       "An error occurred: ${errorMessages}");

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

            ],
          ),
        ),
      ),
    );
  }
}
