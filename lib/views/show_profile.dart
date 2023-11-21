import 'dart:convert';

import '../config/custom_package.dart';
import 'package:http/http.dart' as http;

import '../model/shop.dart';
class MyProfile extends StatefulWidget {

  @override
  State<MyProfile> createState() => _MyProfileState();
}

class _MyProfileState extends State<MyProfile> {
  void initState() {
    print('object');
    get();
  }

  Shop ?shop;

  @override
  Widget build(BuildContext context) {

    return SafeArea(
      child: Scaffold(
        appBar: AppBar(backgroundColor: backgroundColor),
        body: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            children: [
              Container(
                child: Row(mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    CircleAvatar(radius: 50,backgroundImage: NetworkImage('https://news.wasiljo.com/${shop!.avatarUrl}')),

                    Column(crossAxisAlignment:CrossAxisAlignment.start,
                      children: [
                        Text(shop!.nameEn.toString()),
                        Text(shop!.email.toString()),

                        Text(shop!.mobile.toString()),
                        ElevatedButton(
                            style: ElevatedButton.styleFrom(backgroundColor: shop!.open==1?primaryColor:Colors.red,
                                shape: const RoundedRectangleBorder(borderRadius: BorderRadius.all(Radius.circular(8)))),

                            onPressed: () {


                            setState(() {


                            });
                            }, child: Text(shop!.open==1?'OnnLine':'offline',style: const TextStyle(color: backgroundColor,fontWeight: FontWeight.bold),))
                      ],
                    )

                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  get() async {
    print('object');

    SharedPreferences sharedPreferences =
    await SharedPreferences.getInstance();
    print(sharedPreferences.getString('token'));
// Replace 'YOUR_BEARER_TOKEN' with your actual Bearer Token
    var bearerToken=sharedPreferences.getString('token');

    try {
      var response = await http.get(Uri.parse('https://admin.wasiljo.com/public/api/v1/manager/shops'),
        headers: {'Authorization': 'Bearer $bearerToken'},);
      if (response.statusCode == 200) {
        var resData = jsonDecode(response.body);
        print(resData);
        var result=json.decode(response.body)['data']['shop'];
setState(() {
  shop=Shop.fromJson(result);
});

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
}
