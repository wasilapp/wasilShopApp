import 'dart:convert';

import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:mangerapp/config/custom_package.dart';
import 'package:mangerapp/views/driver/add_driver.dart';

import 'package:mangerapp/views/driver/onedriver.dart';
import 'package:sizer/sizer.dart';
import 'package:url_launcher/url_launcher.dart';
import '../../utils/helper/UrlUtils.dart';
import 'package:http/http.dart' as http;

class Driver extends StatefulWidget {
  const Driver({super.key});

  @override
  State<Driver> createState() => _DriverState();
}

class _DriverState extends State<Driver> {
  List<dynamic> activeDrivers = [];
  List<dynamic> pendingDrivers = [];
  List<dynamic> waitAdminDrivers = [];

  @override
  void initState() {

    super.initState();
    fetchData();

  }

  Future<void> fetchData() async {

    SharedPreferences prefs= await SharedPreferences.getInstance();
    var bearerToken=   prefs.getString('token');
    print(bearerToken);
    final response = await http.get(
      Uri.parse(
          "https://news.wasiljo.com/public/api/v1/manager/delivery_boys/get_all"),
      headers: {'Authorization': 'Bearer $bearerToken'},
    );

    if (response.statusCode == 200) {
      final Map<String, dynamic> jsonResponse = json.decode(response.body);

      if (jsonResponse['status'] == true) {
        setState(() {
          activeDrivers = jsonResponse['data']['shopDeliveryBoysAcceptAdmin'];
          pendingDrivers = jsonResponse['data']['shopDeliveryBoysPending'];
          waitAdminDrivers = jsonResponse['data']
          ['shopDeliveryBoysAcceptManager']
              .where((driver) => !activeDrivers
              .any((activeDriver) => activeDriver['id'] == driver['id']))
              .toList();
        });
        print(activeDrivers);
        print("************************************************");
        print(pendingDrivers);
        print("************************************************");
        print(waitAdminDrivers);
      }
    } else {
      throw Exception("Failed to load data");
    }
  }
  final GlobalKey<RefreshIndicatorState> _refreshIndicatorKey =
  GlobalKey<RefreshIndicatorState>();
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 3,
      child: SafeArea(
        child: Scaffold(

          floatingActionButton: FloatingActionButton(
            onPressed: () {
              MangerNavigator.of(context).push(const AddDriver());},
            backgroundColor: primaryColor,
            shape: const StadiumBorder(),
            child: const Icon(
              Icons.add,
              color: backgroundColor,
            ),
          ),
          appBar: AppBar(

            backgroundColor: backgroundColor,
iconTheme: IconThemeData(color: secondaryColor),
            bottom: const TabBar(
              indicatorColor: primaryColor,
              labelColor: primaryColor,
              unselectedLabelColor: primaryColor,



              tabs: [
                Tab(text: 'Active '),
                Tab(text: 'request '),
                Tab(text: 'Pending '),
              ],
            ),
          ),
          body: RefreshIndicator(
    key: _refreshIndicatorKey,
    onRefresh: () async {
    // Replace this delay with the code to be executed during refresh
    // and return a Future when code finishes execution.
    fetchData();
    print('55555555555555');
    setState(() {

    });},child:TabBarView(
            children: [
              _buildActiveDriverList(activeDrivers),
              _buildPendingDriverList(pendingDrivers),
              _buildActiveDriverList(waitAdminDrivers),
            ],
          ),
        ),
      ),
    ));
  }

  Widget _buildActiveDriverList(List<dynamic> drivers) {
    final GlobalKey<RefreshIndicatorState> _refreshIndicatorKey1 =
    GlobalKey<RefreshIndicatorState>();
   return  drivers.isEmpty?   const Center(child: Text("No Driver Right now",style: TextStyle(color: Colors.black),)):
   RefreshIndicator(key: _refreshIndicatorKey1,
     onRefresh: ()async {
       await Future.delayed(Duration(seconds: 2));
       fetchData();
       return ;
     },
     child: ListView.builder(
      itemCount: drivers.length,
      itemBuilder: (context, index) {
        final driver = drivers[index];
        final avatarUrl = driver['avatar_url'];

        return   Column(
          children: [
            InkWell(
              onTap: () {
                print("driver");
                MangerNavigator.of(context).push(OneDriver(driver: driver));
              },
              child:    Padding(
                padding: const EdgeInsets.all(8.0),
                child: Container(
                  decoration: BoxDecoration(
                      border: Border.all(color: borderColor)
                  ),



                  child: ListTile(trailing: IconButton(icon: Icon(Icons.arrow_forward_ios_rounded,color: primaryColor,),
                  onPressed: () {
                    Get.to(OneDriver(driver: driver['id']));
                  },),
                    leading: Image.network(
                      'https://news.wasiljo.com/$avatarUrl',
                      width: 60,
                      height: 60,
                      fit: BoxFit.cover,
                    ),
                    title: Text(
                      driver['name']['en'],
                      style: const TextStyle(fontWeight: FontWeight.bold),
                    ),
                    subtitle:

                    Row(

                        children: [
                        InkWell(
                  //       onTap: () {
                  // launch(
                  // "tel:${driver['mobile']}"); // driver['mobile'] should contain the phone number
                  // },
                    child: Row(
                      children: [

                         Icon(Icons.do_not_disturb_on_total_silence,size: 10, color: driver['is_offline']==1 ?Colors.red:primaryColor),
                        Text(driver['is_offline'] ==1 ?'Offline':'Onnline',style: const TextStyle(color: secondaryColor)),

                      ],
                    ),

                  ),
                  const SizedBox(width: 5,),
                  // InkWell(
                  //   onTap: () {
                  //     UrlUtils.openMap(driver['latitude'], driver['longitude']);
                  //   },
                  //   child: const Row(
                  //     children: [
                  //       Icon(
                  //         Icons.location_on,
                  //         color: primaryColor,
                  //         size: 22,
                  //       ),
                  //       Text(" Location ",)
                  //
                  //     ],
                  //   ),
                  //
                  // ),
                 ] ),
                ),
              )) ),
            Divider(color: borderColor,thickness: 2,)
          ],
        );
      },
      ),
   );
  }
  final GlobalKey<RefreshIndicatorState> _refreshIndicatorKey2 =
  GlobalKey<RefreshIndicatorState>();
  Widget _buildPendingDriverList(List<dynamic> drivers) {

    return  drivers.isEmpty?   const Center(child: Text("No Driver Right now",style: TextStyle(color: Colors.black),)):
    RefreshIndicator(key: _refreshIndicatorKey2,
      onRefresh: ()async {
        await Future.delayed(Duration(seconds: 2));
        fetchData();
        return ;
      },

      child: ListView.builder(
        itemCount: drivers.length,
        itemBuilder: (context, index) {
          final driver = drivers[index];
          final avatarUrl = driver['avatar_url'];
          return Column(
            children: [
              InkWell(
                  onTap: () {
                    print("driver");
                    print(driver);
                    print(driver['token']);
                    MangerNavigator.of(context).push(OneDriver(driver: driver));
                  },
                  child:    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: ListTile(
                        leading: Image.network(
                          'https://news.wasiljo.com/$avatarUrl',
                          width: 60,
                          height: 60,
                          fit: BoxFit.cover,
                        ),
                        title: Text(
                          driver['name']['en'],
                          style: const TextStyle(fontWeight: FontWeight.bold),
                        ),
                        subtitle:
                        Column(
                          children: [
SizedBox(height: 2.h,),
                            Row(

                              children: [
                                InkWell(
                                  onTap: ()async {

                                    SharedPreferences prefs= await SharedPreferences.getInstance();
                                    var bearerToken=   prefs.getString('token');
                                    final response = await http.get(
                                      Uri.parse(
                                          "https://news.wasiljo.com/public/api/v1/manager/delivery_boys_requests/accept/${driver['id']}"),
                                      headers: {'Authorization': 'Bearer $bearerToken'},
                                    );

                                    if (response.statusCode == 200) {
                                      final Map<String, dynamic> jsonResponse = json.decode(response.body);

                                      if (jsonResponse['status'] == true) {

                                        print("yess");
                                        fetchData();
                                        Get.snackbar('success accept', '',
                                            backgroundColor: primaryColor, snackPosition: SnackPosition.BOTTOM,
                                            icon: Icon(Icons.done_outline_rounded));
                                      }
                                    } else {
                                      throw Exception("Failed to load data");
                                    }
                                  },
                                  child: Container(width: 60,
                                    padding: const EdgeInsets.all(5),
                                    decoration: const BoxDecoration(
                                      color:  Color(0xff129777),
                                      borderRadius: BorderRadius.all(Radius.circular(2)),

                                    ),
                                    child: const Text(
                                      "Accept",textAlign: TextAlign.center,
                                      style: TextStyle(fontSize: 11,color: backgroundColor),
                                    ) ,
                                  ),),

                                const SizedBox(
                                  width: 20,
                                ),
                                InkWell(
                                  onTap: ()async {

                                    SharedPreferences prefs= await SharedPreferences.getInstance();
                                    var bearerToken=   prefs.getString('token');
                                    final response = await http.get(
                                      Uri.parse(
                                          "https://news.wasiljo.com/public/api/v1/manager/delivery_boys_requests/decline/${driver['id']}"),
                                      headers: {'Authorization': 'Bearer $bearerToken'},
                                    );

                                    if (response.statusCode == 200) {
                                      print(driver['id']);
                                      final Map<String, dynamic> jsonResponse = json.decode(response.body);

                                      if (jsonResponse['status'] == true) {

fetchData();
Get.snackbar('success decline', '',
    backgroundColor: primaryColor, snackPosition: SnackPosition.BOTTOM,
    icon: Icon(Icons.done_outline_rounded));
                                        print("yess");
                                      }
                                    } else {
                                      throw Exception("Failed to load data");
                                    }
                                  },
                                  child: Container(width: 60,
                                    padding: const EdgeInsets.all(5),
                                    decoration: const BoxDecoration(
                                      color: Colors.red,
                                      borderRadius: BorderRadius.all(Radius.circular(2)),

                                    ),
                                    child: const Text(
                                      "Decline",textAlign: TextAlign.center,
                                      style: TextStyle(fontSize: 11,color: backgroundColor),
                                    ) ,
                                  ),),
                                const SizedBox(width: 10,),
                                const InkWell(

                                  child: Text(
                                    "view",
                                    style: TextStyle(color: Colors.grey),
                                  ) ,
                                ),
                              ],
                            ),
                          ],
                        ),

                      )) ),
              Divider(color: borderColor,thickness: 2,)
            ],
          );
        },
      ),
    );
  }
}
