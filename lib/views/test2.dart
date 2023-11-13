// import 'package:flutter/material.dart';
// import '../generated/l10n.dart';
// import '../l10n/app_language.dart';
//
// class AboutUsTab extends StatefulWidget {
//   const AboutUsTab({Key? key}) : super(key: key);
//
//   @override
//   State<AboutUsTab> createState() => _AboutUsTabState();
// }
//
// class _AboutUsTabState extends State<AboutUsTab> {
//   final bool _isChecked = false;
//   final bool _isChecked2 = false;
//   final int _selectedRadio = 1;
//
//   @override
//   Widget build(BuildContext context) {
//     // return CustomWidget(color: Colors.green,title: "About us");
//     return Scaffold(
//       body: Container(
//         width: MediaQuery.of(context).size.width,
//         height: MediaQuery.of(context).size.height,
//         color: Colors.green,
//         child: Center(
//             child: Column(
//               children: [
//
//
//
//             const SizedBox(height: 200,),
//                 ElevatedButton(
//                     onPressed: () {
//                       AppLanguage().changeLanguage('en');
//                     },
//                     child: Text(S.of(context).fff)),
//                 ElevatedButton(
//                     onPressed: () {
//                       AppLanguage().changeLanguage('ar');
//                     },
//                     child: Text(S.of(context).arabic)),
//
//               ],
//             )),
//       ),
//     );
//   }
// }