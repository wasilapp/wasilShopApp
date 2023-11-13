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
import '../contact.dart';
import '../driver/driver.dart';
import '../order/scheduled_order.dart';
import '../order/urgent_order.dart';
import '../profile.dart';
import '../transaction.dart';
import '../transaction/all_transaction.dart';
import 'order_controller.dart';


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




  @override
  void initState() {
    controller = TabController(length: 3, vsync: this);
    controllerOrder.getProducts();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(

      length: 2,
      child: SafeArea(
        child: Scaffold(
          appBar: AppBar(iconTheme:IconThemeData(color: secondaryColor) ,
backgroundColor:backgroundColor,
          bottom:  TabBar(
            onTap: ( index) {
              print(index);
              if(index==0){
                controllerOrder.type.value='scheduled';
                print( controllerOrder.type.value);
              }   if(index==1){
                controllerOrder.type.value='urgent';
                print( controllerOrder.type.value);
              }
            },
            labelColor: primaryColor,
            indicatorColor:primaryColor,
            dividerColor: primaryColor,
          tabs:  [
          Tab(child: Row(children: [
     const Icon(Icons.store,),
            Text(S.of(context).scheduledOrder)
          ],)),
            Tab(child: Row(children: [
              const Icon(Icons.local_shipping_outlined,),
              Text(S.of(context).nearestOrder)
            ],)),

    ],
    ),),
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
                                  SizedBox(width: 2.w,),
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
                                  SizedBox(width: 2.w,),
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
                                  SizedBox(width: 2.w,),
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
                                  SizedBox(width: 2.w,),
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
                                   SizedBox(width: 2.w,),
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
                                   SizedBox(width: 2.w,),
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
                                  SizedBox(width: 2.w,),
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


                          ],
                        ),
                      ),
                    ),
                    //  account==null ? Container():


                    // account==null ? Container():  Divider(height: 23,thickness: 1.2,),
                    // account==null ? Container():

                  ],
                )),

    body: const TabBarView(
      children: [
          ScheduledOrder(),
        UrgentOrder(),

      ],

    )),
      ));
  }


}
