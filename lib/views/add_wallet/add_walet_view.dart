import 'dart:developer';

import 'package:dio/dio.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_instance/src/extension_instance.dart';
import 'package:get/get_state_manager/src/rx_flutter/rx_obx_widget.dart';
import 'package:mangerapp/views/add_wallet/wallet_controller.dart';

import '../../config/custom_package.dart';
import '../../generated/l10n.dart';
import '../all_items/all_item_model.dart';
import '../all_items/all_items.dart';
import 'add.dart';

class AddNewWallet extends StatefulWidget {
  const AddNewWallet({super.key});




  @override
  State<AddNewWallet> createState() => _AddNewWalletState();
}

class _AddNewWalletState extends State<AddNewWallet> {
  List<String> errorMessages = [];

  TextEditingController?  nameItemEnglish = TextEditingController();

  TextEditingController?  nameItemArabic = TextEditingController();

  TextEditingController?  priceItem = TextEditingController();

  TextEditingController?  desItemArabic = TextEditingController();

  TextEditingController?  desItemEnglish = TextEditingController();

  TextEditingController?  imageItem = TextEditingController();

  TextEditingController?  id = TextEditingController();
  TextEditingController?  number = TextEditingController();

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
  SubCategoriesAccepted? selectedCategory;
  SubCategoryController controller=Get.put(SubCategoryController());
  AddWalletController addWallet=Get.put(AddWalletController());
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {




    return SafeArea(
      child: Scaffold(
        appBar: AppBar(backgroundColor: backgroundColor,elevation: 0,iconTheme: IconThemeData(color: Colors.black)),
        body:Form(
          key: formKey,
          child: ListView(

            children: [
              const SizedBox(height: 0,),
              Row(
                children: [
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 20.0,vertical: 10),
                    child: Text(Translator.translate("Add  New coupon book"),style: boldPrimary,),
                  ),
                ],
              ),



              const SizedBox(height: 10,),

              CustomTextField(
                  validator: (value) {
                    if (profilePic == null) {
                      return 'image coupon book';
                    }
                    return null;

                  },
                  readOnly: true,
                  press: () {
                    getImageFromGallery();
                  },
                  keyBoard: TextInputType.text,
                  prefixIconData:const Icon( Icons.image_outlined),

                  controller: imageItem!,
                  hintText: profilePic != null
                      ? profilePic!.path.split('/').last
                      : Translator.translate('image wallet')),
              CustomTextField(
                // validator: (value) {
                //   // if (value == null || value.isEmpty) {
                //   //   return 'Please enter your item Name Arabic';
                //   // }
                //   if (!RegExp(r'^[؀-ۿ\s]+$').hasMatch(value!)) {
                //     return 'Please enter only character Arabic';
                //   }
                //  // return null;
                // },
                keyBoard: TextInputType.text,
                controller: nameItemArabic!,

                hintText: Translator.translate("Name Item Arabic"),



              ),
              CustomTextField(
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please enter your item Name English';
                  }
                  if (!RegExp(r'^[a-zA-Z0-9 ]*$').hasMatch(value)) {
                    return 'please only character in English';
                  }
                  return null;
                },
                keyBoard: TextInputType.text,
                controller: nameItemEnglish! ,

                hintText: Translator.translate("Name Item in English"), prefixIconData: null,



              ),

              CustomTextField(
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please enter your Description Name Arabic';
                  }
                  if (!RegExp(r'[\u0600-\u06FF0-9\s]+').hasMatch(value)) {
                    return 'Please enter only character  Arabic';
                  }
                  return null;
                },
                keyBoard: TextInputType.text,
                controller: desItemArabic! ,

                hintText: Translator.translate("Description Item in Arabic"),

                onPrefixIconPress: () {
                  setState(() {

                  });
                }, prefixIconData: null,

              ),

