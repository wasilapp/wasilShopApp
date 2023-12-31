import 'package:flutter/material.dart';
import 'package:mangerapp/utils/ui/user_text.dart';

import '../colors.dart';


class CommonViews {
  static final CommonViews _shared = CommonViews._private();

  factory CommonViews() => _shared;

  CommonViews._private();

  // singleton Ready

  AppBar getAppBar({
    String? title,
    Color? color,

    IconData?icon
    ,Widget ? action
  }) {
    return
      AppBar(iconTheme: IconThemeData(color: Colors.black),
      actions: [


        //
        Padding(padding: const EdgeInsets.only(right: 20),
            child: action )
      ],
        backgroundColor: color ?? Colors.white,
        elevation: 0,
        // shape: const RoundedRectangleBorder(
        //     borderRadius: BorderRadius.vertical(bottom: Radius.circular(25))),
        title: UserText(title: title??'',fontSize: 15, ),
        centerTitle: true);
  }

  Widget createButton(
      {required String title, required VoidCallback onPressed}) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20.0),
      child: ElevatedButton(

          onPressed: onPressed,
          style: ElevatedButton.styleFrom(backgroundColor: primaryColor,
         minimumSize: const Size(150, 55),

            shape: const RoundedRectangleBorder(borderRadius: BorderRadius.all(Radius.circular(10)))),

          child: UserText(
            title: title,
            textColor: Colors.white,

                fontSize: 18,
                fontWeight: FontWeight.w600,

          )),
    );
  }
}