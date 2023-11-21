// import 'package:country_picker/country_picker.dart';
// import 'package:flutter/cupertino.dart';
// import 'package:flutter/material.dart';
// import 'package:mangerapp/utils/ui/common_views.dart';
// import 'package:http/http.dart'as http;
// import 'package:shared_preferences/shared_preferences.dart';
// import '../../services/app_localization.dart';
// import '../../utils/colors.dart';
// import '../../utils/fonts.dart';
// import '../../utils/helper/size.dart';
// import '../../widget/text_feild.dart';
//
// class ChangePassword extends StatefulWidget {
//   const ChangePassword({super.key});
//
//   @override
//   State<ChangePassword> createState() => _ChangePasswordState();
// }
//
// class _ChangePasswordState extends State<ChangePassword> {
//   String contrycode ="962";
//   TextEditingController? _numberController=TextEditingController();
//   @override
//   Widget build(BuildContext context) {
//     return SafeArea(child: Scaffold(
//       appBar: AppBar(),
//       body: ListView(
//         padding: Spacing.top(100),
//         children: <Widget>[
//           Center(
//             child: Image.asset(
//               'assets/images/logo.png',
//               width: 120.0,
//               height: 120.0,
//             ),
//           ),
//           Row(
//             children: [
//               Padding(
//                 padding: const EdgeInsets.only(left: 20.0),
//                 child: Text(Translator.translate("Change Password"),style: boldPrimary,),
//               ),
//             ],
//           ),
//
//           SizedBox(height: 20,),
//           Row(
//             children: [
//               Padding(
//                 padding: const EdgeInsets.only(left: 10.0,top: 10),
//                 child: ElevatedButton(
//                   style: ElevatedButton.styleFrom(backgroundColor: primaryColor,textStyle: TextStyle(color: Colors.white),
//                   ),
//                   onPressed: () {
//                     showCountryPicker(
//                       context: context,
//                       //Optional.  Can be used to exclude(remove) one ore more country from the countries list (optional).
//                       exclude: <String>['KN', 'MF'],
//                       favorite: <String>['SE'],
//                       //Optional. Shows phone code before the country name.
//                       showPhoneCode: true,
//                       onSelect: (Country country) {
//                         setState(() {
//                           contrycode = country.phoneCode;
//                         });
//                         print(
//                             'Select country: ${country.displayName}');
//                       },
//                       // Optional. Sets the theme for the country list picker.
//                       countryListTheme: CountryListThemeData(
//                         // Optional. Sets the border radius for the bottomsheet.
//                         borderRadius: BorderRadius.only(
//                           topLeft: Radius.circular(40.0),
//                           topRight: Radius.circular(40.0),
//                         ),
//                         // Optional. Styles the search field.
//                         inputDecoration: InputDecoration(
//                           labelText: 'Search',
//                           hintText: 'Start typing to search',
//                           prefixIcon:
//                           const Icon(Icons.search),
//                           border: OutlineInputBorder(
//                             borderSide: BorderSide(
//                               color: const Color(0xFF8C98A8)
//                                   .withOpacity(0.2),
//                             ),
//                           ),
//                         ),
//                         // Optional. Styles the text in the search field
//                         searchTextStyle: TextStyle(
//                           color: Colors.green,
//                           fontSize: 18,
//                         ),
//                       ),
//                     );
//                   },
//                   child:  Text(contrycode,style: TextStyle(color: Colors.white)),
//                 ),
//               ),
//               Spacing.width(8),
//               Expanded(
//                   child:
//                   CustomTextField(hintText: 'mobile Number',controller:_numberController! , keyBoard: TextInputType.number,)
//               ),
//
//             ],
//           ),
//
//           SizedBox(height: 30,),
//           CommonViews().createButton(title: 'Change Password', onPressed: () async{
//             SharedPreferences prefs= await SharedPreferences.getInstance();
//             var bearerToken=   prefs.getString('token');
//             print(bearerToken);
//             print(contrycode.toString() + _numberController!.text);
//             try {
//               var respone = await http.post(Uri.parse(
//                   'https://admin.wasiljo.com/public/api/v1/manager/otp_mobile'),
//                   body: {
//                     'mobile': contrycode.toString() + _numberController!.text
//                   },
//                   headers: {
//                     'Authorization': 'Bearer $bearerToken'
//                   });
//               if(respone.statusCode==200){
//                 print("200");
//               }
//             }
//             catch(e){
// print('kkkkkkkkkk');
//             }
//           },)
//         ],
//       )
//
//       ,
//     ));
//   }
// }
