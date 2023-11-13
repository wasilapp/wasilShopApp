import 'dart:convert';
import 'package:http/http.dart'as http;
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mangerapp/utils/colors.dart';
import 'package:mangerapp/utils/helper/navigator.dart';
import 'package:mangerapp/views/add_wallet/add_walet_view.dart';
import 'package:http/http.dart' as http;
import 'package:mangerapp/views/additem.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../../utils/helper/size.dart';
import '../add.dart';

class AllItems extends StatefulWidget {
  const AllItems({super.key});

  @override
  State<AllItems> createState() => _AllItemsState();
}

class _AllItemsState extends State<AllItems> {
  List<dynamic> subCategoriesActive = [];
  List<dynamic> walletCategoriesActive = [];
  List<dynamic> subCategoriesPendung = [];
  List<dynamic> walletCategoriesPendung = [];

  @override
  void initState() {
    super.initState();
    fetchSubCategories();
    fetchWalletCategories();
  }

  Future<void> fetchSubCategories() async {
    SharedPreferences prefs =
    await SharedPreferences.getInstance();
    var bearerToken =prefs.getString('token');

    final response = await http.get(Uri.parse(
        'https://news.wasiljo.com/public/api/v1/manager/mySubCategories',
    ),    headers: {'Authorization': 'Bearer $bearerToken'},);

    if (response.statusCode == 200) {
      print('yes');
      final jsonData = json.decode(response.body);
      setState(() {
        subCategoriesPendung = jsonData['data']['subCategoriesPending'];
        subCategoriesActive = jsonData['data']['subCategoriesAccepted'];
print(subCategoriesPendung);
      });
    } else {
      throw Exception('Failed to load subcategories');
    }}
  Future<void> fetchWalletCategories() async {
    SharedPreferences prefs =
    await SharedPreferences.getInstance();
    var bearerToken =prefs.getString('token');

    final response = await http.get(Uri.parse(
        'https://news.wasiljo.com/public/api/v1/manager/my-wallets',
    ),    headers: {'Authorization': 'Bearer $bearerToken'},);

    if (response.statusCode == 200) {
      print('yes');
      final jsonData = json.decode(response.body);
      setState(() {
        walletCategoriesPendung = jsonData['data']['walletsPending'];
        walletCategoriesActive = jsonData['data']['walletsAccepted'];
print(walletCategoriesPendung);
      });
    } else {
      throw Exception('Failed to load subcategories');
    }}
      @override
  Widget build(BuildContext context) {
        final GlobalKey<RefreshIndicatorState> _refreshIndicatorKey =
        GlobalKey<RefreshIndicatorState>();     final GlobalKey<RefreshIndicatorState> refreshIndicatorKey1 =
        GlobalKey<RefreshIndicatorState>();
    return DefaultTabController(
        length: 2,
        child: SafeArea(
          child: Scaffold(

            floatingActionButton: FloatingActionButton(
              onPressed: () {
                MangerNavigator.of(context).push(const AddSubCategory());},
              backgroundColor: primaryColor,
              shape: const StadiumBorder(),
              child: const Icon(
                Icons.add,
                color: backgroundColor,
              ),
            ),
            appBar: AppBar(
iconTheme: IconThemeData(color: secondaryColor),
              backgroundColor: backgroundColor,

              bottom: const TabBar(
                indicatorColor: primaryColor,
                labelColor: primaryColor,
                unselectedLabelColor: primaryColor,



                tabs: [
                  Tab(text: 'Active '),
                  Tab(text: 'Pending '),

                ],
              ),
            ),
            body:
     TabBarView(
              children: [
       RefreshIndicator(
       key: _refreshIndicatorKey,
       onRefresh: () async {
         await Future.delayed(Duration(seconds: 2));
         fetchSubCategories();
         fetchWalletCategories();
         return;
       },child:
       Column(
         children: [
           ListView.builder(
                    shrinkWrap: true,
                    itemCount: subCategoriesActive.length,
                    itemBuilder: (context, index) {
                      final subCategory = subCategoriesActive[index];
                      return Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: ListTile(trailing: IconButton(icon: Icon(Icons.edit),onPressed: () {

                        },),
                          leading: Image.network(
                            'https://news.wasiljo.com/${subCategory['image_url']}',
                            width: 50,
                            height: 80,
                            fit: BoxFit.cover,
                          ),
                          title: Text(
                            subCategory['title']['en'],
                            style: const TextStyle(fontWeight: FontWeight.bold),
                          ),
                          subtitle: Column(crossAxisAlignment:CrossAxisAlignment.start ,
                            children: [
                              const SizedBox(height: 10,),
                              Text('Price: \$${subCategory['price']}'),
                              const SizedBox(width: 10,),
                              Row(
                                children: [

const SizedBox(height: 10,),
                                  InkWell(
                                    onTap: () async {
                                      print('ll');
                                      SharedPreferences prefs =
                                      await SharedPreferences.getInstance();
                                      // Define the request headers
                                      var bearerToken=prefs.getString('token');
                                      var headers = {
                                        'Authorization': 'Bearer $bearerToken'
                                      };
                                      var response =await http.post(
                                          Uri.parse('https://news.wasiljo.com/public/api/v1/manager/subcategories/remove/${subCategory['id']}'),
                                          headers: headers);





                                      if (response.statusCode == 200) {
                                        print(await response.body);
                                        fetchSubCategories();
                                        fetchWalletCategories();
                                        Get.snackbar('deleted', '',
                                            backgroundColor:primaryColor, snackPosition: SnackPosition.BOTTOM,
                                            icon: const Icon(Icons.done_outline_rounded));

                                      }
                                      else {
                                        print(response.body);
                                      }

                                    },
                                    child: Container(
                                      padding: const EdgeInsets.all(5),


                                      child: const Row(
                                        children: [
                                          Icon(Icons.delete,color: Colors.red,),
                                          Text('Delete')
                                        ],
                                      ),
                                    ),
                                  ),
                                  const SizedBox(width: 10,),
                                           InkWell(
                                    onTap: () async {
                                      SharedPreferences prefs =
                                          await SharedPreferences.getInstance();
                                      // Define the request headers
                                      var bearerToken=prefs.getString('token');
                                      var headers = {
                                        'Authorization': 'Bearer $bearerToken'
                                      };
                                      var response =  await http.post( Uri.parse('https://news.wasiljo.com/public/api/v1/manager/subcategories/show-hide/${subCategory['id']}/${subCategory['pivot']['is_show']}'),
                                      headers: headers);



                                      if (response.statusCode == 200) {
                                        print(await response.body);
                                        Get.snackbar('done hidden', '',
                                            backgroundColor:primaryColor, snackPosition: SnackPosition.BOTTOM,
                                            icon: const Icon(Icons.done_outline_rounded));
                                        fetchWalletCategories();
                                        fetchSubCategories();
                                      }
                                      else {
                                      print(response.reasonPhrase);
                                      }


                                      print(subCategory['pivot']['is_show']);
                                    },
                                    child: Container(
                                      padding: const EdgeInsets.all(5),


                                      child:  Row(
                                        children: [
                                          Icon(subCategory['pivot']['is_show']=='show'?  Icons.visibility_off:Icons.visibility,color:subCategory['pivot']['is_show']=='show'?   Colors.grey:Colors.green,),
                                          Text(subCategory['pivot']['is_show']=='show'?  'Hidden':'show')
                                        ],
                                      ),
                                    ),
                                  ),

                                ],
                              ),
                            ],
                          ),
                          onTap: () {
                            // Handle tap on subcategory (if needed)
                          },
                        ),
                      );
                    },
                  ),
           ListView.builder(
                    shrinkWrap: true,
                    itemCount: walletCategoriesActive.length,
                    itemBuilder: (context, index) {
                      final subCategory = walletCategoriesActive[index];
                      return Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: ListTile(
                          leading: Image.network(
                            'https://news.wasiljo.com/${subCategory['image_url']}',
                            width: 50,
                            height: 80,
                            fit: BoxFit.cover,
                          ),
                          title: Text(
                            subCategory['title']['en'],
                            style: const TextStyle(fontWeight: FontWeight.bold),
                          ),
                          subtitle: Row(
                            children: [
                              Text('Price: \$${subCategory['price']}'),
const SizedBox(width: 10,),
                              InkWell(
                                onTap: () async {
                                  print('ll');
                                  SharedPreferences prefs =
                                      await SharedPreferences.getInstance();
                                  // Define the request headers
                                  var bearerToken=prefs.getString('token');
                                  var headers = {
                                    'Authorization': 'Bearer $bearerToken'
                                  };
                                  var response =await http.post(
                                      Uri.parse('https://news.wasiljo.com/public/api/v1/manager/subcategories/remove/4'),
                                  headers: headers);





                                  if (response.statusCode == 200) {
                                    print(await response.body);
                                    fetchSubCategories();
                                    fetchWalletCategories();
                                    Get.snackbar('deleted', '',
                                        backgroundColor:primaryColor, snackPosition: SnackPosition.BOTTOM,
                                        icon: const Icon(Icons.done_outline_rounded));

                                  }
                                  else {
                                  print(response.body);
                                  }

                                },
                                child: Container(
                                  padding: const EdgeInsets.all(5),


                                  child: const Row(
                                    children: [
                                      Icon(Icons.delete,color: Colors.red,),
                                      Text('Delete')
                                    ],
                                  ),
                                ),
                              ),
                              const SizedBox(width: 10,),
                              Container(
                                padding: const EdgeInsets.all(5),


                                child: const Row(
                                  children: [
                                    Icon(Icons.visibility_off,color: Colors.grey,),
                                    Text('Hidden')
                                  ],
                                ),
                              ),

                            ],
                          ),
                          onTap: () {
                            // Handle tap on subcategory (if needed)
                          },
                        ),
                      );
                    },
                  ),
         ],
       )),
            RefreshIndicator(
              key: refreshIndicatorKey1,
              onRefresh: () async {
                await Future.delayed(Duration(seconds: 2));
                fetchSubCategories();
                fetchWalletCategories();
                return;
              },child:
            Column(
              children: [
                ListView.builder(
                    shrinkWrap: true,
                    itemCount: subCategoriesPendung.length,
                    itemBuilder: (context, index) {
                      final subCategory = subCategoriesPendung[index];
                      return Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Column(
                          children: [
                            ListTile(
                              leading: Image.network(
                                'https://news.wasiljo.com/${subCategory['image_url']}',
                                width: 50,
                                height: 80,
                                fit: BoxFit.cover,
                              ),
                              title: Text(
                                subCategory['title']['en'],
                                style: const TextStyle(fontWeight: FontWeight.bold),
                              ),
                              subtitle: Row(
                                children: [
                                  Text('Price: \$${subCategory['price']}'),
const SizedBox(width: 10,),
                                  // Container(
                                  //   padding: const EdgeInsets.all(5),
                                  //
                                  //
                                  //   child: const Row(
                                  //     children: [
                                  //       Icon(Icons.delete,color: Colors.red,),
                                  //       Text('Delete')
                                  //     ],
                                  //   ),
                                  // ),
                                  // const SizedBox(width: 10,),
                                  // Container(
                                  //   padding: const EdgeInsets.all(5),
                                  //
                                  //
                                  //   child: const Row(
                                  //     children: [
                                  //       Icon(Icons.visibility_off,color: Colors.grey,),
                                  //       Text('Hidden')
                                  //     ],
                                  //   ),
                                  // ),

                                ],
                              ),
                              onTap: () {
                                // Handle tap on subcategory (if needed)
                              },
                            ),
                            Divider(color: borderColor,thickness: 2,)
                          ],
                        ),
                      );
                    },
                  ),
                ListView.builder(
                    shrinkWrap: true,
                    itemCount: walletCategoriesPendung.length,
                    itemBuilder: (context, index) {
                      final subCategory = walletCategoriesPendung[index];
                      return Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Column(
                          children: [
                            ListTile(
                              leading: Image.network(
                                'https://news.wasiljo.com/${subCategory['image_url']}',
                                width: 50,
                                height: 80,
                                fit: BoxFit.cover,
                              ),trailing: IconButton(onPressed: () {

                              },
                              icon:Icon (Icons.arrow_back_outlined),
                            ),
                              title: Text(
                                subCategory['title']['en'],
                                style: const TextStyle(fontWeight: FontWeight.bold),
                              ),
                              subtitle: Row(
                                children: [
                                  Text('Price: \$${subCategory['price']}'),
const SizedBox(width: 10,),
                                  // Container(
                                  //   padding: const EdgeInsets.all(5),
                                  //
                                  //
                                  //   child: const Row(
                                  //     children: [
                                  //       Icon(Icons.delete,color: Colors.red,),
                                  //       Text('Delete')
                                  //     ],
                                  //   ),
                                  // ),
                                  // const SizedBox(width: 10,),
                                  // Container(
                                  //   padding: const EdgeInsets.all(5),
                                  //
                                  //
                                  //   child: const Row(
                                  //     children: [
                                  //       Icon(Icons.visibility_off,color: Colors.grey,),
                                  //       Text('Hidden')
                                  //     ],
                                  //   ),
                                  // ),

                                ],
                              ),
                              onTap: () {
                                // Handle tap on subcategory (if needed)
                              },
                            ),
                            Divider(color: borderColor,thickness: 2,)
                          ],
                        ),
                      );
                    },
                  ),
              ],
            )),

              ],
            ),
            ),
          ),
        );
