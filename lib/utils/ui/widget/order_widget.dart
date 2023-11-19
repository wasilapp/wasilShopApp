import 'package:get/get.dart';
import 'package:sizer/sizer.dart';

import '../../../config/custom_package.dart';
import '../../../generated/l10n.dart';
import '../../../l10n/app_language.dart';
import '../../../views/assign_to_driver/all_driver.dart';
import '../../../views/home_screen/order_controller.dart';
import '../../../views/home_screen/order_model.dart';
import '../../../views/order/detail_order.dart';

class OrderWidget extends StatelessWidget {
  final Orders order;
   OrderWidget({super.key, required this.order});

  OrderController controllerOrder = Get.put(OrderController());
  _refresh
      () async {
    // Replace this delay with the code to be executed during refresh
    // and return a Future when code finishes execution.
    controllerOrder.getProducts();

    return Future<void>.delayed(const Duration(seconds: 3));
  }
  @override
  Widget build(BuildContext context) {
    OrderController controllerOrder = Get.put(OrderController());
      return  Container(
          padding: Spacing.all(16),
          margin: Spacing.only(top: 1.h, bottom: 1.h),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.all(Radius.circular(MySize.size8!)),
            color: Colors.white,
            border: Border.all(color:  const Color(0xffeef2fa), width: 1.5),
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Row(mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    "${S.of(context).orders} ${order.id}",
                    style: const TextStyle(
                        fontWeight: FontWeight.w700,
                        letterSpacing: -0.2),
                  ),
                  Text(
                 AppLanguage().appLocale=='en'?   order.statu!.title!.en.toString():order.statu!.title!.ar.toString(),
                    style: const TextStyle(
                        fontSize: 11, fontWeight: FontWeight.w700, letterSpacing: 0.25),
                  ),
                ],
              ),
               SizedBox(height: 1.h,),

              Text(
         S.of(context).totalprice.tr+' :${order.total.toString()} JD',
                style: const TextStyle(
                    fontWeight: FontWeight.w600,
                    letterSpacing: 0),
              ),            const SizedBox(height: 10,),
              Text(
                S.of(context).orderDate.tr+'${order.orderTime!.orderDate.toString() }',
                style: TextStyle(
                    fontWeight: FontWeight.w600,
                    color: Colors.grey.shade400,
                    letterSpacing: 0),

              ),
              const SizedBox(height: 10,),
              Text(
                S.of(context).orderTime.tr+'${order.orderTime!.orderTimeFrom}-${order.orderTime!.orderTimeTo}',
                style: TextStyle(
                    fontWeight: FontWeight.w600,
                    color: Colors.grey.shade400,
                    letterSpacing: 0),

              ),            const SizedBox(height: 10,),
              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  order.status==1?
                  Row(
                    children: [
                      InkWell(
                        onTap: () {
                          controllerOrder.statusOrder(id: order.id.toString(), status:'accepted');
                          // Get.off(const homepage());
                          controllerOrder.getProducts();


                        },
                        child:SizedBox(
                          width: 80,
                          height: 30,
                          child: Material(
                              color: Colors.white,
                              elevation: 5,


                              // decoration: BoxDecoration(borderRadius: BorderRadius.circular(10),color: Colors.grey.withOpacity(0.2)),
                              child: Center(child: Text('accept'.tr,style: const TextStyle(fontWeight: FontWeight.bold,color: Colors.green),))),
                        ) ,
                      ),
                      const SizedBox(width: 20,),
                      SizedBox(
                        width: 80,
                        height: 30,
                        child: Material(
                          color: Colors.white,
                          elevation: 5,


                          child: InkWell(
                            onTap: () {
                              controllerOrder.statusOrder(id: order.id.toString(), status:'rejected');
                              _refresh();
                              // Get.off(HomePage());
                            },
                            child:Center(child: Text(Translator.translate("Decline".tr),style: const TextStyle(fontWeight: FontWeight.bold,color: Colors.red),)) ,
                          ),
                        ),
                      ),
                    ],
                  ):    order.status==2? Material(
                    color: Colors.white,
                    elevation: 5,


                    child: Container(padding: const EdgeInsets.all(10),
                      child: InkWell(
                        onTap: () {
                          Get.to(const AllDriver(),arguments: {'orderId':order.id.toString()})    ;     _refresh();         },
                        child:Center(child: Text('assignToDriver'.tr,style: const TextStyle(fontWeight: FontWeight.bold,color: primaryColor),)) ,
                      ),
                    ),
                  ):const Text(''),
                  const Spacer(),
                  InkWell(
onTap: () {
 Get.to(OrderDetail(model: order,));
},
                    child:Text(Translator.translate("view detail".tr),style: const TextStyle(fontWeight: FontWeight.normal,color: Colors.black),) ,
                  ),
                ],)
            ],
          ));
    }
  }

