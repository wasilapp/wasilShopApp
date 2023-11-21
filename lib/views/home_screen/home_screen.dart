import 'dart:convert';

import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mangerapp/utils/colors.dart';
import 'package:mangerapp/utils/helper/navigator.dart';
import 'package:mangerapp/views/add_wallet/add_walet_view.dart';
import 'package:mangerapp/views/cupone/cupone_screen.dart';
import 'package:share/share.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:sizer/sizer.dart';

import '../../generated/l10n.dart';
import '../../l10n/app_language.dart';
import '../../services/app_localization.dart';
import '../../utils/fonts.dart';
import '../../utils/navigator.dart';
import '../HomeScreen.dart';
import '../all_items/all_items.dart';
import '../auth/delete_dialog.dart';
import '../contact.dart';
import '../driver/driver.dart';
import '../order/scheduled_order.dart';
import '../order/urgent_order.dart';
import '../auth/profile.dart';
import '../transaction.dart';
import '../transaction/all_transaction.dart';
import 'order_controller.dart';
import 'package:http/http.dart'as http;

class homepage extends StatefulWidget {
  const homepage({Key? key}) : super(key: key);

  @override
  State<homepage> createState() => _homepageState();
}

class _homepageState extends State<homepage> with TickerProviderStateMixin {
  final CarouselController carouselController=CarouselController();
  OrderController controllerOrder = Get.put(OrderController());
  final GlobalKey<RefreshIndicatorState> _refreshIndicatorKey =
  GlobalKey<RefreshIndicatorState>();
late TabController controller;