              CustomTextField(
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please enter your manger Name English';
                  }
                  if (!RegExp(r'^[a-zA-Z0-9 ]*$').hasMatch(value)) {
                    return 'please only character in English';
                  }
                  return null;
                },
                keyBoard: TextInputType.text,
                controller: desItemEnglish! ,

                hintText: Translator.translate("Description Item in English"),

                onPrefixIconPress: () {
                  setState(() {

                  });
                }, prefixIconData: null,

              ),
              CustomTextField(
                keyBoard: TextInputType.text,
                controller: priceItem! ,

                hintText: Translator.translate("Price Item"),

                onPrefixIconPress: () {
                  setState(() {

                  });
                }, prefixIconData: null,

              ),


              Obx(() {
                if(controller.isWaiting){
                  return const Text('mo');
                }
                if(controller.isError){
                  return const Text('g');}
                return
                  Container(
                      height: MediaQuery.of(context).size.height * 0.06,
                      margin: Spacing.symmetric(horizontal: 20,vertical: 10
                      
                      ),
                      decoration: BoxDecoration(borderRadius: BorderRadius.circular(10) ,
                        border: Border.all(color: const Color(0xffdcdee3), width: 1.5),),
                      padding: const EdgeInsets.all(10),
                      child: DropdownButton<SubCategoriesAccepted>(
                        underline: Container(),
                        value: selectedCategory,
                        borderRadius: BorderRadius.circular(20),
                        dropdownColor: Colors.white,
                        hint: const Text('please select subcategory'),// Set a default value if needed.
                        onChanged: (SubCategoriesAccepted? newValue) {

                          setState(() {
                            selectedCategory=newValue!;
                            log(selectedCategory!.title!.en.toString());
                            log(selectedCategory!.id.toString());
                          });
                          // Handle the selected category.
                        },
                        items: controller.category
                            .map((category) => DropdownMenuItem<SubCategoriesAccepted>(
                          value: category,
                          child: Text(category!.title!.en),
                        ))
                            .toList(),
                      )  );






              }),
              CustomTextField(
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please enter your numbr';
                  }
                  return null;

                },
                keyBoard: TextInputType.number,
                controller: number! ,

                hintText: Translator.translate("num Item in Arabic"),

                onPrefixIconPress: () {
                  setState(() {

                  });
                }, prefixIconData: null,

              ),


              const SizedBox(height: 20,),
              // addWallet.errorList.isNotEmpty?      Obx(() =>
              //      ListView.builder(shrinkWrap: true,
              //   itemCount: addWallet.errorList.length,
              //   itemBuilder: (context, index) {
              //     return Row(
              //       children: [
              //         Icon(Icons.error_outline,color: Colors.red,),
              //         SizedBox(width: 5,),
              //         Text(
              //           addWallet.errorList[index],
              //           softWrap: false,
              //           style: TextStyle(
              //
              //             overflow: TextOverflow.ellipsis,
              //
              //             color: Colors.red,
              //           ),
              //         ),
              //       ],
              //     );
              //   },
              // ))
              //     : Text(''),
              CommonViews().createButton(title: 'Save',    onPressed: () async {
                print('not');
                if (formKey.currentState!.validate()) {
                  print('not');

                  final dio = Dio(); // Create a Dio instance

                  final formData = FormData();

                  // Define the API endpoint URL
                  const url =
                      "https://news.wasiljo.com/public/api/v1/manager/wallets";
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

                    MapEntry('usage', number!.text),
                    MapEntry('subcategory_id',selectedCategory!.id.toString()),




                    MapEntry('price', priceItem!.text),





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
//               CommonViews().createButton(title: 'Save',    onPressed: () async {
//                 log(profilePic!.path);
//                 log(profilePic.toString());
// addWallet.AddWallet(image:profilePic!.path,nameEn: nameItemEnglish!.text, price:priceItem!.text, count: number!.text,desEn:desItemEnglish!.text,desAr: desItemArabic!.text,subcategoryId: selectedCategory!.id,nameAr: nameItemArabic!.text );
//               }),
            ],
          ),
        ),
      ),
    );
  }
}
