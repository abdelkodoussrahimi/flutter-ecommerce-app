import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:projct2/controller/myfavoritecontroller.dart';
import 'package:projct2/core/class/handlingdataview.dart';
import 'package:projct2/core/constant/routes.dart';
import 'package:projct2/view/screen/cart/appbarcart.dart';
import 'package:projct2/view/widget/customappbar.dart';
import 'package:projct2/view/widget/myfavorite/customlistfavoriteitems.dart';

class MyFavorite extends StatelessWidget {
  const MyFavorite({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Get.put(MyFavoriteController());
    return Scaffold(
      body: Container(
        padding: const EdgeInsets.symmetric(horizontal: 10),
        child: GetBuilder<MyFavoriteController>(
            builder: ((controller) => ListView(children: [
                  const TopAppbarCart(
                    title: 'MyFavorite',
                  ),
                  Container(
                      padding: const EdgeInsets.all(15),
                      child: TextFormField(
                        decoration: InputDecoration(
                            hintText: "Find Product",
                            hintStyle: const TextStyle(fontSize: 18),
                            border: OutlineInputBorder(
                                borderSide: BorderSide.none,
                                borderRadius: BorderRadius.circular(10)),
                            filled: true,
                            fillColor: Colors.grey[200]),
                      )),
                  const SizedBox(width: 10),
                  HandlingDataView(
                      statusRequest: controller.statusRequest,
                      widget: GridView.builder(
                        shrinkWrap: true,
                        physics: const NeverScrollableScrollPhysics(),
                        itemCount: controller.data.length,
                        gridDelegate:
                            const SliverGridDelegateWithFixedCrossAxisCount(
                                crossAxisCount: 2, childAspectRatio: 0.9),
                        itemBuilder: (context, index) {
                          return CustomListFavoriteItems(
                              itemsModel: controller.data[index]);
                        },
                      ))
                ]))),
      ),
    );
  }
}