  var onn;
  bool open=false;
  var image;
  updateStatus(status)async{
    print("""""$status""");
    SharedPreferences prefs= await SharedPreferences.getInstance();
    var bearerToken=   prefs.getString('token');
    var headers = {
      'Content-Type': 'application/json',
      'Authorization': 'Bearer $bearerToken'
    };
    var request = http.Request('POST', Uri.parse('https://admin.wasiljo.com/public/api/v1/manager/update_profile'));
    request.body = json.encode({
      // "manager": {
      //   "name": {
      //     "en": mangerNameEnglish!.text,
      //     "ar": mangerNameArabic!.text
      //   }
      // },
      "shop": {
        "open": status,
        // "distance":distance!.text
      }
    });
    request.headers.addAll(headers);

    http.StreamedResponse response = await request.send();

    if (response.statusCode == 200) {
      print(await response.stream.bytesToString());

    }
    else {
      print(response.reasonPhrase);
    }

  }
  @override
  void initState() {
    controller = TabController(length: 3, vsync: this);
    controllerOrder.getProducts();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return
      // DefaultTabController(
      //
      // length: 2,
    //  child:
    SafeArea(
        child: Scaffold(
          appBar: AppBar(iconTheme:IconThemeData(color: secondaryColor) ,
backgroundColor:backgroundColor,
          actions: [
            Container(margin: EdgeInsets.all(5),
              child: ElevatedButton(
                  style: ElevatedButton.styleFrom(backgroundColor: onn==1?primaryColor:Colors.red,
                  //    shape: const RoundedRectangleBorder(borderRadius: BorderRadius.all(Radius.circular(8)))
                  ),

                  onPressed: () {


                    setState(() {

                      open=!open;
                      open?onn=1:onn=0;
                      print(onn);
                      updateStatus(onn);

                    });
                  }, child: Text(onn==1?'OnnLine':'offline',style: const TextStyle(color: backgroundColor,fontWeight: FontWeight.bold),)),
            )
          ],
          // bottom:  TabBar(
          //   onTap: ( index) {
          //     print(index);
          //     if(index==0){
          //       controllerOrder.type.value='scheduled';
          //       print( controllerOrder.type.value);
          //     }   if(index==1){
          //       controllerOrder.type.value='urgent';
          //       print( controllerOrder.type.value);
          //     }
          //   },
          //   labelColor: primaryColor,
          //   indicatorColor:primaryColor,
          //   dividerColor: primaryColor,
    //       tabs:  [
    //       Tab(child: Row(children: [
    //  const Icon(Icons.store,),
    //         Text(S.of(context).scheduledOrder)
    //       ],)),
    //         Tab(child: Row(children: [
    //           const Icon(Icons.local_shipping_outlined,),
    //           Text(S.of(context).nearestOrder)
    //         ],)),
    //
    // ],
   // ),
        ),
            drawer: Drawer(
                width: 60.w,
                backgroundColor:primaryColor,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Expanded(
                      child: Padding(
                        padding: const EdgeInsets.all(20.0),
                        child: ListView(
                          padding: EdgeInsets.zero,
                          children: [

                            ListTile(
                              title: Row(
                                children: [
                                  const Icon(Icons.home_filled,color:backgroundColor,),

                                  Text(Translator.translate(S.of(context).orders),style: whitebasic,),
                                ],
                              ),
                              onTap: () {
                                pushScreen(context,const homepage ());

                              },
                            ),
                            SizedBox(height: 1.h,),
                            const Divider(),
                            ListTile(
                              title: Row(
                                children: [
                                  const Icon(Icons.person,color:backgroundColor,),
                        
                                  Text(Translator.translate(S.of(context).profile),style: whitebasic,),
                                ],
                              ),
                              onTap: () {
                                AppLanguage().changeLanguage('en');
                                Get.to(Profile());

                              },
                            ),

                            SizedBox(height: 1.h,),
                            const Divider(),
                            ListTile(
                              title: Row(
                                children: [
                                  const Icon(Icons.drive_eta_rounded,color:backgroundColor,),
                                  
                                  Text(Translator.translate(S.of(context).driver),style: whitebasic,),
                                ],
                              ),
                              onTap: () {
                                pushScreen(context, const Driver());

                              },
                            ),
                            SizedBox(height: 1.h,),
                            const Divider(),

                            ListTile(

                              title: Row(
                                children: [

                                  const Icon(Icons.shopping_bag_outlined,color: backgroundColor,),
                                  
                                  Text(Translator.translate(S.of(context).items),style: whitebasic,),
                                ],
                              ),
                              onTap: () {
                                Navigator.push(context, MaterialPageRoute(builder: (context) => const AllItems(),));
                              },
                            ),

                            const Divider(),
                            ListTile(
onTap: () {

  MangerNavigator.of(context).push( Transaction());
},
                              title: Row(
                                children: [
                                  const Icon(Icons.monetization_on_outlined,color: backgroundColor,),
                                   
                                  Text(Translator.translate(S.of(context).transaction),style: whitebasic,),
                                ],
                              ),

                            ),
                                SizedBox(height: 1.h,),
                            const Divider(),
                            ListTile(
onTap: () {
  MangerNavigator.of(context).push( Transaction());
},
                              title: Row(
                                children: [
                                  const Icon(Icons.currency_bitcoin,color: backgroundColor,),
                                   
                                  Text(Translator.translate(S.of(context).coupon),style: whitebasic,),
                                ],
                              ),

                            ),
                            const Divider(),

                            ListTile(
                              title: Row(
                                children: [
                                  const Icon(Icons.call,color: backgroundColor,),
                                   SizedBox(width: 1.w,),
                                  Text(Translator.translate(S.of(context).contactus),style: whitebasic,),
                                ],
                              ),
                              onTap: () {
                                pushScreen(context,  Contact());
                              },
                            ),
                                SizedBox(height: 1.h,),
                            const Divider(),
                            ListTile(
                              title: Row(
                                children: [
                                  const Icon(Icons.share,color: backgroundColor,),
                                  
                                  Text(Translator.translate(S.of(context).share),style: whitebasic,),
                                ],
                              ),
                              onTap: () async {
    SharedPreferences prfs= await SharedPreferences.getInstance();
    print('ll');    var ref=prfs.getString('referrer');  print(ref);

    Share.share(ref!);
    //Navigator.pop(context);
    },
    ),
                                //Navigator.pop(context);
                            ListTile(
                              title: Row(
                                children: [
                                  const Icon(Icons.delete,color: Colors.red,),
                                  const SizedBox(width: 10,),
                                  Text(Translator.translate(S.of(context).deleteaccount),style: whitebasic,),
                                ],
                              ),
                              onTap: () async {

                                showDialog(
                                    context: context,
                                    builder: (BuildContext context) {
                                      return    const DeleteUserDialog();
                                    });


                              },
                            ),

                          ],
                        ),
                      ),
                    ),
                    //  account==null ? Container():


                    // account==null ? Container():  Divider(height: 23,thickness: 1.2,),
                    // account==null ? Container():

                  ],
                )),

    body:
    // const TabBarView(
    //   children: [
          ScheduledOrder(),
        // UrgentOrder(),

      // ],

   // )
      ),
      );
  }


}
