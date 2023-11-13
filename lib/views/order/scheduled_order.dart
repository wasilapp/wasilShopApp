import 'package:custom_searchable_dropdown/custom_searchable_dropdown.dart';
import 'package:get/get.dart';
import 'package:mangerapp/utils/ui/widget/order_widget.dart';
import 'package:sizer/sizer.dart';

import '../../config/custom_package.dart';
import '../../generated/l10n.dart';
import '../../utils/ui/shimmer.dart';
import '../home_screen/order_controller.dart';

class ScheduledOrder extends StatefulWidget {
  const  ScheduledOrder({super.key});

  @override
  State<ScheduledOrder> createState() => _ScheduledOrderState();
}

class _ScheduledOrderState extends State<ScheduledOrder> {

  OrderController controllerOrder = Get.put(OrderController());
  List listToSearch=[
    'All', 'pending','accepted_by_shop','assign_shop_to_delivery','accepted_by_driver',
    'on_the_way', 'delivered','rejected_by_shop','rejected_by_driver','cancelled_by_user','cancelled_by_shop',
  ];
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    controllerOrder.getProducts();
  }
  final GlobalKey<RefreshIndicatorState> _refreshIndicatorKey =
  GlobalKey<RefreshIndicatorState>();  final GlobalKey<RefreshIndicatorState> _refreshIndicatorKey1 =
  GlobalKey<RefreshIndicatorState>();


  @override
  Widget build(BuildContext context) {
    return
      // Obx(() {
      // if (controllerOrder.isWaiting) {
      //   return ListView.builder(shrinkWrap: true,
      //     itemBuilder: (context, index) {
      //       return
      //
      //          const BuildShimmer()
      //       ;
      //     },
      //     itemCount: 10,
      //   );
      // }

     // return
        RefreshIndicator(
          key: _refreshIndicatorKey,
          onRefresh: () async {
        await Future.delayed(Duration(seconds: 2));
        controllerOrder.getProducts();
        return;
      },child: SingleChildScrollView(
        child: Column(mainAxisAlignment:MainAxisAlignment.center ,
          children: [
            Material(elevation: 10,color: Colors.white,
              child: CustomSearchableDropDown(
                menuHeight: 20.h,
                menuMode: true,
                items: listToSearch,
                label: 'selectStatus',
                decoration: BoxDecoration(
                    border: Border.all(
                        color: const Color(0xffeef2fa)
                    )
                ),
                prefixIcon:   Padding(
                  padding: EdgeInsets.symmetric(horizontal: 2.w,),
                  child: const Icon(Icons.search,color: primaryColor),
                ),
                dropDownMenuItems: listToSearch.map((item) {
                  return item;
                }).toList() ??
                    [],
                onChanged: (value){
                  if(value!=null)
                  {
                    setState(() {
                      controllerOrder.selected.value = value.toString();
                      print(controllerOrder.selected.value);
                      controllerOrder.getProducts();                   });
                  }
                  else{
                    controllerOrder.selected.value='';
                  }
                },
              ),
            ),
            Obx(() {      if (controllerOrder.isError) {
              return Center(child: Text(controllerOrder.statusModel.value.errorMsg!.value));
            }
              return
              ListView.builder(scrollDirection: Axis.vertical,physics: const ClampingScrollPhysics(),
              itemBuilder: (context, index) {
                return OrderWidget(order:  controllerOrder.productList[index]);
              },
              itemCount: controllerOrder.productList.length,
              shrinkWrap: true,
            );
            }),
          ],
        ),
      ));
  //});
  }
}
