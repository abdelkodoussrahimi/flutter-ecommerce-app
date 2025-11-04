import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:projct2/controller/productdetails_controller.dart';
import 'package:projct2/core/class/handlingdataview.dart';
import 'package:projct2/core/constant/color.dart';
import 'package:projct2/core/constant/routes.dart';
import 'package:projct2/view/widget/productdetails/priceandcount.dart';
import 'package:projct2/view/widget/productdetails/subitemslist.dart';

import '../../widget/productdetails/toppageproductdetails.dart';

class ProductDetails extends StatelessWidget {
  const ProductDetails({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Get.put(ProductDetailsControllerImp());
    return Scaffold(
        bottomNavigationBar: Container(
            margin: const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
            height: 40,
            child: MaterialButton(
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10)),
                color: AppColor.secoundColor,
                onPressed: () {
                  Get.toNamed(AppRoute.cart);
                },
                child: const Text(
                  "Add To Cart",
                  style: TextStyle(
                      color: Colors.white, fontWeight: FontWeight.bold),
                ))),
        body: GetBuilder<ProductDetailsControllerImp>(
            builder: (controller) => HandlingDataView(
                statusRequest: controller.statusRequest,
                widget: ListView(children: [
                  Container(
                      alignment: Alignment.centerLeft,
                      color: AppColor.secoundColor,
                      child: IconButton(
                        onPressed: () {
                          Get.back();
                        },
                        icon: const Icon(Icons.arrow_back),
                        color: Colors.black,
                        iconSize: 35,
                      )),
                  const TopProductPageDetails(),
                  const SizedBox(
                    height: 100,
                  ),
                  Container(
                    padding: const EdgeInsets.all(20),
                    child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text("${controller.itemsModel.itemsName}",
                              style: const TextStyle(
                                      fontSize: 25, fontWeight: FontWeight.bold)
                                  .copyWith(
                                color: const Color.fromARGB(255, 5, 5, 5),
                              )),
                          const SizedBox(height: 10),
                          PriceAndCountItems(
                              onAdd: () {
                                controller.add();
                              },
                              onRemove: () {
                                controller.remove();
                              },
                              price: "${controller.itemsModel.itemsPrice}",
                              count: "${controller.countitems}"),
                          const SizedBox(height: 10),
                          Text("${controller.itemsModel.itemsDesc} ",
                              style: const TextStyle(
                                  fontSize: 20,
                                  color: Color.fromARGB(255, 65, 64, 64))),
                        ]),
                  )
                ]))));
  }
}
