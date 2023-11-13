import 'dart:convert';
import 'dart:developer';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:mangerapp/views/transaction/transaction_controller.dart';
import 'package:mangerapp/views/transaction/transaction_model.dart';
import 'package:sizer/sizer.dart';
import '../../config/custom_package.dart';
import 'package:http/http.dart'as http;
class AddTransaction extends StatefulWidget {
   const AddTransaction( {super.key, this.id});
   final id;

  @override
  State<AddTransaction> createState() => _AddTransactionState();
}

class _AddTransactionState extends State<AddTransaction> {
  TransactionController controller=Get.put(TransactionController());
  DriverOneTransaction ? oneDriver;
  DateTime startDate=DateTime.now();
  DateTime endDate=DateTime.now();
  String startInput = DateFormat('yyyy-MM-dd').format(DateTime.now());
  String endInput = DateFormat('yyyy-MM-dd').format(DateTime.now());

bool press=false;
  @override
  Widget build(BuildContext context) {
    return SafeArea(child: Scaffold(
      appBar: AppBar(backgroundColor: Colors.white,iconTheme: IconThemeData(color: Colors.black),elevation: 0,),
      body: Column(crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text('Start Date ',
                    style: const TextStyle(
                        fontSize: 14,
                        fontWeight: FontWeight.w400,
                        color: Colors.black)),
                const SizedBox(width: 20),
                Expanded(
                  child: InkWell(
                      onTap: () async {
                        log(DateFormat('yyyy-MM-dd')
                            .format(DateTime.now()));
                        log('DateTime.now()');
                        startDate = (await showDatePicker(
                            context: context,
                            initialDate: DateTime.now(),
                            firstDate: DateTime(1950),
                            //DateTime.now() - not to allow to choose before today.
                            lastDate: DateTime(2100)))!;

                        if (startDate != null) {
                          log(
                              startDate.toString());
                          print(DateTime.now().hour);//pickedDate output format => 2021-03-10 00:00:00.000
                          print(startDate);//pickedDate output format => 2021-03-10 00:00:00.000
                          String formattedDate =
                          DateFormat('yyyy-MM-dd').format(startDate!);

                          //formatted date output using intl package =>  2021-03-16
                          setState(() {
                            startInput =
                                formattedDate; //set output date to TextField value.
                          });
                        } else {}
                      },
                      child: Container(
                        padding: const EdgeInsets.all(5),
                        width: 200,
                        height: 50,
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10),
                            border: Border.all(
                                color: Colors.black, width: 2)),
                        child: Align(
                            alignment: Alignment.centerLeft,
                            child: Text(startInput)),
                      )),
                ),
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text('End Date ',
                    style: const TextStyle(
                        fontSize: 14,
                        fontWeight: FontWeight.w400,
                        color: Colors.black)),
                const SizedBox(width: 20),
                Expanded(
                  child: InkWell(
                      onTap: () async {
                        log(DateFormat('yyyy-MM-dd')
                            .format(DateTime.now()));
                        log('DateTime.now()');
                        endDate = (await showDatePicker(
                            context: context,
                            initialDate: DateTime.now(),
                            firstDate: DateTime(1950),
                            //DateTime.now() - not to allow to choose before today.
                            lastDate: DateTime(2100)))!;

                        if (endDate != null) {
                          log(
                              endDate.toString());
                          print(DateTime.now().hour);//pickedDate output format => 2021-03-10 00:00:00.000
                          print(endDate);//pickedDate output format => 2021-03-10 00:00:00.000
                          String formattedDate =
                          DateFormat('yyyy-MM-dd').format(endDate!);

                          //formatted date output using intl package =>  2021-03-16
                          setState(() {
                            endInput =
                                formattedDate; //set output date to TextField value.
                          });
                        } else {}
                      },
                      child: Container(
                        padding: const EdgeInsets.all(5),
                        width: 200,
                        height: 50,
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10),
                            border: Border.all(
                                color: Colors.black, width: 2)),
                        child: Align(
                            alignment: Alignment.centerLeft,
                            child: Text(endInput)),
                      )),
                ),
              ],
            ),
          ),
          SizedBox(height: 4.h,),
          CommonViews().createButton(title: 'Get Total',
    onPressed: () {
            setState(() {
              press=true;
            });
controller.getTransactionId(id:widget.id,startDate:startInput,endDate: endInput );
          }, ),
          SizedBox(height: 4.h,),

     press?
     Column(crossAxisAlignment: CrossAxisAlignment.stretch,
       children: [
         Padding(
           padding: const EdgeInsets.all(8.0),
           child: Text('not paid table'),
         ),
         DataTable(columnSpacing: 0,border: TableBorder(horizontalInside: BorderSide(color: Colors.black)),

              columns: [
                DataColumn(label: Expanded(child: Center(child: Text('start date')))),
                DataColumn(label: Expanded(child: Center(child: Text('end Date')))),
                DataColumn(label: Expanded(child: Center(child: Text('total')))),
                DataColumn(label: Expanded(child: Center(child: Text('Action')))),
              ],
              rows: controller.deliveryBoy.map((deliveryBoy) {
                return DataRow(
                  cells: [
                    DataCell(Center(child: Text(startInput))),
                    DataCell(Center(child: Text(endInput))),
                    DataCell(Center(child: Text('${TransactionController.oneDriver.ordersTotal.toString()}'+'JOD'))),
                    DataCell(

                        Center(
                          child: ElevatedButton(style: ElevatedButton.styleFrom(backgroundColor: primaryColor),
                            child: Text('add'),onPressed: () {
                              Get.to(AddTransaction(id: deliveryBoy.id,));
                            },),
                        )),

                  ],
                );
              }).toList(),
            ),
       ],
     ):Text(''),

        ],
      ),
    ));
  }
  void getTransactionId({id,startDate,endDate}) async {
    log('$id$startDate$endDate');

    SharedPreferences prefs =
    await SharedPreferences.getInstance();
    // Define the request headers
    var bearerToken=prefs.getString('token');
    var headers = {
      'Authorization': 'Bearer $bearerToken'
    };  var body = {
      'startDate':startDate,
      'endDate': endDate
    };
    var response =await http.post( Uri.parse('https://news.wasiljo.com/public/api/v1/manager/get_orders_date_not_paid_cache/$id',
    ) ,headers:headers,body: json.encode(body));




    if (response.statusCode == 200) {
      print(json.decode(response.body)['data']['deliveryBoy']);
      var result=json.decode(response.body)['data']['deliveryBoy'];
      if (json.decode(response.body)['data']['deliveryBoy'].isEmpty) {
        print('response.isEmpty  id${json.decode(response.body)['data']['deliveryBoy']}');


        return;
      }
      else {

        setState(() {
          oneDriver = DriverOneTransaction.fromJson(result);

          print(oneDriver);
        });

      }

      print(await response.body);
      return;

    }



//     if ((response.statusCode >= 200 && response.statusCode < 300)) {
//       //deliveryBoy.clear();
//
//
//       if (json.decode(response.body)['data']['shopDeliveryBoys'].isEmpty) {
//         print('response.isEmpty  id${json.decode(response.body)['data']['shopDeliveryBoys']}');
//
//         statusModel.value.updateStatus(GeneralStatus.error);
//         statusModel.value.updateError("No Result Found");
//         return;
//       }
//       List result = json.decode(response.body)['data']['shopDeliveryBoys'];
//       print('start for');
//
//       for (int index = 0; index < result.length; index++) {
//
//         deliveryBoy.add(ShopDeliveryBoys.fromJson(result[index]));
// log(';;;;;;;');
//       }
//       statusModel.value.updateStatus(GeneralStatus.success);
//
//       return;
//     }
//     print(response.body);
//     statusModel.value.updateStatus(GeneralStatus.error);
//     statusModel.value.updateError(response.body);
  }
  void paidDriver({id,startDate,endDate}) async {
    log('$id$startDate$endDate');

    SharedPreferences prefs =
    await SharedPreferences.getInstance();
    // Define the request headers
    var bearerToken=prefs.getString('token');
    var headers = {
      'Authorization': 'Bearer $bearerToken'
    };  var body = {
      'startDate':startDate,
      'endDate': endDate
    };
    var response =await http.post( Uri.parse('https://news.wasiljo.com/public/api/v1/manager/paid_orders/$id',
    ) ,headers:headers);




    if (response.statusCode == 200) {
      print(json.decode(response.body)['data']['deliveryBoy']);
      var result=json.decode(response.body)['data']['deliveryBoy'];
      if (json.decode(response.body)['data']['deliveryBoy'].isEmpty) {
        print('response.isEmpty  id${json.decode(response.body)['data']['deliveryBoy']}');


        return;
      }
      else {

        setState(() {
          oneDriver = DriverOneTransaction.fromJson(result);

          print(oneDriver);
        });

      }

      print(await response.body);
      return;

    }



//     if ((response.statusCode >= 200 && response.statusCode < 300)) {
//       //deliveryBoy.clear();
//
//
//       if (json.decode(response.body)['data']['shopDeliveryBoys'].isEmpty) {
//         print('response.isEmpty  id${json.decode(response.body)['data']['shopDeliveryBoys']}');
//
//         statusModel.value.updateStatus(GeneralStatus.error);
//         statusModel.value.updateError("No Result Found");
//         return;
//       }
//       List result = json.decode(response.body)['data']['shopDeliveryBoys'];
//       print('start for');
//
//       for (int index = 0; index < result.length; index++) {
//
//         deliveryBoy.add(ShopDeliveryBoys.fromJson(result[index]));
// log(';;;;;;;');
//       }
//       statusModel.value.updateStatus(GeneralStatus.success);
//
//       return;
//     }
//     print(response.body);
//     statusModel.value.updateStatus(GeneralStatus.error);
//     statusModel.value.updateError(response.body);
  }
}
