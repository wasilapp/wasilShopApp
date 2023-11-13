import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:mangerapp/views/transaction/transaction_controller.dart';
import 'package:mangerapp/views/transaction/transaction_model.dart';

import '../../config/custom_package.dart';
import 'date_transaction.dart';

class Transaction extends StatelessWidget {
  Transaction({super.key});
  TransactionController controller=Get.put(TransactionController());
  @override
  void initState(){
    controller.getProducts();
    print(controller.deliveryBoy);

  }
  @override
  Widget build(BuildContext context) {

    return SafeArea(child: Scaffold(
      appBar: AppBar(backgroundColor: backgroundColor,iconTheme: IconThemeData(color: Colors.black),title: Text('all transaction',style: TextStyle(color: Colors.black),)),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child:
    Obx(
    () {
    if (controller.isWaiting) {
    return Center(
    child: CircularProgressIndicator(),
    );
    } else if (controller.isError) {
    return Center(
    child: Text('Error: }'),
    );
    } else if (controller.isSuccess) {
    return
      DataTable(
    columns: [
    DataColumn(label: Text('ID')),
    DataColumn(label: Text('Name')),
    DataColumn(label: Text('remaining')),
    DataColumn(label: Text('Action')),
    ],
    rows: controller.deliveryBoy.map((deliveryBoy) {
    return DataRow(
    cells: [
    DataCell(Text(deliveryBoy.id.toString())),
    DataCell(Text(deliveryBoy.name!.en.toString())),
    DataCell(Center(child: Text('${deliveryBoy.remainingAmount.toString()}'+'JOD'))),
    DataCell(

        ElevatedButton(style: ElevatedButton.styleFrom(backgroundColor: primaryColor),
          child: Text('add'),onPressed: () {
            Get.to(AddTransaction(id: deliveryBoy.id,));
    },)),

    ],
    );
    }).toList(),
    );
    } else {
    return Container();
    }
    },
      )
    )));
  }
  List<DataRow> getRows(List<ShopDeliveryBoys> users) => users.map((ShopDeliveryBoys user) {
    final cells = [user.id, user.name, user.remainingAmount,ElevatedButton(onPressed: () {
Get.to(AddTransaction(id: user.id,));
    }, child: Text('add'))];

    return DataRow(cells: getCells(cells));
  }).toList();
  List<DataCell> getCells(List<dynamic> cells) =>
      cells.map((data) => DataCell(Text('$data'))).toList();


}
