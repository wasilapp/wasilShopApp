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
import '../../generated/l10n.dart';
import '../../utils/helper/size.dart';
import '../add.dart';
import '../items/add_admin_controller.dart';
import '../items/add_itemadmin.dart';
import 'all_item_controller.dart';
import 'all_item_model.dart';

class AllItems extends StatefulWidget {
  const AllItems({super.key});

  @override
  State<AllItems> createState() => _AllItemsState();
}

class _AllItemsState extends State<AllItems> {

  ItemController controller=Get.put(ItemController());
  var subCategoriesActive = [];
  var walletCategoriesActive = [];
  var subCategoriesPendung = [];
  var walletCategoriesPendung = [];
  //------------------------ Get all categories -----------------------------------------//
  void fetchSubCategories() async {
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
      });

      print('subCategoriesPendung');
      print(subCategoriesActive.length);
      print(subCategoriesActive);

    } else {
      throw Exception('Failed to load subcategories');
    }}
  // fetchWalletCategories() async {
  //   SharedPreferences prefs =
  //   await SharedPreferences.getInstance();
  //   var bearerToken =prefs.getString('token');
  //
  //   final response = await http.get(Uri.parse(
  //     'https://news.wasiljo.com/public/api/v1/manager/my-wallets',
  //   ),    headers: {'Authorization': 'Bearer $bearerToken'},);
  //
  //   if (response.statusCode == 200) {
  //     print('yes');
  //     final jsonData = json.decode(response.body);
  //
  //     walletCategoriesPendung = jsonData['data']['walletsPending'];
  //     walletCategoriesActive  = jsonData['data']['walletsAccepted'];
  //     print(walletCategoriesPendung );
  //
  //   } else {
  //     throw Exception('Failed to load subcategories');
  //   }}
  @override
  void initState() {
    super.initState();
   fetchSubCategories();
    fetchWalletCategories();
  }

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

  final GlobalKey<RefreshIndicatorState> _refreshTap = GlobalKey<RefreshIndicatorState>();

  ItemsController controllerItem =Get.put(ItemsController());
      @override
  Widget build(BuildContext context) {
        final GlobalKey<RefreshIndicatorState> refreshIndicatorKey1 =
        GlobalKey<RefreshIndicatorState>();
    return DefaultTabController(
        length: 2,
        child: SafeArea(
          child: Scaffold(

            floatingActionButton: FloatingActionButton(
              onPressed: () {
                Get.defaultDialog(
                  title: S.of(context).addItem,
                  content: Column(
                    children: [
                      ElevatedButton(style: ElevatedButton.styleFrom(backgroundColor: primaryColor),
                          onPressed: () {
                        Get.to(AddItemFromAdmin());
                      }, child: Text(S.of(context).addItemFromAdmain)),
                      ElevatedButton(onPressed: () {
                        Get.to(AddNewWallet());
                      }, style: ElevatedButton.styleFrom(backgroundColor: primaryColor),child: Text(S.of(context).addCouponBook)),   ElevatedButton(onPressed: () {
                        Get.to(AddItem());
                      }, child: Text(S.of(context).addItemStore),style: ElevatedButton.styleFrom(backgroundColor: primaryColor),),
                    ],
                  )
                );
            //    MangerNavigator.of(context).push(const AddSubCategory());
          },
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

              bottom:  TabBar(
                indicatorColor: primaryColor,
                labelColor: primaryColor,
                unselectedLabelColor: primaryColor,



                tabs: [
                  Tab(text: S.of(context).active),
                  Tab(text: S.of(context).pending),

                ],
              ),
            ),
            body:
      TabBarView(
              children: [
                buildActiveItem(subCategoriesActive,walletCategoriesActive),
                buildPendingItem(subCategoriesPendung,walletCategoriesPendung),


//             RefreshIndicator(
//               key: refreshIndicatorKey1,
//               onRefresh: () async {
//                 await Future.delayed(Duration(seconds: 2));
//                 if(walletCategoriesPendung.length==0){
//                   print("not wallet");
//                   controllerItem.fetchSubCategories();
//
//                 } if(controllerItem.subCategoriesPendung.length==0){
//                   print("not sub");
//                   fetchWalletCategories();
//                 }if(controllerItem.subCategoriesPendung.length==0&&walletCategoriesPendung.length==0){
//                   print("not wallet and sub");
//
//                 }if(controllerItem.subCategoriesPendung.isNotEmpty&&walletCategoriesPendung.isNotEmpty){
//                   print(" wallet and sub");
//                   // fetchSubCategories();
//                   controllerItem.fetchSubCategories();
//                 }
//
//
//                 return;
//               },child:
//             SingleChildScrollView(physics:ClampingScrollPhysics() ,
//               child: Column(
//                 children: [
//          Obx(() =>
//              ListView.builder(physics: ClampingScrollPhysics(),
//                       shrinkWrap: true,
//                       itemCount:  controllerItem.subCategoriesPendung.length,
//                       itemBuilder: (context, index) {
//
//                         return buildPendingItem(controllerItem.subCategoriesPendung[index]);
//
//                       },
//                     )),
//                   ListView.builder(
//                       shrinkWrap: true,
//                       itemCount:  walletCategoriesPendung.length,
//                       itemBuilder: (context, index) {
//                         final subCategory =  walletCategoriesPendung[index];
//                         return Padding(
//                           padding: const EdgeInsets.all(8.0),
//                           child: Column(
//                             children: [
//                               ListTile(
//                                 // leading: Image.network(
//                                 //   'https://news.wasiljo.com/${subCategory['']}',
//                                 //   width: 50,
//                                 //   height: 80,
//                                 //   fit: BoxFit.cover,
//                                 // ),
//                                 trailing: IconButton(onPressed: () {
//
//                                 },
//                                 icon:Icon (Icons.arrow_back_outlined),
//                               ),
//                                 title: Text(
//                                   subCategory['title']['en'],
//                                   style: const TextStyle(fontWeight: FontWeight.bold),
//                                 ),
//                                 subtitle: Row(
//                                   children: [
//                                     Text('Price: \$${subCategory['price']}'),
// const SizedBox(width: 10,),
//                                     // Container(
//                                     //   padding: const EdgeInsets.all(5),
//                                     //
//                                     //
//                                     //   child: const Row(
//                                     //     children: [
//                                     //       Icon(Icons.delete,color: Colors.red,),
//                                     //       Text('Delete')
//                                     //     ],
//                                     //   ),
//                                     // ),
//                                     // const SizedBox(width: 10,),
//                                     // Container(
//                                     //   padding: const EdgeInsets.all(5),
//                                     //
//                                     //
//                                     //   child: const Row(
//                                     //     children: [
//                                     //       Icon(Icons.visibility_off,color: Colors.grey,),
//                                     //       Text('Hidden')
//                                     //     ],
//                                     //   ),
//                                     // ),
//
//                                   ],
//                                 ),
//                                 onTap: () {
//                                   // Handle tap on subcategory (if needed)
//                                 },
//                               ),
//                               Divider(color: borderColor,thickness: 2,)
//                             ],
//                           ),
//                         );
//                       },
//                     ),
//                 ],
//               ),
//             )),

              ],
            ),
            ),
          ),
        );

  }

