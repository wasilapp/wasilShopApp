// import 'package:flutter/material.dart';
//
// import 'package:mangerapp/views/home_screen/home_screen.dart';
// import 'package:mangerapp/views/profile.dart';
//
// import 'package:shared_preferences/shared_preferences.dart';
//
// import '../generated/l10n.dart';
// import '../l10n/app_language.dart';
// import '../services/app_localization.dart';
// import '../utils/colors.dart';
// import '../utils/fonts.dart';
// import '../utils/navigator.dart';
// import 'contact.dart';
// import 'driver/driver.dart';
//
//
// class HomePage extends StatefulWidget {
//   const HomePage({super.key});
//
//   @override
//   _HomePageState createState() => _HomePageState();
// }
//
// class _HomePageState extends State<HomePage> {
//   var currentPage = DrawerSections.dashboard;
//
//   String language = '';
//
//   saveSignIn(bool signIn) async {
//     var prefs = await SharedPreferences.getInstance();
//     prefs.setBool('signIn', signIn);
//   }
//
//   saveSearch(bool search) async {
//     var prefs = await SharedPreferences.getInstance();
//     prefs.setBool('search', search);
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     StatefulWidget container;
//     if (currentPage == DrawerSections.dashboard) {
//       container = const homepage();
//     } else if (currentPage == DrawerSections.contacts) {
//       container =  const Profile();
//       // container = const SignupScreen();    } else if (currentPage == DrawerSections.events) {
//       container = const Driver();
//     } else if (currentPage == DrawerSections.rate) {
//
//     }
//     return SafeArea(
//       child: Scaffold(
//
//     body: container,
//     drawer: Drawer(
//     width: 250,
//     backgroundColor:primaryColor,
//     child: Column(
//     mainAxisAlignment: MainAxisAlignment.spaceBetween,
//     children: [
//     Expanded(
//     child: Padding(
//     padding: const EdgeInsets.all(20.0),
//     child: ListView(
//     padding: EdgeInsets.zero,
//     children: [
//
//     ListTile(
//     title: Row(
//     children: [
//     const Icon(Icons.home_filled,color:backgroundColor,),
//     const SizedBox(width: 10,),
//     Text(Translator.translate("orders"),style: whitebasic,),
//     ],
//     ),
//     onTap: () {
//     pushScreen(context,const HomePage ());
//
//     },
//     ),
//       ElevatedButton(
//           onPressed: () {
//             AppLanguage().changeLanguage();
//           },
//           child: Text(S.of(context).changelanguage)),
//       ElevatedButton(
//           onPressed: () {
//             AppLanguage().changeLanguage();
//           },
//           child: Text(S.of(context).arabic)),
//     const SizedBox(height: 10,),
//     const Divider(),
//     ListTile(
//     title: Row(
//     children: [
//     const Icon(Icons.drive_eta_rounded,color:backgroundColor,),
//     const SizedBox(width: 10,),
//     Text(Translator.translate("Driver"),style: whitebasic,),
//     ],
//     ),
//     onTap: () {
//     pushScreen(context, const Driver());
//
//     },
//     ),
//     const SizedBox(height: 10,),
//     const Divider(),
//     ListTile(
//     title: Row(
//     children: [
//     const Icon(Icons.person,color:backgroundColor,),
//     const SizedBox(width: 10,),
//     Text(Translator.translate("Profile"),style: whitebasic,),
//     ],
//     ),
//     onTap: () {
//     pushScreen(context, const Profile());
//
//     },
//     ),
//     const SizedBox(height: 10,),
//     const Divider(),
//     ListTile(
//
//     title: Row(
//     children: [
//     const Icon(Icons.monetization_on_outlined,color: backgroundColor,),
//     const SizedBox(width: 10,),
//     Text(Translator.translate("Transaction"),style: whitebasic,),
//     ],
//     ),
//     onTap: () {
//
//     showDialog(
//
//     context: context,
//     builder: (context) {
//     return
//     AlertDialog(
//
//     backgroundColor: Colors.white,
//     title: const Row(children: [
//
//     // Image.asset(
//     //   'assets/warning-sign.png',
//     //   height: 20,
//     //   width: 20,
//     //   fit: BoxFit.fill,
//     // ),
//     SizedBox(
//     width: 8,
//     ),
//     Text("Select Language",style: TextStyle(fontSize: 20,color: Colors.black),),
//     ]),
//     content:
//     SizedBox(
//     height: 150,
//     child: Column(children: [
//     RadioListTile<String>(
//     value: 'en',
//     title: const Text("en"),
//     groupValue: language,
//     onChanged: (v) {
//     setState(() {
//
//     language = v!;
//     print(v);
//     print(language);
//     });
//     }),
//     RadioListTile(
//     value: 'ar',
//     title: const Text('ar'),
//     groupValue: language,
//     onChanged: (v) {
//     setState(() {
//       print(v);
//     language = v!;
//     });})
//
//     ]),
//     ),
//     actions: [
//     TextButton(
//     onPressed: () {
//     if (Navigator.canPop(context)) {
//     Navigator.pop(context);
//     }
//     },
//     child: const Text(
//     style: TextStyle(
//     color: backgroundColor,
//
//     fontSize: 18,
//     ),
//     'Cancel',
//     ),),
//     TextButton(
//     onPressed:(){
//     AppLanguage().changeLanguage();
//     if (Navigator.canPop(context)) {
//     Navigator.pop(context);
//     }
//     } ,
//
//     child: const Text(
//     style: TextStyle(
//     color: backgroundColor,
//     fontSize: 18,
//     ),
//     'OK',
//
//     ),
//     ),
//     ],
//     );
//     });
//     },
//     ),
//     const SizedBox(height: 10,),
//        const Divider(),
//        ListTile(
//
//           title: Row(
//              children: [
//                 const Icon(Icons.currency_bitcoin,color: backgroundColor,),
//                 const SizedBox(width: 10,),
//                 Text(Translator.translate("Cupon"),style: whitebasic,),
//              ],
//           ),
//           onTap: () {
//
//              showDialog(
//
//                  context: context,
//                  builder: (context) {
//                     return
//                        AlertDialog(
//
//                           backgroundColor: Colors.white,
//                           title: const Row(children: [
//
//                              // Image.asset(
//                              //   'assets/warning-sign.png',
//                              //   height: 20,
//                              //   width: 20,
//                              //   fit: BoxFit.fill,
//                              // ),
//                              SizedBox(
//                                 width: 8,
//                              ),
//                              Text("Select Language",style: TextStyle(fontSize: 20,color: Colors.black),),
//                           ]),
//                           content:
//                           SizedBox(
//                              height: 150,
//                              child: Column(children: [
//                                 RadioListTile<String>(
//                                     value: 'en',
//                                     title: const Text("en"),
//                                     groupValue: language,
//                                     onChanged: (v) {
//                                        setState(() {
//
//                                           language = v!;
//                                           print(v);
//                                           print(language);
//                                        });
//                                     }),
//                                 RadioListTile(
//                                     value: 'ar',
//                                     title: const Text('ar'),
//                                     groupValue: language,
//                                     onChanged: (v) {
//                                        setState(() {
//                                           print(v);
//                                           language = v!;
//                                        });})
//
//                              ]),
//                           ),
//                           actions: [
//                              TextButton(
//                                 onPressed: () {
//                                    if (Navigator.canPop(context)) {
//                                       Navigator.pop(context);
//                                    }
//                                 },
//                                 child: const Text(
//                                    style: TextStyle(
//                                       color: backgroundColor,
//
//                                       fontSize: 18,
//                                    ),
//                                    'Cancel',
//                                 ),),
//                              TextButton(
//                                 onPressed:(){
//                                    AppLanguage().changeLanguage();
//                                    if (Navigator.canPop(context)) {
//                                       Navigator.pop(context);
//                                    }
//                                 } ,
//
//                                 child: const Text(
//                                    style: TextStyle(
//                                       color: backgroundColor,
//                                       fontSize: 18,
//                                    ),
//                                    'OK',
//
//                                 ),
//                              ),
//                           ],
//                        );
//                  });
//           },
//        ),
//        const Divider(),
//        ListTile(
//
//           title: Row(
//              children: [
//                 const Icon(Icons.currency_bitcoin,color: backgroundColor,),
//                 const SizedBox(width: 10,),
//                 Text(Translator.translate("Items"),style: whitebasic,),
//              ],
//           ),
//       onTap: () {
//         AppLanguage().changeLanguage('ar');
//       //  Navigator.push(context, MaterialPageRoute(builder: (context) => AllItems(),));
//       },
//        ),
//     const Divider(),
//     ListTile(
//     title: Row(
//     children: [
//     const Icon(Icons.call,color: backgroundColor,),
//     const SizedBox(width: 10,),
//     Text(Translator.translate(S.of(context).contactus),style: whitebasic,),
//     ],
//     ),
//     onTap: () {
//     pushScreen(context, const Contact());
//     },
//     ),
//     const SizedBox(height: 10,),
//     const Divider(),
//     ListTile(
//     title: Row(
//     children: [
//     const Icon(Icons.share,color: backgroundColor,),
//     const SizedBox(width: 10,),
//     Text(Translator.translate("share"),style: whitebasic,),
//     ],
//     ),
//     onTap: () {
//     //Navigator.pop(context);
//     },
//     ),
//
//     ],
//     ),
//     ),
//     ),
//     //  account==null ? Container():
//
//
//     // account==null ? Container():  Divider(height: 23,thickness: 1.2,),
//     // account==null ? Container():
//
//     ],
//     )),
//     ),
//     );
//     /*return ZoomDrawer(
//       mainScreen: mainscreen(),
//       menuScreen: menuscreen(),
//       //angle: 24,
//       //  Colors.black: Colors.red,
//       clipMainScreen: true,
//
//       borderRadius: 24,
//       showShadow: true,
//     );*/
//     }
//
//     Widget MyDrawerList() {
//     return Container(
//     padding: const EdgeInsets.only(
//     top: 15,
//     ),
//     child: Column(
//     // shows the list of menu drawer
//     children: [
//     menuItem(1, "Home", Icons.home,
//     currentPage == DrawerSections.dashboard ? true : false),
//     menuItem(2, "Profile", Icons.people,
//     currentPage == DrawerSections.contacts ? true : false),
//     menuItem(3, "History", Icons.history,
//     currentPage == DrawerSections.events ? true : false),
//     menuItem(4, "Rate", Icons.star,
//     currentPage == DrawerSections.rate ? true : false),
//     const Divider(),
//     const Padding(
//     padding: EdgeInsets.all(15.0),
//     child: Row(
//     children: [
//     Expanded(
//     child: Icon(
//     Icons.email,
//     size: 30,
//     color: backgroundColor,
//     ),
//     ),
//     Expanded(
//     flex: 3,
//     child: Text(
//     "Sparking@gmail.com",
//     style: TextStyle(
//     color: Colors.black,
//     fontSize: 16,
//     ),
//     ),
//     ),
//     ],
//     ),
//     ),
//     const Padding(
//     padding: EdgeInsets.all(15.0),
//     child: Row(
//     children: [
//     Expanded(
//     child: Icon(
//     Icons.phone,
//     size: 30,
//     color: backgroundColor,
//     ),
//     ),
//     Expanded(
//     flex: 3,
//     child: Text(
//     "07 7651 1704",
//     style: TextStyle(
//     color: Colors.black,
//     fontSize: 16,
//     ),
//     ),
//     ),
//     ],
//     ),
//     ),
//     /*menuItem(5, "Settings", Icons.settings_outlined,
//               currentPage == DrawerSections.settings ? true : false),*/
//     const SizedBox(
//     height: 100,
//     ),
//     InkWell(
//     onTap: () async {
//     // await FirebaseAuth.instance.signOut();
//     // saveSignIn(false);
//     // saveSearch(false);
//     // SharedPreferences shared =
//     // await SharedPreferences.getInstance();
//     // shared.remove('userBooking').whenComplete(() {
//     //   Navigator.of(context).pushAndRemoveUntil(
//     //       MaterialPageRoute(
//     //           builder: (context) => const SignInScreen()),
//     //           (route) => false);
//     // });
//     },
//     child: const ListTile(
//     leading: Text('Log Out'), trailing: Icon(Icons.logout))),
//     // menuItem(6, "LOg Out", Icons.logout,
//     //     currentPage == DrawerSections.notifications ? true : false),
//     /* Divider(),
//           menuItem(7, "Privacy policy", Icons.privacy_tip_outlined,
//               currentPage == DrawerSections.privacy_policy ? true : false),
//           menuItem(8, "Send feedback", Icons.feedback_outlined,
//               currentPage == DrawerSections.send_feedback ? true : false),*/
//
//     const SizedBox(
//     height: 90,
//     ),
//     ],
//     ),
//     );
//     }
//
//     Widget menuItem(int id, String title, IconData icon, bool selected) {
//     return Material(
//     color: selected
//     ? const Color.fromARGB(255, 166, 199, 232)
//         : Colors.transparent,
//     borderRadius: const BorderRadius.vertical(
//     top: Radius.circular(30.0),
//     bottom: Radius.circular(30.0),
//     ),
//     child: InkWell(
//     onTap: () {
//     Navigator.pop(context);
//     setState(() {
//     if (id == 1) {
//     currentPage = DrawerSections.dashboard;
//     } else if (id == 2) {
//     currentPage = DrawerSections.contacts;
//     } else if (id == 3) {
//     currentPage = DrawerSections.events;
//     } else if (id == 4) {
//     currentPage = DrawerSections.rate;
//     } else if (id == 5) {
//     currentPage = DrawerSections.settings;
//     } else if (id == 6) {
//     currentPage = DrawerSections.notifications;
//     } else if (id == 7) {
//     currentPage = DrawerSections.privacy_policy;
//     } else if (id == 8) {
//     currentPage = DrawerSections.send_feedback;
//     }
//     });
//     },
//     child: Padding(
//     padding: const EdgeInsets.all(15.0),
//     child: Row(
//     children: [
//     Expanded(
//     child: Icon(
//     icon,
//     size: 30,
//     color: const Color.fromARGB(255, 84, 145, 206),
//     ),
//     ),
//     Expanded(
//     flex: 3,
//     child: Text(
//     title,
//     style: const TextStyle(
//     color: Colors.black,
//     fontSize: 16,
//     ),
//     ),
//     ),
//     ],
//     ),
//     ),
//     ),
//     );
//     }
//   }
//
//   enum DrawerSections {
//   dashboard,
//   contacts,
//   events,
//   rate,
//   settings,
//   notifications,
//   privacy_policy,
//   send_feedback,
//   }
//
//   class MyHeaderDrawer extends StatefulWidget {
//   const MyHeaderDrawer({super.key});
//
//   @override
//   _MyHeaderDrawerState createState() => _MyHeaderDrawerState();
//   }
//
//   class _MyHeaderDrawerState extends State<MyHeaderDrawer> {
//   @override
//   Widget build(BuildContext context) {
//   return Column(
//   children: [
//   Container(
//   color: Colors.white,
//   //width: 300,
//   height: 200,
//   child: Image.asset("assets/images/logo.png")
//
//   ),
//   const SizedBox(
//   height: 20,
//   ),
//
//   ],
//   );
//   }
//   }
