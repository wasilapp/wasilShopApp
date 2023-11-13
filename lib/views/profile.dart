
import 'dart:developer';
import 'package:http/http.dart' as http;
import 'package:flutter/material.dart';
import 'package:mangerapp/utils/helper/navigator.dart';
import 'package:mangerapp/utils/ui/common_views.dart';
import 'package:mangerapp/views/auth/signin_screen/login_screen.dart';
import 'package:mangerapp/views/change_profile.dart';
import 'package:mangerapp/views/show_profile.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../generated/l10n.dart';
import '../utils/colors.dart';
import 'dart:convert';

class Profile extends StatefulWidget {
  const Profile({super.key});

  @override
  State<Profile> createState() => _ProfileState();
}

class _ProfileState extends State<Profile> {
  @override
  void initState() {
    print('object');
    get();
  }
  var resData='';
  var email='';
  var mobile='';
  var shopname='';
  var onn;
  bool open=false;
  var image;

get() async {
  print('object');

  SharedPreferences sharedPreferences =
  await SharedPreferences.getInstance();
  print(sharedPreferences.getString('token'));
// Replace 'YOUR_BEARER_TOKEN' with your actual Bearer Token
  var bearerToken=sharedPreferences.getString('token');

  try {
    var response = await http.get(Uri.parse('https://news.wasiljo.com/public/api/v1/manager/shops'),
      headers: {'Authorization': 'Bearer $bearerToken'},);
    if (response.statusCode == 200) {
      var resData = jsonDecode(response.body);
      print(resData);
setState(() {
  email=resData['data']['shop']['email'];
  mobile=resData['data']['shop']['mobile'];

  onn=resData['data']['shop']['open'];
  image=resData['data']['shop']['avatar_url'];

});

      print(resData['data']['manager']['email']);
      return resData;
    } else {
      print('Status Code ${response.statusCode}');
      throw Exception('Failed to fetch data');
    }
  }  catch (error) {
    // Handle network or other errors
    print('Error: $error');
  }








}
updateStatus()async{
  log("statrr");
  SharedPreferences prefs= await SharedPreferences.getInstance();
  var bearerToken=   prefs.getString('token');
  try{
  var response=await http.post(Uri.parse('https://news.wasiljo.com/public/api/v1/manager/update_profile'),
  body: {
    'shop[open]':onn.toString()
  },

    headers: {'Authorization': 'Bearer $bearerToken'},
);
if(response.statusCode==200){
  log("done update status");
  setState(() {

  });
}
else{
  print(response.body);
}
  }
      catch(e){
print(e);
      }
}
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
   return Scaffold(
     appBar: CommonViews().getAppBar(title:'Setting'),
     body: Padding(
       padding: const EdgeInsets.all(8.0),
       child: Column(
         children: [
           Row(mainAxisAlignment: MainAxisAlignment.spaceEvenly,
             children: [
                CircleAvatar(radius: 50,backgroundImage: NetworkImage('https://news.wasiljo.com/$image')),

               Column(crossAxisAlignment:CrossAxisAlignment.start,
                 children: [
                   Text(shopname),
                   Text(email ),

                   Text(mobile),
                   ElevatedButton(
                     style: ElevatedButton.styleFrom(backgroundColor: onn==1?primaryColor:Colors.red,
                     shape: const RoundedRectangleBorder(borderRadius: BorderRadius.all(Radius.circular(8)))),

                       onPressed: () {print(onn);
                         updateStatus();
                       print(onn);
                         setState(() {

                           open=!open;
                           open?onn=1:onn=0;
                           print(onn);
                         });
                   }, child: Text(onn==1?'OnnLine':'offline',style: const TextStyle(color: backgroundColor,fontWeight: FontWeight.bold),))
                 ],
               )

             ],
           ),
           const SizedBox(height: 20,),
           // const Divider(color: Color(0xffeef2fa)),
           //
           //    ListTile(
           //   onTap: () {
           //     MangerNavigator.of(context).push( MyProfile());
           //   },
           //   title: const Text('Change Profile'),
           //   leading: const Icon(Icons.person_3_outlined),
           //   trailing: const Icon(Icons.chevron_right_outlined),
           // ),

           const Divider(color: Color(0xffeef2fa)),
           ListTile(
             onTap: () {
               MangerNavigator.of(context).push( ChangeProfile());
             },
             title: const Text('Change Profile'),
             leading: const Icon(Icons.edit),
             trailing: const Icon(Icons.chevron_right_outlined),
           ),

           const Divider(color: Color(0xffeef2fa)),
           // ListTile(
           //   onTap: () {
           //     MangerNavigator.of(context).push(ChangePassword());
           //   },
           //   title: const Text('Change Password'),
           //   leading: const Icon(Icons.lock_outline),
           //   trailing: const Icon(Icons.chevron_right_outlined),
           // ),
           // const Divider(color: Color(0xffeef2fa)),
           // ListTile(
           //   onTap: () {
           //     print('iiiiii');
           //     MangerNavigator.of(context).push(ChangePhone());
           //   },
           //   title: Text('Change mobile'),
           //   leading: Icon(Icons.phone_android),
           //   trailing: Icon(Icons.chevron_right_outlined),
           // ),
           const Divider(color: Color(0xffeef2fa)),

           ListTile(
             onTap: () {

             },
             title: const Text('Select Language'),
             leading: const Icon(Icons.language),
             trailing: const Icon(Icons.chevron_right_outlined),
           ),
           const Divider(color: Color(0xffeef2fa)),
           ListTile(
             onTap: () {
               setState(() {
                 onn=0;
                 updateStatus();
               });
MangerNavigator.of(context).pushReplacement(const LoginScreen());

             },
             title:  Text('logOut'),
             leading: const Icon(Icons.logout_outlined),
             trailing: const Icon(Icons.chevron_right_outlined),
           ),
           const Divider(color: Color(0xffeef2fa)),

           const Divider(color: Color(0xffeef2fa)),
         ],
       ),
     ),

   );
  }

}
// class ApiService {
//   final Dio dio = Dio();
//
//   // Replace 'YOUR_API_ENDPOINT' with your actual API endpoint
//   final String apiUrl = 'https://news.wasiljo.com/public/api/v1/manager/shops';
//
//   // Replace 'YOUR_BEARER_TOKEN' with your actual Bearer Token
//
//
//   final String bearerToken = 'YOUR_BEARER_TOKEN';
//
//   Future<Map<String, dynamic>> fetchProfileData() async {
//     SharedPreferences sharedPreferences =
//     await SharedPreferences.getInstance();
//     try {
//       final response = await dio.get(
//         apiUrl,
//         options: Options(
//           headers: {
//             'Authorization': sharedPreferences.getString('token'),
//           },
//         ),
//       );
//
//       if (response.statusCode == 200) {
//         return response.data;
//       } else {
//         throw Exception('Failed to fetch data');
//       }
//     } catch (e) {
//       throw Exception('Error: $e');
//     }
//   }
// }