//       SafeArea(
//       child: Scaffold(
//         appBar: AppBar(backgroundColor: backgroundColor,actionsIconTheme: IconThemeData(color: Colors.black),
//             iconTheme: IconThemeData(color: Colors.black),
//             elevation: 0,
//           // title: Text("Update Profile".tr,style: TextStyle(color:Color(0xff373636),fontSize: 18,
//           //   fontWeight: FontWeight.w400,)),
//            ),
//         body: Padding(
//           padding: const EdgeInsets.symmetric(horizontal: 10.0),
//           child: Column(
//             children: [
//
//               const SizedBox(height: 0,),
//               InkWell(
//                 onTap: () {
//                   MangerNavigator.of(context).push(const AddItem());
//                 },
//                 child: Container(
//                     margin: Spacing.fromLTRB(16, 8, 16, 8),
//                     padding: Spacing.all(16),
//                     decoration: BoxDecoration(
//                         color:backgroundColor,
//                         borderRadius: const BorderRadius.all(Radius.circular(8)),
//                         border: Border.all(color: borderColor,width: 1.5)),
//                   child: Row(
//                     children: <Widget>[
//                       Container(
//                         width: 48,
//                         height: 48,
//                         decoration: const BoxDecoration(
//                           image: DecorationImage(
//                               image: AssetImage('assets/images/item-icon-2179.png'),
//                               fit: BoxFit.fill),
//                         ),
//                       ),
//                       Expanded(
//                         child: Container(
//                           margin: Spacing.only(left: 16),
//                           child: const Column(
//                             crossAxisAlignment: CrossAxisAlignment.start,
//                             children: [
//                               Text("Add New Items",
//                                   style:TextStyle(
//                                     fontWeight: FontWeight.w500,
//                                       letterSpacing: 0.2)),
//                               Text('Click here',
//                                   style: TextStyle(color: Colors.grey,
//                                       fontWeight: FontWeight.w500)),
//                             ],
//                           ),
//                         ),
//                       )
//                     ],
//                   ),
//                 ),
//               ),
//

