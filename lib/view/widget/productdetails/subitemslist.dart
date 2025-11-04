import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:projct2/controller/productdetails_controller.dart';
import 'package:projct2/core/constant/color.dart';

class SubitemsList extends GetView<ProductDetailsControllerImp> {
  const SubitemsList({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        ...List.generate(
          controller.subitems.length,
          (index) => Container(
            margin: const EdgeInsets.only(right: 10),
            alignment: Alignment.center,
            padding: const EdgeInsets.only(bottom: 5),
            height: 60,
            width: 90,
            decoration: BoxDecoration(
                color: controller.subitems[index]['active'] == "1"
                    ? Color.fromARGB(255, 40, 60, 143)
                    : Colors.white,
                border: Border.all(color: Color.fromARGB(255, 0, 2, 10)),
                borderRadius: BorderRadius.circular(10)),
            child: Text(controller.subitems[index]['name'],
                style: TextStyle(
                    color: controller.subitems[index]['active'] == "1"
                        ? Colors.white
                        : AppColor.grey,
                    fontWeight: FontWeight.bold)),
          ),
        )
      ],
    );
  }
}
