import 'dart:convert';

import 'package:get/get.dart';
import 'package:mangerapp/config/custom_package.dart';

import 'package:http/http.dart' as http;

import '../home_screen/order_controller.dart';

class AllDriver extends StatefulWidget {
  const AllDriver({super.key});

  @override
  State<AllDriver> createState() => _AllDriverState();
}

class _AllDriverState extends State<AllDriver> {
  List<dynamic> activeDrivers = [];
  List<dynamic> pendingDrivers = [];
  List<dynamic> waitAdminDrivers = [];
String? orderId;
  @override
  void initState() {
    orderId=Get.arguments['orderId'];
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
  OrderController controllerOrder = Get.put(OrderController());

  @override
  Widget build(BuildContext context) {

    return DefaultTabController(
      length: 3,
      child: SafeArea(
        child: Scaffold(


          appBar: AppBar(
elevation: 0,
       backgroundColor: Colors.white,
centerTitle: true
            ,iconTheme: const IconThemeData(color: Colors.black),
// title: const Text(' assign  order to driver',style: TextStyle(color: Colors.black,fontWeight: FontWeight.normal)
// ),
          ),
          body: _buildActiveDriverList(activeDrivers),
        ),
      ),
    );
  }

  Widget _buildActiveDriverList(List<dynamic> drivers) {

    return  drivers.isEmpty?   const Center(child: Text("No Driver Right now",style: TextStyle(color: Colors.black),)):
    ListView.builder(
      itemCount: drivers.length,
      itemBuilder: (context, index) {
        final driver = drivers[index];
        final avatarUrl = driver['avatar_url'];

        return   Padding(
            padding: const EdgeInsets.all(8.0),
            child: Container(
        padding: Spacing.all(16),
        margin: Spacing.only(top: 8, bottom: 8),
        decoration: BoxDecoration(
        borderRadius: BorderRadius.all(Radius.circular(MySize.size8!)),
        color: Colors.white,
        border: Border.all(color:  const Color(0xffeef2fa), width: 1.5),
        ),




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
                subtitle:Column(
                  children: [
                    Row(mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Row(
                          children: [
                            Icon(driver['is_offline']==0?Icons.radio_button_checked_rounded:Icons.radio_button_off,color:driver['is_offline']==0?primaryColor:Colors.red,),
                            Text(driver['is_offline']==0?'onnline':'offline',style: const TextStyle(color: primaryColor,fontWeight: FontWeight.w400),),
                          ],
                        ),
                        Text( 'Far from shop	${ driver['distance'].toString()}')
                      ],
                    ),
//                         Row(
// mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                             children: [
//                               InkWell(
//                                 onTap: () {
//                                   launch(
//                                       "tel:${driver['mobile']}"); // driver['mobile'] should contain the phone number
//                                 },
//                                 child: Row(
//                                   children: [
//
//                                     const Icon(Icons.call, color: primaryColor),
//                                     Text(driver['mobile'] ?? '',style: TextStyle(color: secondaryColor)),
//
//                                   ],
//                                 ),
//
//                               ),
//                               SizedBox(width: 5,),
//                               InkWell(
//                                 onTap: () {
//                                   UrlUtils.openMap(driver['latitude'], driver['longitude']);
//                                 },
//                                 child: const Row(
//                                   children: [
//                                     Icon(
//                                       Icons.location_on,
//                                       color: primaryColor,
//                                       size: 22,
//                                     ),
//                                     Text(" Location ",)
//
//                                   ],
//                                 ),
//
//                               ),
//                             ] ),
                  const SizedBox(height: 10,),
                Material(
                  color: Colors.white,
                  elevation: 5,


                  child: Container(padding: const EdgeInsets.all(10),color: primaryColor,
                    child: InkWell(
                      onTap: () {
                      controllerOrder.assignOrderOrder(driverId: driver['id'].toString(), orderId: orderId.toString())  ;
                      controllerOrder.getProducts();
                      Get.off(const homepage());},

                      child:Center(child: Text(Translator.translate("assign to driver"),style: const TextStyle(fontWeight: FontWeight.bold,color: Colors.white),)) ,
                    ),
                  ),),
                  ],
                ),


              ),
            ));
      },
    );
  }


}
