// import 'package:flutter/material.dart';
// import 'package:mangerapp/utils/colors.dart';
// import 'package:mangerapp/utils/ui/common_views.dart';
//
// import '../services/app_localization.dart';
// import '../utils/fonts.dart';
// import '../widget/text_feild.dart';
//
// class Contact extends StatefulWidget {
//   const Contact({super.key});
//
//   @override
//   State<Contact> createState() => _ContactState();
// }
//
// class _ContactState extends State<Contact> {
//
//
//
//
//   @override
//   Widget build(BuildContext context) {
//     TextEditingController?  nameTFController = TextEditingController();
//     TextEditingController? emailTFController = TextEditingController();
//     TextEditingController?  messageTFController = TextEditingController();
//     return
//        SafeArea(child:
//     Scaffold(
//       appBar: CommonViews().getAppBar(),
// body:Column(
//
//   crossAxisAlignment: CrossAxisAlignment.center,
//   children: [
//     const SizedBox(height: 30,),
//     Row(
//       children: [
//         Padding(
//           padding: const EdgeInsets.only(left: 20.0),
//           child: Text(Translator.translate("Contact Us"),style: boldPrimary,),
//         ),
//       ],
//     ),
//     const SizedBox(height: 30,),
// const Text("Have Any quastion?we love to hear from you "),
//     CustomTextField(
//       keyBoard: TextInputType.text,
//       controller: nameTFController,
//
//       hintText: Translator.translate("Name"),
//
//       onPrefixIconPress: () {
//         setState(() {
//
//         });
//       }, prefixIconData: null,
//
//     ),
//     CustomTextField(
//       keyBoard: TextInputType.emailAddress,
//       controller: emailTFController,
//
//       hintText: Translator.translate("Email"),
//
//       onPrefixIconPress: () {
//         setState(() {
//
//         });
//       }, prefixIconData: null,
//
//     ),
//     CustomTextField(
//       keyBoard: TextInputType.text,
//       controller: nameTFController,
//
//       hintText: Translator.translate("Message"),
//
//       onPrefixIconPress: () {
//         setState(() {
//
//         });
//       }, prefixIconData: null,
//
//     ),
//     Padding(
//       padding: const EdgeInsets.symmetric(horizontal: 10.0,vertical: 20),
//       child: ElevatedButton(
//         style: ElevatedButton.styleFrom(
//             backgroundColor: primaryColor,
//             minimumSize: const Size(300, 50),
//
//             shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(5)),
//             textStyle: const TextStyle(fontSize: 20,fontWeight: FontWeight.bold)
//         ),
//         onPressed: () {
//
//
//
//
//         }, child: Text(
//         style: const TextStyle(color: Colors.white),
//         Translator.translate("Sign in"),
//
//       ),),
//     ),
//     Row(mainAxisAlignment: MainAxisAlignment.spaceEvenly,
//       children: [
//         Container(
//             width: 60,
//             height: 40,
//             decoration: BoxDecoration(
//                 border: Border.all(color: primaryColor),
//                 borderRadius: BorderRadius.circular(5)
//             ),
//
//
//             child: const Icon(Icons.phone,color: primaryColor,)),
//         Container(
//           width: 60,
//           height: 40,
//           decoration: BoxDecoration(
//               border: Border.all(color: primaryColor),
//
//               borderRadius: BorderRadius.circular(5)
//           ),
//
//
//           child:  const Icon(Icons.location_pin,color: primaryColor),),
//         Container(
//           width: 60,
//           height: 40,
//           decoration: BoxDecoration(
//               border: Border.all(color: primaryColor),
//
//               borderRadius: BorderRadius.circular(5)
//           ),
//
//
//           child:   const Icon(Icons.email,color: primaryColor),),
//
//
//       ],
//     ),
//   ],
//
// ) ,
//
//
//     ));
//
// }}

import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

import '../../utils/helper/navigator.dart';
import '../services/app_localization.dart';
import '../utils/colors.dart';


class Contact extends StatefulWidget {
  @override
  State<Contact> createState() => _ContactState();
}

class _ContactState extends State<Contact> {
  String? name='';
  String? email='';
  String? avatar='';

  callNumber(phone) async {
    try {
      Uri email = Uri(
        scheme: 'tel',
        path: phone,
      );

      await launchUrl(email);
    } catch (e) {
      debugPrint(e.toString());
    }
  }


  openUrl(cVUrl) async {
    final url = Uri.parse(cVUrl);
    if (!await launchUrl(url, mode: LaunchMode.externalApplication)) {
      // <--
      throw Exception('Could not launch $url');
    }
  }

  @override
  void initState() {

    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
          backgroundColor: Colors.white,


          appBar: AppBar(            iconTheme: IconThemeData(color: Colors.black),elevation: 0,
            // title: Text('checkOut'.tr,style: TextStyle(color:Color(0xff373636),fontSize: 18,
            // fontWeight: FontWeight.w400,)),
            backgroundColor: backgroundColor,),
          body: Stack(
            children: [
              Padding(
                  padding: const EdgeInsets.all(20),
                  child: Column(
                      children: [
                        Column(
                          children: [
                            InkWell(
                              onTap: () {
                                callNumber("+962779233733");
                              },
                              child: Row(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Icon(  Icons.call ,color: primaryColor,size:35,),
                                  const SizedBox(width: 10),
                                  Column(
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    children: [
                                      Text(
                                        Translator.translate("mobile_number"),
                                        textAlign: TextAlign.center,
                                        style: TextStyle(
                                            fontSize: 16,
                                            fontWeight: FontWeight.bold,
                                            color: Colors.black),
                                      ),
                                      const SizedBox(height: 10),
                                      Text(
                                        "+962779233733",
                                        textAlign: TextAlign.center,
                                        style: TextStyle(
                                            fontSize: 13,

                                            color: Colors.black),
                                      ),

                                    ],
                                  ),
                                ],),
                            ),
                            Divider(),
                            InkWell(
                              onTap: ()
                              // Function to launch an email
                              async {
                                _launchEmail('mailto:sally42@gmail.com');
                                print('Error launching email');



                              },
                              child: Row(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Icon(  Icons.email ,color: Colors.greenAccent,size:35,),
                                  const SizedBox(width: 10),
                                  Column(
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    children: [
                                      Text(
                                        Translator.translate("email"),
                                        textAlign: TextAlign.center,
                                        style: TextStyle(
                                            fontSize: 16,
                                            fontWeight: FontWeight.bold,
                                            color: Colors.black),
                                      ),
                                      const SizedBox(height: 10),
                                      Text(
                                        "Info@wasiljo.com",
                                        textAlign: TextAlign.center,
                                        style: TextStyle(
                                            fontSize: 13,

                                            color: Colors.black),
                                      ),

                                    ],
                                  ),
                                ],),
                            ),
                          ],
                        ),
                      ]
                  )
              ),
              Positioned(
                  bottom: 0,
                  child: Container(width: MediaQuery.of(context).size.width,height:MediaQuery.of(context).size.height*0.08 ,color: Color(0xff15cb95),))
            ],
          )
      ),
    );
  }
  Future<void> _launchEmail(String email) async {
    if (await canLaunch(email)) {
      await launch(email);
    } else {
      // Handle error
      print('Error launching email');
    }
  }
}
