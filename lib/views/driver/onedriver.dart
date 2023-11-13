import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:mangerapp/utils/colors.dart';
import 'package:omni_datetime_picker/omni_datetime_picker.dart';
import 'package:intl/intl.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:http/http.dart' as http;
import '../../generated/l10n.dart';
import '../../services/app_localization.dart';
import '../../utils/size_config.dart';
class OneDriver extends StatefulWidget {
  final Map<String, dynamic> driver;

  const OneDriver({super.key, required this.driver});

  @override
  State<OneDriver> createState() => _OneDriverState();
}

class _OneDriverState extends State<OneDriver> {
  final double coverHeight=280;
  final double profileHeight=144;
  TextEditingController? datePicker;
  String dateString="";
  String  timeString = "";
  @override
  void initState() {

    datePicker = TextEditingController();


  }
  @override
  Widget build(BuildContext context) {
    return SafeArea(child: Scaffold(
        appBar: AppBar(
backgroundColor: primaryColor,
        ),
        body:Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: <Widget>[


            Container(

              child: Column(
                children: [

                  Padding(
                    padding: const EdgeInsets.symmetric(vertical: 8.0,horizontal: 20),
                    child: Row(

                       mainAxisAlignment: MainAxisAlignment.start,

                        children: [
                          CircleAvatar(
                              radius: 50,
                              backgroundImage:  NetworkImage(
                                'https://news.wasiljo.com/${widget.driver['avatar_url']}',)),
                      const SizedBox(width: 30,),
                          Column(crossAxisAlignment: CrossAxisAlignment.start,
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text('Name : ${widget.driver['name']['en']}',      style: const TextStyle(color: Colors.black,fontWeight: FontWeight.bold,fontSize: 16)),
                              Text('Mobile : ${widget.driver['mobile']}',      style: const TextStyle(color: Colors.black,fontWeight: FontWeight.bold,fontSize: 16)),
                              const SizedBox(height: 5,),
                              // const Row(mainAxisAlignment: MainAxisAlignment.center,
                              //     children: [
                              //       Icon(Icons.star,color: Colors.yellow,size: 25),
                              //       Icon(Icons.star,color: Colors.yellow,size: 25),
                              //       Icon(Icons.star,color: Colors.yellow,size: 25),
                              //       Icon(Icons.star,color: Colors.white,size: 25),
                              //       Icon(Icons.star,color: Colors.white,size: 25),
                              //     ] ),
                              const SizedBox(height: 5,),
                              ElevatedButton(
                                style: ElevatedButton.styleFrom(
                                    backgroundColor:Colors.white,
                                    shape: const RoundedRectangleBorder()),
                                onPressed: () {

                              },
                                child: Row(
                                  children: [
                                    const Icon(Icons.online_prediction,     color: Colors.black),
                                    Text(widget.driver['is_offline']==1?"Online":"Offline",style: const TextStyle(
                                        color: Colors.black
                                    ),),
                                  ],
                                ),
                              ),
                            ],
                          )]

                    ),
                  ),

                  const SizedBox(height: 10,),

                  const SizedBox(height: 10,),

                  const SizedBox(height: 10,),
                  const SizedBox(height: 10,),

                  const SizedBox(height: 20,),
                ],
              ),
            ),
            const SizedBox(height: 20,),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Container(
                  width: 100,
                  height: 60,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    color: primaryColor,
                  ),
                  child:  Center(

                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text('all',style: TextStyle(
                            fontWeight: FontWeight.bold,color: Colors.black
                        )),
                        Text('50'),
                      ],
                    ),
                  ),
                ),
                Container(
                  width: 100,
                  height: 60,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    color:primaryColor,

                  ),
                  child:  Center(

                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text("empty",style: TextStyle(
                            fontWeight: FontWeight.bold,color: Colors.black
                        )),
                        Text('50'),
                      ],
                    ),
                  ),
                ),
                Container(
                  width: 100,
                  height: 60,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    color: primaryColor,

                  ),
                  child: const Center(

                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text('Not Empty ',style: TextStyle(
                            fontWeight: FontWeight.bold,color: Colors.black
                        )),
                        Text('50'),
                      ],
                    ),
                  ),
                ),
              ],
            ),
