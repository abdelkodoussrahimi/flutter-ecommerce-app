import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:jiffy/jiffy.dart';
import 'package:projct2/controller/orders/pending_controller.dart';
import 'package:projct2/core/constant/color.dart';
import 'package:projct2/core/constant/routes.dart';
import 'package:projct2/data/model/ordersmodel.dart';

import '../../screen/cart/appbarcart.dart';

class CardOrdersList extends GetView<OrdersPendingController> {
  final OrdersModel listdata;
  const CardOrdersList({Key? key, required this.listdata}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Container(
          padding: const EdgeInsets.all(10),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                children: [
                  Text("Order Number : #${listdata.ordersId}",
                      style: const TextStyle(
                          fontSize: 18, fontWeight: FontWeight.bold)),
                  const Spacer(),
                  // Text(listdata.ordersDatetime!)
                ],
              ),
              const Divider(),
              Text(
                  "Order Type : ${controller.printOrderType(listdata.ordersType!)}"),
              Text("Order Price : ${listdata.ordersPrice} \DH"),
              Text("Delivery Price : ${listdata.ordersPricedelivery} \DH "),
              Text(
                  "Payment Method : ${controller.printPaymentMethod(listdata.ordersPaymentmethod!)} "),
              Text(
                  "Order Status : ${controller.printOrderStatus(listdata.ordersStatus!)} "),
              const Divider(),
              Row(
                children: [
                  Text("Total Price : ${listdata.ordersTotalprice} \DH ",
                      style: const TextStyle(
                          fontSize: 18,
                          color: Color.fromARGB(255, 255, 85, 7),
                          fontWeight: FontWeight.bold)),
                  const Spacer(),
                  MaterialButton(
                    onPressed: () {
                      Get.toNamed(AppRoute.ordersdetails,
                          arguments: {"ordersmodel": listdata});
                    },
                    color: const Color.fromARGB(255, 41, 41, 41),
                    textColor: const Color.fromARGB(255, 255, 254, 254),
                    child: const Text("Details"),
                  ),
                  const SizedBox(width: 10),
                  if (listdata.ordersStatus! == "0")
                    MaterialButton(
                      onPressed: () {
                        controller.deleteOrder(listdata.ordersId!);
                      },
                      color: Color.fromARGB(255, 255, 0, 0),
                      textColor: AppColor.backgroundcolor,
                      child: const Text("Delete"),
                    )
                ],
              ),
            ],
          )),
    );
  }
}
