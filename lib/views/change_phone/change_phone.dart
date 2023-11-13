// import 'package:flutter/material.dart';
//
// import '../../services/app_localization.dart';
// import '../../utils/colors.dart';
// import '../../utils/fonts.dart';
// import '../../utils/helper/size.dart';
// import '../../utils/ui/common_views.dart';
// import '../../widget/text_feild.dart';
//
// class ChangePhone extends StatefulWidget {
//   const ChangePhone({super.key});
//
//   @override
//   State<ChangePhone> createState() => _ChangePhoneState();
// }
//
// class _ChangePhoneState extends State<ChangePhone> {
//   TextEditingController? _numberController=TextEditingController();
//   @override
//   Widget build(BuildContext context) {
//     return SafeArea(child: Scaffold(
//       appBar: AppBar(),
//         body: ListView(
//         padding: Spacing.top(100),
//     children: <Widget>[
//     Center(
//     child: Image.asset(
//     'assets/images/logo.png',
//     width: 120.0,
//     height: 120.0,
//     ),
//     ),
//     Row(
//     children: [
//     Padding(
//     padding: const EdgeInsets.only(left: 20.0),
//     child: Text(Translator.translate("Change Mobile "),style: boldPrimary,),
//     ),
//     ],
//     ),
//
//     SizedBox(height: 20,),
//     CustomTextField(
//     keyBoard: TextInputType.text,
//     controller: _numberController! ,
//
//     hintText: Translator.translate("New mobile number"),
//
//     onPrefixIconPress: () {
//     setState(() {
//
//     });
//     },
//
//     ),
//
//     SizedBox(height: 30,),
//     CommonViews().createButton(title: 'Change mobile number', onPressed: () {
//
//     },)
//     ],
//     )));
//   }
// }
