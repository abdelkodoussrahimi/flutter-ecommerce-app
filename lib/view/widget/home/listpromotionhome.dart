import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:projct2/core/constant/color.dart';
import 'package:projct2/data/model/promotionmodel.dart';
import 'package:projct2/linkapi.dart';

import '../../../controller/home_controller.dart';

class Listpromotionhome extends GetView<HomeControllerImp> {
  const Listpromotionhome({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 150,
      child: ListView.separated(
        separatorBuilder: (context, index) => const SizedBox(width: 10),
        itemCount: controller.promotiondata.length,
        scrollDirection: Axis.horizontal,
        itemBuilder: (context, index) {
          return Promotion(
            i: index,
            promotionmodel:
                Promotionmodel.fromJson(controller.promotiondata[index]),
          );
        },
      ),
    );
  }
}

class Promotion extends GetView<HomeControllerImp> {
  final Promotionmodel promotionmodel;
  final int? i;

  const Promotion({Key? key, required this.promotionmodel, required this.i})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 10, vertical: 15),
      child: Column(
        children: [
          Container(
              alignment: Alignment.bottomRight,
              padding: const EdgeInsets.all(8),
              height: 120,
              width: 360,
              decoration: BoxDecoration(
                color: AppColor.secoundColor,
                borderRadius: BorderRadius.circular(20),
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Expanded(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text("${promotionmodel.promotionTitel}",
                            style: const TextStyle(
                              color: Color.fromARGB(255, 0, 0, 0),
                              fontSize: 18,
                              fontWeight: FontWeight.bold,
                              fontFamily: "sans",
                            )),
                        Text("${promotionmodel.promotionTitelbody}",
                            style: const TextStyle(
                              color: Color.fromARGB(255, 92, 92, 92),
                              fontSize: 18,
                              fontWeight: FontWeight.bold,
                              fontFamily: "sans",
                            )),
                        Container(
                          width: 90,
                          padding: const EdgeInsets.all(10),
                          decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(20),
                          ),
                          child: const Center(
                              child: Text(
                            "shop Now",
                            style: TextStyle(
                                color: AppColor.secoundColor,
                                fontWeight: FontWeight.bold),
                          )),
                        ),
                      ],
                    ),
                  ),
                  CachedNetworkImage(
                    imageUrl:
                        "${AppLink.imagespromotion}/${promotionmodel.promotionImage}",
                    height: 290,
                    width: 120,
                  ),
                ],
              )),
        ],
      ),
    );
  }
}
