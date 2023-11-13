import 'package:flutter/material.dart';
import 'package:mangerapp/utils/colors.dart';
import 'package:mangerapp/utils/helper/navigator.dart';
import 'package:mangerapp/views/add_cupone/add_cupone.dart';

import '../../services/app_localization.dart';
import '../../utils/helper/size.dart';

class CupponScreen extends StatefulWidget {
  const CupponScreen({super.key});

  @override
  State<CupponScreen> createState() => _CupponScreenState();
}

class _CupponScreenState extends State<CupponScreen> with TickerProviderStateMixin {

   TabController? controller;
  @override
  void initState() {
    controller = TabController(length: 3, vsync: this);
    super.initState();
  }
   @override
   void dispose() {
     // Dispose TabController when not needed to prevent memory leaks
     controller!.dispose();
     super.dispose();
   }
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 3,
      child: Scaffold(
        appBar: AppBar(
        ),
        body:

        Column(
          children: [
            const SizedBox(height: 30,),
            InkWell(
              onTap: () {
                MangerNavigator.of(context).push(const AddCupone());
              },
              child: Container(
                margin: Spacing.fromLTRB(16, 0, 16, 8),
                padding: Spacing.all(16),
                decoration: BoxDecoration(
                    color:backgroundColor,
                    borderRadius: const BorderRadius.all(Radius.circular(8)),
                    border: Border.all(color: primaryColor,width: 1.5)),
                child: Row(
                  children: <Widget>[
                    Container(
                      width: 48,
                      height: 48,
                      decoration: const BoxDecoration(
                        image: DecorationImage(
                            image: AssetImage('assets/images/copon.png'),
                            fit: BoxFit.fill),
                      ),
                    ),
                    Expanded(
                      child: Container(
                        margin: Spacing.only(left: 16),
                        child: const Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text("Add New Cupone",
                                style:TextStyle(
                                    fontWeight: FontWeight.w500,
                                    letterSpacing: 0.2)),
                            Text('Click here',
                                style: TextStyle(color: Colors.grey,
                                    fontWeight: FontWeight.w500)),
                          ],
                        ),
                      ),
                    )
                  ],
                ),
              ),
            ),
            TabBar(
              controller: controller,
              tabs: const [
                Tab(text: 'Active'),
                Tab(text: 'Admin'),
                Tab(text: 'Expired'),
              ],
            ),
            Expanded(
              child: TabBarView(
                controller: controller,
                children: [
                  // Tab 1: Active Vouchers
                  Column(
                    children: [
                      const SizedBox(height: 50,),
                      Container(
                        margin: Spacing.only(top: 8, bottom: 8),
                        padding: Spacing.all(16),
decoration: BoxDecoration(  border: Border.all(color:  const Color(0xffeef2fa), width: 1.5),),


                        child: Row(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: <Widget>[
                            Expanded(
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: <Widget>[
                                  Text(
                                    Translator.translate("Copone Code") +
                                        " " +
                                        '1',
                                    style: const TextStyle(
                                        fontWeight: FontWeight.w700,
                                        letterSpacing: -0.2),
                                  ),
                                  Container(
                                    margin: Spacing.only(top: 4),
                                    child: Row(
                                      children: [
                                        const Text(
                                          '50% discount',
                                          style: TextStyle(
                                              fontWeight: FontWeight.w600,
                                              letterSpacing: 0),
                                        ),
                                        const SizedBox(width: 10,),
                                        Text(
                                          'Sep 19 2023 08:41 AM',
                                          style: TextStyle(
                                              fontWeight: FontWeight.w600,
                                              color: Colors.grey.shade400,
                                              letterSpacing: 0),
                                        ),
                                      ],
                                    ),
                                  ),
                                  const SizedBox(height: 15,),
                                  Container(
                                    alignment: Alignment.center,
                                    child: Row(
                                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                                      children: [
                                        InkWell(

                                          child:Container(
                                              width: 80,
                                              height: 30,
                                              decoration: BoxDecoration(borderRadius: BorderRadius.circular(10),color: Colors.grey.withOpacity(0.2)),
                                              child: Center(child: Text(Translator.translate("Accept"),style: const TextStyle(fontWeight: FontWeight.bold,color: Colors.green),))) ,
                                        ),
                                        InkWell(

                                          child:Text(Translator.translate("Decline"),style: const TextStyle(fontWeight: FontWeight.bold,color: Colors.red),) ,
                                        ),
                                        InkWell(

                                          child:Text(Translator.translate("view"),style: const TextStyle(fontWeight: FontWeight.bold,color: Colors.grey),) ,
                                        ),
                                      ],),
                                  )



                                ],
                              ),
                            ),
                            Container(
                              padding: Spacing.fromLTRB(12, 8, 12, 8),
                              decoration: const BoxDecoration(
                                borderRadius:
                                BorderRadius.all(Radius.circular(4)),
                                color:       Color(0xffeef2fa),),
                              child: const Text(
                                'Active',
                                style: TextStyle(
                                    fontSize: 11, fontWeight: FontWeight.w700, letterSpacing: 0.25),
                              ),
                            )
                          ],
                        ),
                      ),
                    ],
                  ),
                  // Tab 2: Used Vouchers
                  Container(
                    margin: Spacing.only(top: 8, bottom: 8),
                    padding: Spacing.all(16),
                    decoration: BoxDecoration(  border: Border.all(color:  const Color(0xffeef2fa), width: 1.5),),
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        Expanded(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: <Widget>[
                              Text(
                                Translator.translate("Cubone code") +
                                    " " +
                                    '1',
                                style: const TextStyle(
                                    fontWeight: FontWeight.w700,
                                    letterSpacing: -0.2),
                              ),
                              Container(
                                margin: Spacing.only(top: 4),
                                child: Row(
                                  children: [
                                    const Text(
                                      '50% discount',
                                      style: TextStyle(
                                          fontWeight: FontWeight.w600,
                                          letterSpacing: 0),
                                    ),
                                    const SizedBox(width: 10,),
                                    Text(
                                      'Sep 19 2023 08:41 AM',
                                      style: TextStyle(
                                          fontWeight: FontWeight.w600,
                                          color: Colors.grey.shade400,
                                          letterSpacing: 0),
                                    ),
                                  ],
                                ),
                              ),




                            ],
                          ),
                        ),
                        Container(
                          padding: Spacing.fromLTRB(12, 8, 12, 8),
                          decoration: const BoxDecoration(
                            borderRadius:
                            BorderRadius.all(Radius.circular(4)),
                            color:       Color(0xffeef2fa),),
                          child: const Text(
                            'Store',
                            style: TextStyle(
                                fontSize: 11, fontWeight: FontWeight.w700, letterSpacing: 0.25),
                          ),
                        )
                      ],
                    ),
                  ),
                  // Tab 3: Expired Vouchers
                  const Center(child: Text('Expired Vouchers')),
                ],
              ),
            ),

          ],
        ),
      ),
    );
  }
}
