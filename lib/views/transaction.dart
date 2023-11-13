// import 'package:flutter/material.dart';
// import 'package:mangerapp/utils/colors.dart';
// import 'package:omni_datetime_picker/omni_datetime_picker.dart';
//
// import '../../services/app_localization.dart';
// import '../../utils/helper/size.dart';
// import 'package:intl/intl.dart';
// class TransactionScreen extends StatefulWidget {
//   const TransactionScreen({super.key});
//
//   @override
//   State<TransactionScreen> createState() => _TransactionScreenState();
// }
//
// class _TransactionScreenState extends State<TransactionScreen>with TickerProviderStateMixin {
//   String dateString="";
//   String  timeString = "";
//   TextEditingController? datePicker;
//   TabController? controller;
//   @override
//   void initState() {
//     datePicker = TextEditingController();
//     controller = TabController(length: 2, vsync: this);
//     super.initState();
//   }
//   @override
//   void dispose() {
//     // Dispose TabController when not needed to prevent memory leaks
//     controller!.dispose();
//     super.dispose();
//   }
//   @override
//   Widget build(BuildContext context) {
//     return DefaultTabController(
//
//       length: 2,
//       child: Scaffold(
//         appBar: AppBar(
//         ),
//         body:
//
//         Column(
//           children: [
//             const SizedBox(height: 30,),
//
//             TabBar(
//               controller: controller,
//               tabs: const [
//
//                 Tab(text: 'Admin'),
//                 Tab(text: 'Driver'),
//               ],
//             ),
//             Expanded(
//               child: TabBarView(
//                 controller: controller,
//                 children: [
//                   ClipRRect(
//                     borderRadius: BorderRadius.all(Radius.circular(MySize.size8!)),
//                     child: Container(
//                       padding: Spacing.all(16),
//                       margin: Spacing.fromLTRB(16, 16, 16, 8),
//
//                       decoration: BoxDecoration(
//                         borderRadius: BorderRadius.all(Radius.circular(MySize.size8!)),
//                         color:const Color(0xffffffff),
//                         border: Border.all(color: const Color(0xffeef2fa), width: 1.5),
//                       ),
//                       child: Column(
//                         children: [
//                           Row(mainAxisAlignment: MainAxisAlignment.spaceEvenly,
//                             children: [
//                               const Text(' From'),
//                               InkWell(
//                                 onTap: () async{
//                                   print(dateString);
//                                   DateTime? pickedDate = await showOmniDateTimePicker(context: context);
//
//                                   dateString = DateFormat('dd-MM-yyyy').format(pickedDate!);
//                                   timeString = DateFormat('HH:mm').format(pickedDate);
//                                   datePicker?.text = "$dateString-$timeString";
//                                   setState(() {
//                                     dateString = DateFormat('dd-MM-yyyy').format(pickedDate);
//                                     timeString = DateFormat('HH:mm').format(pickedDate);
//                                   });
//
//                                 },
//                                 child:
//
//                                 Container(
//
//
//
//                                     padding: const EdgeInsets.all(10),
//                                     decoration: BoxDecoration(
//                                         border: Border.all(color: primaryColor),
//                                         borderRadius: BorderRadius.circular(10)
//                                     ),
//
//                                     child: Text(dateString.isEmpty?'From':dateString)
//                                   // TextField
//                                   //   (decoration: InputDecoration(
//                                   //   border: InputBorder.none
//                                   // ),
//                                   //   style: TextStyle(color: Colors.black),
//                                   //   controller: datePicker,readOnly: true,onTap: () async{
//                                   //   DateTime? pickedDate = await showOmniDateTimePicker(context: context);
//                                   //   dateString = DateFormat('dd-MM-yyyy').format(pickedDate!);
//                                   //   timeString = DateFormat('HH:mm').format(pickedDate);
//                                   //   datePicker?.text = dateString + "-" + timeString;
//                                   // },),
//                                 ),
//                               ),
//                               Container(   color: const Color(0xff48a080),width:2,height: 30),
//                               const Text(' To'),   InkWell(
//                                 onTap: () async{
//                                   print(dateString);
//                                   DateTime? pickedDate = await showOmniDateTimePicker(context: context);
//
//                                   dateString = DateFormat('dd-MM-yyyy').format(pickedDate!);
//                                   timeString = DateFormat('HH:mm').format(pickedDate);
//                                   datePicker?.text = "$dateString-$timeString";
//                                   setState(() {
//                                     dateString = DateFormat('dd-MM-yyyy').format(pickedDate);
//                                     timeString = DateFormat('HH:mm').format(pickedDate);
//                                   });
//
//                                 },
//                                 child:
//
//                                 Container(
//
//
//
//                                     padding: const EdgeInsets.all(10),
//                                     decoration: BoxDecoration(
//                                         border: Border.all(color: primaryColor),
//                                         borderRadius: BorderRadius.circular(10)
//                                     ),
//
//                                     child: Text(dateString.isEmpty?'To':dateString)
//                                   // TextField
//                                   //   (decoration: InputDecoration(
//                                   //   border: InputBorder.none
//                                   // ),
//                                   //   style: TextStyle(color: Colors.black),
//                                   //   controller: datePicker,readOnly: true,onTap: () async{
//                                   //   DateTime? pickedDate = await showOmniDateTimePicker(context: context);
//                                   //   dateString = DateFormat('dd-MM-yyyy').format(pickedDate!);
//                                   //   timeString = DateFormat('HH:mm').format(pickedDate);
//                                   //   datePicker?.text = dateString + "-" + timeString;
//                                   // },),
//                                 ),
//                               ),
//                             ],
//                           ),
//                           const SizedBox(height: 15,),
//                           Center(
//
//                             child: Row(mainAxisAlignment: MainAxisAlignment.center,
//                               children: [
//                                 Text(
//                                   Translator.translate("Number Orders") + " : " +      " " +
//                                       ''
//                                           '0.50' +
//                                       " " ,
//                                   style:TextStyle(
//                                     color: secondaryColor,
//                                     fontWeight: FontWeight.w800,
//                                     fontSize: MySize.size14,
//                                   ),
//                                 ),
//                                 const Text('See more',style: TextStyle(color: Colors.grey),)
//                               ],
//                             ),
//                           ),
//
//                           const SizedBox(height: 20,),
//                           Center(
//
//                             child: Row(
//                               mainAxisAlignment: MainAxisAlignment.center,
//                               children: [
//                                 Text(
//                                   Translator.translate("delivery_rev") + " : " +      " " +
//                                       'Jo'
//                                           '0.50' +
//                                       " " ,
//                                   style:TextStyle(
//                                     color: secondaryColor,
//                                     fontWeight: FontWeight.w800,
//                                     fontSize: MySize.size14,
//                                   ),
//                                 ),
//                                 const Text('See more',style: TextStyle(color: Colors.grey),)
//                               ],
//                             ),
//                           ),
//
//                           const SizedBox(height: 20,),
//
//
//                         ],
//                       ),
//                     ),
//                   ),
//                   ClipRRect(
//                     borderRadius: BorderRadius.all(Radius.circular(MySize.size8!)),
//                     child: Container(
//                       padding: Spacing.all(16),
//                       margin: Spacing.fromLTRB(16, 16, 16, 8),
//
//                       decoration: BoxDecoration(
//                         borderRadius: BorderRadius.all(Radius.circular(MySize.size8!)),
//                         color:const Color(0xffffffff),
//                         border: Border.all(color: const Color(0xffeef2fa), width: 1.5),
//                       ),
//                       child: Column(
//                         children: [
//                           Row(mainAxisAlignment: MainAxisAlignment.spaceEvenly,
//                             children: [
//                               const Text(' From'),
//                               InkWell(
//                                 onTap: () async{
//                                   print(dateString);
//                                   DateTime? pickedDate = await showOmniDateTimePicker(context: context);
//
//                                   dateString = DateFormat('dd-MM-yyyy').format(pickedDate!);
//                                   timeString = DateFormat('HH:mm').format(pickedDate);
//                                   datePicker?.text = "$dateString-$timeString";
//                                   setState(() {
//                                     dateString = DateFormat('dd-MM-yyyy').format(pickedDate);
//                                     timeString = DateFormat('HH:mm').format(pickedDate);
//                                   });
//
//                                 },
//                                 child:
//
//                                 Container(
//
//
//
//                                     padding: const EdgeInsets.all(10),
//                                     decoration: BoxDecoration(
//                                         border: Border.all(color: primaryColor),
//                                         borderRadius: BorderRadius.circular(10)
//                                     ),
//
//                                     child: Text(dateString.isEmpty?'From':dateString)
//                                   // TextField
//                                   //   (decoration: InputDecoration(
//                                   //   border: InputBorder.none
//                                   // ),
//                                   //   style: TextStyle(color: Colors.black),
//                                   //   controller: datePicker,readOnly: true,onTap: () async{
//                                   //   DateTime? pickedDate = await showOmniDateTimePicker(context: context);
//                                   //   dateString = DateFormat('dd-MM-yyyy').format(pickedDate!);
//                                   //   timeString = DateFormat('HH:mm').format(pickedDate);
//                                   //   datePicker?.text = dateString + "-" + timeString;
//                                   // },),
//                                 ),
//                               ),
//                               Container(   color: const Color(0xff48a080),width:2,height: 30),
//                               const Text(' To'),   InkWell(
//                                 onTap: () async{
//                                   print(dateString);
//                                   DateTime? pickedDate = await showOmniDateTimePicker(context: context);
//
//                                   dateString = DateFormat('dd-MM-yyyy').format(pickedDate!);
//                                   timeString = DateFormat('HH:mm').format(pickedDate);
//                                   datePicker?.text = "$dateString-$timeString";
//                                   setState(() {
//                                     dateString = DateFormat('dd-MM-yyyy').format(pickedDate);
//                                     timeString = DateFormat('HH:mm').format(pickedDate);
//                                   });
//
//                                 },
//                                 child:
//
//                                 Container(
//
//
//
//                                     padding: const EdgeInsets.all(10),
//                                     decoration: BoxDecoration(
//                                         border: Border.all(color: primaryColor),
//                                         borderRadius: BorderRadius.circular(10)
//                                     ),
//
//                                     child: Text(dateString.isEmpty?'To':dateString)
//                                   // TextField
//                                   //   (decoration: InputDecoration(
//                                   //   border: InputBorder.none
//                                   // ),
//                                   //   style: TextStyle(color: Colors.black),
//                                   //   controller: datePicker,readOnly: true,onTap: () async{
//                                   //   DateTime? pickedDate = await showOmniDateTimePicker(context: context);
//                                   //   dateString = DateFormat('dd-MM-yyyy').format(pickedDate!);
//                                   //   timeString = DateFormat('HH:mm').format(pickedDate);
//                                   //   datePicker?.text = dateString + "-" + timeString;
//                                   // },),
//                                 ),
//                               ),
//                             ],
//                           ),
//                           const SizedBox(height: 15,),
//                           Center(
//
//                             child: Row(mainAxisAlignment: MainAxisAlignment.center,
//                               children: [
//                                 Text(
//                                   Translator.translate("Number Orders") + " : " +      " " +
//                                       ''
//                                           '0.50' +
//                                       " " ,
//                                   style:TextStyle(
//                                     color: secondaryColor,
//                                     fontWeight: FontWeight.w800,
//                                     fontSize: MySize.size14,
//                                   ),
//                                 ),
//                                 const Text('See more',style: TextStyle(color: Colors.grey),)
//                               ],
//                             ),
//                           ),
//
//                           const SizedBox(height: 20,),
//                           Center(
//
//                             child: Row(
//                               mainAxisAlignment: MainAxisAlignment.center,
//                               children: [
//                                 Text(
//                                   Translator.translate("delivery_rev") + " : " +      " " +
//                                       'Jo'
//                                           '0.50' +
//                                       " " ,
//                                   style:TextStyle(
//                                     color: secondaryColor,
//                                     fontWeight: FontWeight.w800,
//                                     fontSize: MySize.size14,
//                                   ),
//                                 ),
//                                 const Text('See more',style: TextStyle(color: Colors.grey),)
//                               ],
//                             ),
//                           ),
//
//                           const SizedBox(height: 20,),
//
//
//                         ],
//                       ),
//                     ),
//                   ),
//                 ],
//               ),
//             ),
//
//           ],
//         ),
//       ),
//     );
//   }
// }