const SizedBox(height: 30,),

            ClipRRect(
              borderRadius: BorderRadius.all(Radius.circular(MySize.size8!)),
              child: Container(
                padding: Spacing.all(16),
                margin: Spacing.fromLTRB(16, 16, 16, 8),

                decoration: BoxDecoration(
                  borderRadius: BorderRadius.all(Radius.circular(MySize.size8!)),
                  color:const Color(0xffffffff),
                  border: Border.all(color: const Color(0xffeef2fa), width: 1.5),
                ),
                child: Column(
                  children: [
                    Row(mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        const Text(' From'),
                        InkWell(
                          onTap: () async{
                            print(dateString);
                            DateTime? pickedDate = await showOmniDateTimePicker(context: context);

                            dateString = DateFormat('dd-MM-yyyy').format(pickedDate!);
                            timeString = DateFormat('HH:mm').format(pickedDate);
                            datePicker?.text = "$dateString-$timeString";
                            setState(() {
                              dateString = DateFormat('dd-MM-yyyy').format(pickedDate);
                              timeString = DateFormat('HH:mm').format(pickedDate);
                            });

                          },
                          child:

                          Container(



                              padding: const EdgeInsets.all(10),
                              decoration: BoxDecoration(
                                  border: Border.all(color: primaryColor),
                                  borderRadius: BorderRadius.circular(10)
                              ),

                              child: Text(dateString.isEmpty?'From':dateString)
                            // TextField
                            //   (decoration: InputDecoration(
                            //   border: InputBorder.none
                            // ),
                            //   style: TextStyle(color: Colors.black),
                            //   controller: datePicker,readOnly: true,onTap: () async{
                            //   DateTime? pickedDate = await showOmniDateTimePicker(context: context);
                            //   dateString = DateFormat('dd-MM-yyyy').format(pickedDate!);
                            //   timeString = DateFormat('HH:mm').format(pickedDate);
                            //   datePicker?.text = dateString + "-" + timeString;
                            // },),
                          ),
                        ),
                        Container(   color: const Color(0xff48a080),width:2,height: 30),
                        const Text(' To'),   InkWell(
                          onTap: () async{
                            print(dateString);
                            DateTime? pickedDate = await showOmniDateTimePicker(context: context);

                            dateString = DateFormat('dd-MM-yyyy').format(pickedDate!);
                            timeString = DateFormat('HH:mm').format(pickedDate);
                            datePicker?.text = "$dateString-$timeString";
                            setState(() {
                              dateString = DateFormat('dd-MM-yyyy').format(pickedDate);
                              timeString = DateFormat('HH:mm').format(pickedDate);
                            });

                          },
                          child:

                          Container(



                              padding: const EdgeInsets.all(10),
                              decoration: BoxDecoration(
                                  border: Border.all(color: primaryColor),
                                  borderRadius: BorderRadius.circular(10)
                              ),

                              child: Text(dateString.isEmpty?'To':dateString)
                            // TextField
                            //   (decoration: InputDecoration(
                            //   border: InputBorder.none
                            // ),
                            //   style: TextStyle(color: Colors.black),
                            //   controller: datePicker,readOnly: true,onTap: () async{
                            //   DateTime? pickedDate = await showOmniDateTimePicker(context: context);
                            //   dateString = DateFormat('dd-MM-yyyy').format(pickedDate!);
                            //   timeString = DateFormat('HH:mm').format(pickedDate);
                            //   datePicker?.text = dateString + "-" + timeString;
                            // },),
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(height: 15,),
                    Center(

                      child: Row(mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            Translator.translate("Number Orders") + " : " +      " " +
                               ''
                               '0.50' +
                                " " ,
                            style:TextStyle(
                                color: secondaryColor,
                                fontWeight: FontWeight.w800,
                                fontSize: MySize.size14,
                                ),
                          ),
                          const Text('See more',style: TextStyle(color: Colors.grey),)
                        ],
                      ),
                    ),

                    const SizedBox(height: 20,),
                    Center(

                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            Translator.translate("delivery_rev") + " : " +      " " +
                                'Jo'
                                    '0.50' +
                                " " ,
                            style:TextStyle(
                              color: secondaryColor,
                              fontWeight: FontWeight.w800,
                              fontSize: MySize.size14,
                            ),
                          ),
                          const Text('See more',style: TextStyle(color: Colors.grey),)
                        ],
                      ),
                    ),

                    const SizedBox(height: 20,),


                  ],
                ),
              ),
            ),
const Spacer(),
            InkWell(
    onTap: ()async {

    SharedPreferences prefs= await SharedPreferences.getInstance();
    var bearerToken=   prefs.getString('token');
    final response = await http.delete(
    Uri.parse(
    "https://news.wasiljo.com/public/api/v1/manager/delivery_boys/delete/${widget.driver['id']}"),
    headers: {'Authorization': 'Bearer $bearerToken'},
    );

    if (response.statusCode == 200) {
      AlertDialog(
        title: const Text("Confirm Deletion"),
        content: const Text("Are you sure you want to delete this driver?"),
        actions: <Widget>[
          TextButton(
            onPressed: () {
              Navigator.of(context).pop(); // Close the dialog
            },
            child: const Text("Cancel"),
          ),
          TextButton(
            onPressed: () {
              Navigator.of(context).pop(); // Close the dialog
              //onConfirm(); // Call the callback function for confirmation
            },
            child: const Text("Delete"),
          ),
        ],
      );
    final Map<String, dynamic> jsonResponse = json.decode(response.body);

    if (jsonResponse['status'] == true) {

    print("yess");
    }
    } else {
    throw Exception("Failed to load data");
    }},
              child: Container(color: Colors.redAccent,
                height: 60,
                padding: const EdgeInsets.symmetric(horizontal: 20),
                child: const
    Row(mainAxisAlignment: MainAxisAlignment.center,
children: [
  Center(
    child: Text('Delet Driver',style: TextStyle(color: Colors.white,fontSize: 20,fontWeight: FontWeight.bold),
    ),
  )
],
                ),

            ))


      ]  )

    ));
  }


}