Widget buildActiveItem(  subCategoryList,wallet) {
  final GlobalKey<RefreshIndicatorState> _refreshIndicatorKey =
  GlobalKey<RefreshIndicatorState>();
  return     RefreshIndicator(
            key: _refreshIndicatorKey,
            onRefresh: () async {
          await Future.delayed(Duration(seconds: 2));
           fetchSubCategories();
          fetchWalletCategories();
          print(subCategoriesPendung);
          return;
        },child:
        Column(
        children: [
//         ListView.builder(
//         shrinkWrap: true,
//         itemCount: subCategoriesActive.length,
//         itemBuilder: (context, index) {
//
//         return Padding(
//                       padding: const EdgeInsets.all(8.0),
//                       child: ListTile(trailing: IconButton(icon: Icon(Icons.edit),onPressed: () {
//
//                       },),
//                         leading: Image.network(
//                           'https://news.wasiljo.com/${subCategory['imageUrl']}',
//                           width: 50,
//                           height: 80,
//                           fit: BoxFit.cover,
//                         ),
//                         title: Text(
//                           subCategory['title']['en'].toString(),
//                           style: const TextStyle(fontWeight: FontWeight.bold),
//                         ),
//                         subtitle: Column(crossAxisAlignment:CrossAxisAlignment.start ,
//                           children: [
//                             const SizedBox(height: 10,),
//                             Text('Price: \$${subCategory.pivot!.price}'),
//                             const SizedBox(width: 10,),
//                             Row(
//                               children: [
//
// const SizedBox(height: 10,),
//                                 InkWell(
//                                   onTap: () async {
//                                     print('ll');
//                                     controllerItem.deleteItem(subCategory.id);
//                                  //   fetchSubCategories();
//                                   },
//                                   child: Container(
//                                     padding: const EdgeInsets.all(5),
//
//
//                                     child: const Row(
//                                       children: [
//                                         Icon(Icons.delete,color: Colors.red,),
//                                         Text('Delete')
//                                       ],
//                                     ),
//                                   ),
//                                 ),
//                                 const SizedBox(width: 10,),
//                                          InkWell(
//                                   onTap: () async {
//                                     print('https://news.wasiljo.com/public/api/v1/manager/subcategories/show-hide/');
//
//                                     SharedPreferences prefs =
//                                         await SharedPreferences.getInstance();
//                                     // Define the request headers
//                                     var bearerToken=prefs.getString('token');
//                                     var headers = {
//                                       'Authorization': 'Bearer $bearerToken'
//                                     };
//                                     var response =  await http.post( Uri.parse('https://news.wasiljo.com/public/api/v1/manager/subcategories/show-hide/${subCategory.id}/${subCategory.pivot!.isShow}}'),
//                                     headers: headers);
//
//
//                                     if (response.statusCode == 200) {
//                                       print(await response.body);
//                                       Get.snackbar('done hidden', '',
//                                           backgroundColor:primaryColor, snackPosition: SnackPosition.BOTTOM,
//                                           icon: const Icon(Icons.done_outline_rounded));
//                                       fetchWalletCategories();
//                                     //  fetchSubCategories();
//                                     }
//                                     else {
//                                     print(response.reasonPhrase);
//                                     }
//
//
//                                   },
//                                   child: Container(
//                                     padding: const EdgeInsets.all(5),
//
//
//                                     child:  Row(
//                                       children: [
//                                         // Icon({subCategory.pivot!.isShow}=='show'?  Icons.visibility_off:Icons.visibility,color:subCategory['pivot']['is_show']=='show'?   Colors.grey:Colors.green,),
//                                         // Text({subCategory.pivot!.isShow}=='show'?  'Hidden':'show')
//                                       ],
//                                     ),
//                                   ),
//                                 ),
//
//                               ],
//                             ),
//                           ],
//                         ),
//                         onTap: () {
//                           // Handle tap on subcategory (if needed)
//                         },
//                       ),
//                     )         ;          },
//         )
          ListView.builder(

            shrinkWrap: true,
            itemCount:  wallet.length,
            itemBuilder: (context, index) {
              final subCategory =  wallet[index];
              //var isShow=subCategory['pivot']['is_show'];
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
                              Uri.parse('https://news.wasiljo.com/public/api/v1/manager/subcategories/remove/${subCategory['id']}'),
                              headers: headers);





                          if (response.statusCode == 200) {
                            print(await response.body);
                            fetchWalletCategories();
                            fetchSubCategories();
                            Get.snackbar(S.of(context).deleted, '',
                                backgroundColor:primaryColor, snackPosition: SnackPosition.BOTTOM,
                                icon: const Icon(Icons.done_outline_rounded));

                          }
                          else {

                            Get.snackbar(S.of(context).filed, '${json.decode(response.body)['error']}',
                                backgroundColor:Colors.red, snackPosition: SnackPosition.BOTTOM,
                                icon: const Icon(Icons.error));
                          }

                        },
                        child: Container(
                          padding: const EdgeInsets.all(5),


                          child:  Row(
                            children: [
                              Icon(Icons.delete,color: Colors.red,),
                              Text(S.of(context).delete)
                            ],
                          ),
                        ),
                      ),
                      const SizedBox(width: 10,),
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

                      // InkWell(
                      //   onTap: () async {
                      //     fetchWalletCategories();
                      //     print(subCategory['pivot']['is_show']);
                      //
                      //     var status;
                      //     setState(() {
                      //       status    =subCategory['pivot']['is_show']=='show'?'hidden':'show';
                      //     });
                      //     var url=Uri.parse('https://news.wasiljo.com/public/api/v1/manager/subcategories/show-hide/${subCategory['id']}/$status');
                      //     print(url);
                      //     SharedPreferences prefs =
                      //     await SharedPreferences.getInstance();
                      //     // Define the request headers
                      //     var bearerToken=prefs.getString('token');
                      //     var headers = {
                      //       'Authorization': 'Bearer $bearerToken'
                      //     };
                      //
                      //     var response =  await http.post( url,
                      //         headers: headers);
                      //
                      //
                      //     if (response.statusCode == 200) {
                      //       setState(() {
                      //         isShow=subCategory['pivot']['is_show'];
                      //       });
                      //       fetchSubCategories();
                      //       print( response.body);
                      //       Get.snackbar('done ', json.decode(response.body)['message'],
                      //           backgroundColor:primaryColor, snackPosition: SnackPosition.BOTTOM,
                      //           icon: const Icon(Icons.done_outline_rounded));
                      //       fetchWalletCategories();
                      //        fetchSubCategories();
                      //     }
                      //     else {
                      //       print(response.reasonPhrase);
                      //     }
                      //
                      //
                      //   },
                      //   child: Container(
                      //     padding: const EdgeInsets.all(5),
                      //
                      //
                      //     child:  Row(
                      //       children: [
                      //         Icon(subCategory['pivot']['is_show']=='hidden'?  Icons.visibility_off:Icons.visibility,color:subCategory['pivot']['is_show']=='show'?   Colors.green:Colors.grey,),
                      //         Text(subCategory['pivot']['is_show']=='hidden'?  'Hidden':'show')
                      //       ],
                      //     ),
                      //   ),
                      // ),

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
            itemCount:  subCategoryList.length,
            itemBuilder: (context, index) {
              final subCategory =  subCategoryList[index];
              var isShow=subCategory['pivot']['is_show'];
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
                    subCategory['title']['ar'],
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
                              Uri.parse('https://news.wasiljo.com/public/api/v1/manager/subcategories/remove/${subCategory['id']}?lang=ar'),
                              headers: headers);





                          if (response.statusCode == 200) {
                            print(await response.body);
                            fetchWalletCategories();
                            fetchSubCategories();
                            Get.snackbar(S.of(context).deleted, '',
                                backgroundColor:primaryColor, snackPosition: SnackPosition.BOTTOM,
                                icon: const Icon(Icons.done_outline_rounded));

                          }
                          else {

                            Get.snackbar(S.of(context).filed, '${json.decode(response.body)['error']}',
                                backgroundColor:Colors.red, snackPosition: SnackPosition.BOTTOM,
                                icon: const Icon(Icons.error));
                          }

                        },
                        child: Container(
                          padding: const EdgeInsets.all(5),


                          child:  Row(
                            children: [
                              Icon(Icons.delete,color: Colors.red,),
                              Text(S.of(context).delete)
                            ],
                          ),
                        ),
                      ),
                      const SizedBox(width: 10,),
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

                                         InkWell(
                                  onTap: () async {
                                    fetchSubCategories();
                                    print(subCategory['pivot']['is_show']);

                                    var status;
                                  setState(() {
                                    status    =subCategory['pivot']['is_show']=='show'?'hidden':'show';
                                  });
var url=Uri.parse('https://news.wasiljo.com/public/api/v1/manager/subcategories/show-hide/${subCategory['id']}/$status');
print(url);
                                    SharedPreferences prefs =
                                        await SharedPreferences.getInstance();
                                    // Define the request headers
                                    var bearerToken=prefs.getString('token');
                                    var headers = {
                                      'Authorization': 'Bearer $bearerToken'
                                    };

                                    var response =  await http.post( url,
                                    headers: headers);


                                    if (response.statusCode == 200) {
                                      setState(() {
                                        isShow=subCategory['pivot']['is_show'];
                                      });
                                      fetchSubCategories();
                                      print( response.body);
                                      Get.snackbar('done ', json.decode(response.body)['message'],
                                          backgroundColor:primaryColor, snackPosition: SnackPosition.BOTTOM,
                                          icon: const Icon(Icons.done_outline_rounded));
                                      fetchWalletCategories();
                                    //  fetchSubCategories();
                                    }
                                    else {
                                    print(response.reasonPhrase);
                                    }


                                  },
                                  child: Container(
                                    padding: const EdgeInsets.all(5),


                                    child:  Row(
                                      children: [
                                        Icon(subCategory['pivot']['is_show']=='hidden'?  Icons.visibility_off:Icons.visibility,color:subCategory['pivot']['is_show']=='show'?   Colors.green:Colors.grey,),
                                        Text(subCategory['pivot']['is_show']=='hidden'?  S.of(context).hidden:S.of(context).show)
                                      ],
                                    ),
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
        ));
      }
      Widget buildPendingItem(  subCategoryList,wallet) {
  final GlobalKey<RefreshIndicatorState> _refreshIndicatorKey =
  GlobalKey<RefreshIndicatorState>();
  return     RefreshIndicator(
            key: _refreshIndicatorKey,
            onRefresh: () async {
          await Future.delayed(Duration(seconds: 2));
           fetchSubCategories();
          fetchWalletCategories();
          print(subCategoriesPendung);
          return;
        },child:
        Column(
        children: [
//         ListView.builder(
//         shrinkWrap: true,
//         itemCount: subCategoriesActive.length,
//         itemBuilder: (context, index) {
//
//         return Padding(
//                       padding: const EdgeInsets.all(8.0),
//                       child: ListTile(trailing: IconButton(icon: Icon(Icons.edit),onPressed: () {
//
//                       },),
//                         leading: Image.network(
//                           'https://news.wasiljo.com/${subCategory['imageUrl']}',
//                           width: 50,
//                           height: 80,
//                           fit: BoxFit.cover,
//                         ),
//                         title: Text(
//                           subCategory['title']['en'].toString(),
//                           style: const TextStyle(fontWeight: FontWeight.bold),
//                         ),
//                         subtitle: Column(crossAxisAlignment:CrossAxisAlignment.start ,
//                           children: [
//                             const SizedBox(height: 10,),
//                             Text('Price: \$${subCategory.pivot!.price}'),
//                             const SizedBox(width: 10,),
//                             Row(
//                               children: [
//
// const SizedBox(height: 10,),
//                                 InkWell(
//                                   onTap: () async {
//                                     print('ll');
//                                     controllerItem.deleteItem(subCategory.id);
//                                  //   fetchSubCategories();
//                                   },
//                                   child: Container(
//                                     padding: const EdgeInsets.all(5),
//
//
//                                     child: const Row(
//                                       children: [
//                                         Icon(Icons.delete,color: Colors.red,),
//                                         Text('Delete')
//                                       ],
//                                     ),
//                                   ),
//                                 ),
//                                 const SizedBox(width: 10,),
//                                          InkWell(
//                                   onTap: () async {
//                                     print('https://news.wasiljo.com/public/api/v1/manager/subcategories/show-hide/');
//
//                                     SharedPreferences prefs =
//                                         await SharedPreferences.getInstance();
//                                     // Define the request headers
//                                     var bearerToken=prefs.getString('token');
//                                     var headers = {
//                                       'Authorization': 'Bearer $bearerToken'
//                                     };
//                                     var response =  await http.post( Uri.parse('https://news.wasiljo.com/public/api/v1/manager/subcategories/show-hide/${subCategory.id}/${subCategory.pivot!.isShow}}'),
//                                     headers: headers);
//
//
//                                     if (response.statusCode == 200) {
//                                       print(await response.body);
//                                       Get.snackbar('done hidden', '',
//                                           backgroundColor:primaryColor, snackPosition: SnackPosition.BOTTOM,
//                                           icon: const Icon(Icons.done_outline_rounded));
//                                       fetchWalletCategories();
//                                     //  fetchSubCategories();
//                                     }
//                                     else {
//                                     print(response.reasonPhrase);
//                                     }
//
//
//                                   },
//                                   child: Container(
//                                     padding: const EdgeInsets.all(5),
//
//
//                                     child:  Row(
//                                       children: [
//                                         // Icon({subCategory.pivot!.isShow}=='show'?  Icons.visibility_off:Icons.visibility,color:subCategory['pivot']['is_show']=='show'?   Colors.grey:Colors.green,),
//                                         // Text({subCategory.pivot!.isShow}=='show'?  'Hidden':'show')
//                                       ],
//                                     ),
//                                   ),
//                                 ),
//
//                               ],
//                             ),
//                           ],
//                         ),
//                         onTap: () {
//                           // Handle tap on subcategory (if needed)
//                         },
//                       ),
//                     )         ;          },
//         )
          ListView.builder(
            shrinkWrap: true,
            itemCount:  wallet.length,
            itemBuilder: (context, index) {
              final subCategory =  wallet[index];
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
                      // InkWell(
                      //   onTap: () async {
                      //     print('ll');
                      //     SharedPreferences prefs =
                      //     await SharedPreferences.getInstance();
                      //     // Define the request headers
                      //     var bearerToken=prefs.getString('token');
                      //     var headers = {
                      //       'Authorization': 'Bearer $bearerToken'
                      //     };
                      //     var response =await http.post(
                      //         Uri.parse('https://news.wasiljo.com/public/api/v1/manager/subcategories/remove/4'),
                      //         headers: headers);
                      //
                      //
                      //
                      //
                      //
                      //     if (response.statusCode == 200) {
                      //       print(await response.body);
                      //       fetchWalletCategories();
                      //       fetchSubCategories();
                      //       Get.snackbar('deleted', '',
                      //           backgroundColor:primaryColor, snackPosition: SnackPosition.BOTTOM,
                      //           icon: const Icon(Icons.done_outline_rounded));
                      //
                      //     }
                      //     else {
                      //       print(response.body);
                      //     }
                      //
                      //   },
                      //   child: Container(
                      //     padding: const EdgeInsets.all(5),
                      //
                      //
                      //     child: const Row(
                      //       children: [
                      //         Icon(Icons.delete,color: Colors.red,),
                      //         Text('Delete')
                      //       ],
                      //     ),
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
              );
            },
          ),
          ListView.builder(
            shrinkWrap: true,
            itemCount:  subCategoryList.length,
            itemBuilder: (context, index) {
              final subCategory =  subCategoryList[index];
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
                      // InkWell(
                      //   onTap: () async {
                      //     print('ll');
                      //     SharedPreferences prefs =
                      //     await SharedPreferences.getInstance();
                      //     // Define the request headers
                      //     var bearerToken=prefs.getString('token');
                      //     var headers = {
                      //       'Authorization': 'Bearer $bearerToken'
                      //     };
                      //     var response =await http.post(
                      //         Uri.parse('https://news.wasiljo.com/public/api/v1/manager/subcategories/remove/4'),
                      //         headers: headers);
                      //
                      //
                      //
                      //
                      //
                      //     if (response.statusCode == 200) {
                      //       print(await response.body);
                      //       fetchWalletCategories();
                      //       fetchSubCategories();
                      //       Get.snackbar('deleted', '',
                      //           backgroundColor:primaryColor, snackPosition: SnackPosition.BOTTOM,
                      //           icon: const Icon(Icons.done_outline_rounded));
                      //
                      //     }
                      //     else {
                      //       print(response.body);
                      //     }
                      //
                      //   },
                      //   child: Container(
                      //     padding: const EdgeInsets.all(5),
                      //
                      //
                      //     child: const Row(
                      //       children: [
                      //         Icon(Icons.delete,color: Colors.red,),
                      //         Text('Delete')
                      //       ],
                      //     ),
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
              );
            },
          ),
        ],
        ));
      }



      // Widget buildPendingItem(SubCategoriesPending subCategory){
      //   return   Padding(
      //     padding: const EdgeInsets.all(8.0),
      //     child: Column(
      //       children: [
      //         ListTile(
      //           leading: Image.network(
      //             'https://news.wasiljo.com/${subCategory.imageUrl}',
      //             width: 50,
      //             height: 80,
      //             fit: BoxFit.cover,
      //           ),
      //           title: Text(
      //             subCategory.title!.en.toString(),
      //             style: const TextStyle(fontWeight: FontWeight.bold),
      //           ),
      //           subtitle: Row(
      //             children: [
      //               Text('Price: \$${subCategory.price}'),
      //               const SizedBox(width: 10,),
      //               // Container(
      //               //   padding: const EdgeInsets.all(5),
      //               //
      //               //
      //               //   child: const Row(
      //               //     children: [
      //               //       Icon(Icons.delete,color: Colors.red,),
      //               //       Text('Delete')
      //               //     ],
      //               //   ),
      //               // ),
      //               // const SizedBox(width: 10,),
      //               // Container(
      //               //   padding: const EdgeInsets.all(5),
      //               //
      //               //
      //               //   child: const Row(
      //               //     children: [
      //               //       Icon(Icons.visibility_off,color: Colors.grey,),
      //               //       Text('Hidden')
      //               //     ],
      //               //   ),
      //               // ),
      //
      //             ],
      //           ),
      //           onTap: () {
      //             // Handle tap on subcategory (if needed)
      //           },
      //         ),
      //         Divider(color: borderColor,thickness: 2,)
      //       ],
      //     ),
      //   );
      // }
}