// //               ListView.builder(
// //                 shrinkWrap: true,
// //                 itemCount: subCategories.length,
// //                 itemBuilder: (context, index) {
// //                   final subCategory = subCategories[index];
// //                   return Padding(
// //                     padding: const EdgeInsets.all(8.0),
// //                     child: ListTile(
// //                       leading: Image.network(
// //                         'https://news.wasiljo.com/${subCategory['image_url']}',
// //                         width: 50,
// //                         height: 80,
// //                         fit: BoxFit.cover,
// //                       ),
// //                       title: Text(
// //                         subCategory['title']['en'],
// //                         style: const TextStyle(fontWeight: FontWeight.bold),
// //                       ),
// //                       subtitle: Row(
// //                         children: [
// //                           Text('Price: \$${subCategory['price']}'),
// // const SizedBox(width: 10,),
// //                           Container(
// //                             padding: const EdgeInsets.all(5),
// //
// //
// //                             child: const Row(
// //                               children: [
// //                                 Icon(Icons.delete,color: Colors.red,),
// //                                 Text('Delete')
// //                               ],
// //                             ),
// //                           ),
// //                           const SizedBox(width: 10,),
// //                           Container(
// //                             padding: const EdgeInsets.all(5),
// //
// //
// //                             child: const Row(
// //                               children: [
// //                                 Icon(Icons.visibility_off,color: Colors.grey,),
// //                                 Text('Hidden')
// //                               ],
// //                             ),
// //                           ),
// //
// //                         ],
// //                       ),
// //                       onTap: () {
// //                         // Handle tap on subcategory (if needed)
// //                       },
// //                     ),
// //                   );
// //                 },
// //               ),
//
//             ],
//           ),
//         ),
//       ),
//     );
  }
}
