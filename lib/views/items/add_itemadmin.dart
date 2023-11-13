import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:flutter/material.dart';
import 'package:mangerapp/config/custom_package.dart';
import 'package:shared_preferences/shared_preferences.dart';




class AddItemFromAdmin extends StatefulWidget {
  const AddItemFromAdmin({super.key});

  @override
  State<AddItemFromAdmin> createState() => _AddItemFromAdminState();
}

class _AddItemFromAdminState extends State<AddItemFromAdmin> {
  List<Map<String, dynamic>> subAdminCategories = [];

  @override
  void initState() {
    super.initState();
    fetchData();
  }
  Future<void> addItem(String categoryId) async {
    final url = Uri.parse('https://news.wasiljo.com/public/api/v1/manager/subcategories/select');

    final Map<String, dynamic> body = {
      "subCategories": categoryId,
    };
    SharedPreferences prefs =
    await SharedPreferences.getInstance();
    // Define the request headers
    var bearerToken=prefs.getString('token');
    final headers = <String, String>{
      'Content-Type': 'application/json',
      'Authorization': 'Bearer $bearerToken'
    };

    final response = await http.post(
      url,
      headers: headers,
      body: jsonEncode(body),
    );

    if (response.statusCode == 200) {
      // Successfully added the item, you can handle the response here if needed.
      print('Item added successfully');
    } else {
      // Handle the error in case of a non-200 status code.
      print('Failed to add item. Status code: ${response.statusCode}');
    }
  }
  Future<void> fetchData() async {
    SharedPreferences prefs =
    await SharedPreferences.getInstance();
    // Define the request headers
    var bearerToken=prefs.getString('token');
    final headers = {

      'Authorization': 'Bearer $bearerToken'
    };
    final response = await http.get(
        Uri.parse('https://news.wasiljo.com/public/api/v1/manager/categories'),
      headers: headers
    );

    if (response.statusCode == 200) {
      print("tes");
      final data = json.decode(response.body);
      setState(() {
        subAdminCategories = data['data']['allCategories'][0]['sub_admin_categories']
            .map<Map<String, dynamic>>(
                (category) => {
              'title': category['title']['en'],
                  'description':category['description']['en'],
                  'image_url':category['image_url'],
              'price': category['price'],
              'id': category['id'],
              'category_id': category['category_id'],
            })
            .toList();
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(backgroundColor: primaryColor,elevation: 0,
          title: const Text('Sub Admin Categories'),
        ),
        body: ListView.builder(
          shrinkWrap: true,
          itemCount: subAdminCategories.length,
          itemBuilder: (context, index) {
            final category = subAdminCategories[index];
            return Column(
              children: [
            ListTile(trailing: ElevatedButton(
              child: const Text("Add Item"),
              onPressed: () async {
                print(category['id']);
      addItem(category['id'].toString());



              },
            ),
            leading:Image.network(
              'https://news.wasiljo.com/public/${category['image_url']}',
              width: 50,
              height: 80,
              fit: BoxFit.cover,
            ),
            title: Text(category['id'].toString()),
            subtitle: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
            Text('Price: ${category['price']}'),
            Text('Description: ${category['description']}'),
            ],
            ),
            ),
                const Divider()
              ],
            )
            ;
          },
        ),
      ),
    );
  }
}