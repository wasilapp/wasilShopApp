import 'dart:convert';
import 'dart:developer';
import 'package:dio/dio.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_instance/src/extension_instance.dart';
import 'package:get/get_state_manager/src/rx_flutter/rx_obx_widget.dart';


import 'package:http/http.dart' as http;
import 'package:flutter/material.dart';
import 'package:mangerapp/config/custom_package.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:sizer/sizer.dart';

import '../../generated/l10n.dart';
import '../all_items/all_items.dart';
import 'add_admin_controller.dart';
import 'item_admin_model.dart';




class AddItemFromAdmin extends StatefulWidget {
  const AddItemFromAdmin({super.key});

  @override
  State<AddItemFromAdmin> createState() => _AddItemFromAdminState();
}

class _AddItemFromAdminState extends State<AddItemFromAdmin> {
  List<Map<String, dynamic>> subAdminCategories = [];
 String errorMessages ='';
  SubAdminCategories? selectedCategory;
  @override
  void initState() {
    super.initState();
    print('ll');
    // fetchData();
  }
  Future<void> addItem(String categoryId) async {
    final url = Uri.parse('https://admin.wasiljo.com/public/api/v1/manager/subcategories/select');

    final Map<String, dynamic> body = {
      "subCategories": categoryId,
    };
    SharedPreferences prefs =
    await SharedPreferences.getInstance();
    // Define the request headers
    var bearerToken=prefs.getString('token');
    final headers = <String, String>{
      'Content-Type': 'application/json',
      'Authorization': 'Bearer $bearerToken'
    };

    final response = await http.post(
      url,
      headers: headers,
      body: jsonEncode(body),
    );

    if (response.statusCode == 200) {
      // Successfully added the item, you can handle the response here if needed.
      print('Item added successfully');
    } else {
      // Handle the error in case of a non-200 status code.
      print('Failed to add item. Status code: ${response.statusCode}');
    }
  }
  // Future<void> fetchData() async {
  //   SharedPreferences prefs =
  //   await SharedPreferences.getInstance();
  //   // Define the request headers
  //   var bearerToken=prefs.getString('token');
  //   final headers = {
  //
  //     'Authorization': 'Bearer $bearerToken'
  //   };
  //   final response = await http.get(
  //       Uri.parse('https://admin.wasiljo.com/public/api/v1/manager/categories'),
  //     headers: headers
  //   );
  //
  //   if (response.statusCode == 200) {
  //     print("tes");
  //     final data = json.decode(response.body);
  //     setState(() {
  //       subAdminCategories = data['data']['allCategories'][0]['sub_admin_categories']
  //           .map<Map<String, dynamic>>(
  //               (category) => {
  //             'title': category['title']['en'],
  //                 'description':category['description']['en'],
  //                 'image_url':category['image_url'],
  //             'price': category['price'],
  //             'id': category['id'],
  //             'category_id': category['category_id'],
  //           })
  //           .toList();
  //     });
  //   }
  // }
  ItemController controller=Get.put(ItemController());
  TextEditingController?  priceItem = TextEditingController();
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {

    return SafeArea(
        child: Scaffold(
        appBar: AppBar(backgroundColor: backgroundColor,actionsIconTheme: IconThemeData(color: Colors.black),
    iconTheme: IconThemeData(color: Colors.black),
    elevation: 0, ),
    body:Form(
    key: formKey,
    child: ListView(
      children: [
             SizedBox(height: 2.h,),
            Row(
              children: [
                Padding(
                  padding:  EdgeInsets.symmetric(horizontal: 5.0.w),
                  child: Text(Translator.translate(S.of(context).addNewItems),style: boldPrimary,),
                ),
              ],
            ),
            Obx(() {
              if(controller.isWaiting){
                return Text('mo');
              }
              if(controller.isError){
                return Text('g');}
              return
                Container(

                    height: MediaQuery.of(context).size.height * 0.06,
                    margin: Spacing.fromLTRB(24, 16, 24, 0),
                    decoration: BoxDecoration(borderRadius: BorderRadius.circular(10) ,
                      border: Border.all(color: Color(0xffdcdee3), width: 1.5),),
                    padding: EdgeInsets.all(10),
                    child: DropdownButton<SubAdminCategories>(
                      isExpanded: true,
                      underline: Container(),
                      value: selectedCategory,
                      borderRadius: BorderRadius.circular(20),
                      dropdownColor: Colors.white,
                      hint: Text(S.of(context).pleaseSelectCategory),// Set a default value if needed.
                      onChanged: (SubAdminCategories? newValue) {

                        setState(() {
                          selectedCategory=newValue!;
                          log(selectedCategory!.title!.en.toString());
                          log(selectedCategory!.id.toString());
                        });
                        // Handle the selected category.
                      },
                      items: controller.category
                          .map((category) => DropdownMenuItem<SubAdminCategories>(
                        value: category,
                        child: Text(category!.title!.ar),
                      ))
                          .toList(),
                    )  );






            }),
        CustomTextField(
          keyBoard: TextInputType.number,
          controller: priceItem! ,

          hintText: Translator.translate(S.of(context).priceItem),

          onPrefixIconPress: () {
            setState(() {

            });
          }, prefixIconData: null,

        ),
        const SizedBox(height: 20,),

        CommonViews().createButton(title: S.of(context).addItem,    onPressed: () async {
          SharedPreferences prefs =
          await SharedPreferences.getInstance();
          var bearerToken =prefs.getString('token');
          var headers = {
            'Content-Type': 'application/json',
            'Authorization': 'Bearer $bearerToken'
          };
          var request = http.Request('POST', Uri.parse('https://admin.wasiljo.com/public/api/v1/manager/subcategories/select'));
          request.body = json.encode([
            {
              "sub_category_id": selectedCategory!.id.toString(),
              "price": priceItem!.text,
             // "quantity": qu
            },

          ]);
          request.headers.addAll(headers);

          http.StreamedResponse response = await request.send();

          if (response.statusCode == 200) {
            print("done");
            Get.snackbar(S.of(context).doneAdditem, '',
                backgroundColor:primaryColor, snackPosition: SnackPosition.BOTTOM,
                icon: const Icon(Icons.done_outline_rounded));
            print(await response.stream.bytesToString());
            Get.offAll(AllItems());
          }
          else {
            print(response.reasonPhrase);
          }


        }),
      ]  ),
      ),
        ));
  }
}