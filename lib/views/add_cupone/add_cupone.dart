import 'package:flutter/material.dart';

import '../../services/app_localization.dart';
import '../../utils/colors.dart';
import '../../utils/fonts.dart';
import '../../utils/helper/navigator.dart';
import '../../utils/helper/size.dart';
import '../../utils/ui/common_views.dart';
import '../../widget/text_feild.dart';
import '../additem.dart';

class AddCupone extends StatefulWidget {
  const AddCupone({super.key});

  @override
  State<AddCupone> createState() => _AddCuponeState();
}

class _AddCuponeState extends State<AddCupone> {
  TextEditingController?  nameItem = TextEditingController();
  TextEditingController?  priceItem = TextEditingController();
  TextEditingController?  desItem = TextEditingController();
  TextEditingController?  imageItem = TextEditingController();
  bool isSwitched = false;
  var textValue = 'Switch is OFF';

  void toggleSwitch(bool value) {

    if(isSwitched == false)
    {
      setState(() {
        isSwitched = true;
        textValue = 'Switch Button is ON';
      });
    }
    else
    {
      setState(() {
        isSwitched = false;
        textValue = 'Switch Button is OFF';
      });
    }
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: ListView(
        children: [
          const SizedBox(height: 0,),
          Row(
            children: [
              Padding(
                padding: const EdgeInsets.only(left: 20.0),
                child: Text(Translator.translate("Create Coupon"),style: boldPrimary,),
              ),
            ],
          ),
          InkWell(
            onTap: () {
              MangerNavigator.of(context).push(const AddItem());
            },
            child: Container(
              margin: Spacing.fromLTRB(16, 8, 16, 8),
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
                          Text("Through our application, you will add this Cupone and users will see this information about the copone",
                              style:TextStyle(
                                  fontWeight: FontWeight.w500,
                                  letterSpacing: 0.2)),

                        ],
                      ),
                    ),
                  )
                ],
              ),
            ),
          ),


          const SizedBox(height: 10,),
          CustomTextField(
            keyBoard: TextInputType.text,
            controller: nameItem! ,

            hintText: Translator.translate("Coupon Code"),
            prefixIconData:const Icon (Icons.numbers),
            onPrefixIconPress: () {
              setState(() {

              });
            },

          ),
          CustomTextField(
            keyBoard: TextInputType.text,
            controller: priceItem! ,

            hintText: Translator.translate("Description "),
            prefixIconData:const Icon(Icons.textsms_outlined,)


          ),
          CustomTextField(
            keyBoard: TextInputType.text,
            controller: desItem! ,

            hintText: Translator.translate("Offer (in %) "),
            prefixIconData:const Icon(Icons.local_offer),
            onPrefixIconPress: () {
              setState(() {

              });
            },

          ),
          CustomTextField(
            keyBoard: TextInputType.text,
            controller: desItem! ,

            hintText: Translator.translate("Max Discount "),
            prefixIconData:const Icon(Icons.discount_outlined),
            onPrefixIconPress: () {
              setState(() {

              });
            },

          ),
          CustomTextField(
            keyBoard: TextInputType.text,
            controller: desItem! ,

            hintText: Translator.translate("Min Order "),
            prefixIconData: const Icon(Icons.onetwothree_outlined),
            onPrefixIconPress: () {
              setState(() {

              });
            },

          ),
          CustomTextField(
            keyBoard: TextInputType.text,
            controller: desItem! ,

            hintText: Translator.translate("Expired at "),
            prefixIconData: const Icon(Icons.hourglass_bottom_outlined),
            onPrefixIconPress: () {
              setState(() {

              });
            },

          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20.0),
            child: Column(
              children: [
                Row(
                  children: [
                    Transform.scale(
                        scale: 0.8,
                        child: Switch(
                          onChanged: toggleSwitch,
                          value: isSwitched,
                          activeColor: Colors.white10,
                          activeTrackColor: primaryColor,
                          inactiveThumbColor:primaryColor,
                          inactiveTrackColor: Colors.white,
                        )
                    ),
                    const Text('For only new user')
                  ],
                ),
                Row(
                  children: [
                    Transform.scale(
                        scale: 0.8,
                        child: Switch(
                          onChanged: toggleSwitch,
                          value: isSwitched,
                          activeColor: Colors.white10,
                          activeTrackColor: primaryColor,
                          inactiveThumbColor:primaryColor,
                          inactiveTrackColor: Colors.white,
                        )
                    ),
                    const Text('For only one time')
                  ],
                ),
              ],
            ),
          ),


          const SizedBox(height: 20,),
          CommonViews().createButton(title: 'Save', onPressed: () {

          },)
        ],
      ),
    );
  }
}
