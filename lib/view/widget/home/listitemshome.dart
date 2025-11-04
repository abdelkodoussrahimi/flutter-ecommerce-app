import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:projct2/controller/home_controller.dart';
import 'package:projct2/controller/items_controller.dart';
import 'package:projct2/core/constant/color.dart';
import 'package:projct2/data/model/itemsmodel.dart';
import 'package:projct2/linkapi.dart';

class ListItemsHome extends GetView<HomeControllerImp> {
  const ListItemsHome({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GridView.builder(
        shrinkWrap: true,
        physics: const NeverScrollableScrollPhysics(),
        itemCount: controller.items.length,
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2, childAspectRatio: 0.6),
        scrollDirection: Axis.vertical,
        itemBuilder: (context, i) {
          return ItemsHome(
              itemsModel: ItemsModel.fromJson(controller.items[i]));
        });
  }
}

class ItemsHome extends GetView<HomeControllerImp> {
  final ItemsModel itemsModel;
  const ItemsHome({Key? key, required this.itemsModel}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
        onTap: () {
          controller.goToPageProductDetails(itemsModel);
        },
        child: Card(
          color: Color.fromARGB(255, 240, 240, 240),
          child: Padding(
            padding: const EdgeInsets.all(15),
            child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  CachedNetworkImage(
                    imageUrl:
                        AppLink.imagestItems + "/" + itemsModel.itemsImage!,
                    height: 120,
                    fit: BoxFit.fill,
                  ),
                  const SizedBox(height: 0),
                  Text(itemsModel.itemsName!,
                      style: const TextStyle(
                          color: Color.fromARGB(255, 8, 8, 8),
                          fontSize: 16,
                          fontWeight: FontWeight.bold)),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      const Text("Rating 3.5 ", textAlign: TextAlign.center),
                      Container(
                        alignment: Alignment.bottomCenter,
                        height: 10,
                        child: Row(
                          children: [
                            ...List.generate(
                                5,
                                (index) => const Icon(
                                      Icons.star,
                                      size: 15,
                                    ))
                          ],
                        ),
                      )
                    ],
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text("${itemsModel.itemsPrice} \Dh",
                          style: const TextStyle(
                              color: Color.fromARGB(255, 255, 38, 0),
                              fontSize: 18,
                              fontWeight: FontWeight.bold,
                              fontFamily: "sans")),
                    ],
                  )
                ]),
          ),
        ));
  }
}
