import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';

import 'package:mangerapp/views/add_wallet/add_walet_view.dart';
import 'package:mangerapp/views/additem.dart';
import 'package:sizer/sizer.dart';

import '../config/custom_package.dart';
import 'items/add_itemadmin.dart';

class AddSubCategory extends StatelessWidget {
  const AddSubCategory({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(child: Scaffold(backgroundColor: primaryColor,            appBar: AppBar(
        iconTheme: IconThemeData(color: secondaryColor),
    backgroundColor: primaryColor,),
      body: Center(
        child: Column(crossAxisAlignment: CrossAxisAlignment.center,

        children: [
          SizedBox(height: 50,),
            SvgPicture.asset(
            'assets/images/Logo.svg',
            colorFilter: ColorFilter.mode(Colors.white, BlendMode.srcIn),
            semanticsLabel: 'A red up arrow'
        ),
          SizedBox(height: 3.h,),
          InkWell(
            onTap: () {
              Get.to(AddItem());
            },
            child: Container(
                width: 283,
                height: 70,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    color: Colors.white),
              child: Center(
                child: Text(
                    "Add Item",
                    style: TextStyle(color: primaryColor,
                      fontSize: 20,
                      fontWeight: FontWeight.w600,
                    )
                ),
              )
            ),
          ),
          SizedBox(height: 2.h,),
          InkWell(onTap: () {
Get.to(AddItemFromAdmin())         ; },
            child: Container(
                width: 283,
                height: 70,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    color: Colors.white),
                child: Center(
                  child: Text(
                      "Add Item from admain",
                      style: TextStyle(color: primaryColor,
                        fontSize: 20,
                        fontWeight: FontWeight.w600,
                      )
                  ),
                )
            ),
          ),
          SizedBox(height: 2.h,),

          InkWell(onTap: () {
Get.to(AddNewWallet())         ; },
            child: Container(
                width: 283,
                height: 70,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    color: Colors.white),
                child: Center(
                  child: Text(
                      "Add Coupon Book",
                      style: TextStyle(color:primaryColor,
                        fontSize: 20,
                        fontWeight: FontWeight.w600,
                      )
                  ),
                )
            ),
          ),


        ],
    ),
      ),));
  }
}
