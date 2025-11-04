import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:projct2/controller/home_controller.dart';

import 'package:projct2/data/model/categoriesmodel.dart';
import 'package:projct2/linkapi.dart';

class ListCategoriesHome extends GetView<HomeControllerImp> {
  const ListCategoriesHome({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 150,
      child: ListView.separated(
        separatorBuilder: (context, index) => const SizedBox(width: 10),
        itemCount: controller.categories.length,
        scrollDirection: Axis.horizontal,
        itemBuilder: (context, index) {
          return Categories(
            i: index,
            categoriesmodel:
                Categoriesmodel.fromJson(controller.categories[index]),
          );
        },
      ),
    );
  }
}

class Categories extends GetView<HomeControllerImp> {
  final Categoriesmodel categoriesmodel;
  final int? i;

  const Categories({Key? key, required this.categoriesmodel, required this.i})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        controller.goToItems(
            controller.categories, i!, categoriesmodel.categorisId!);
      },
      child: Column(
        children: [
          Container(
            decoration: BoxDecoration(
                color: Color.fromARGB(255, 255, 255, 255),
                borderRadius: BorderRadius.circular(50)),
            padding: const EdgeInsets.symmetric(horizontal: 10),
            height: 130,
            width: 130,
            child: Image.network(
                "${AppLink.imagestCategories}/${categoriesmodel.categorisImage}"),
          ),
          Text(
            "${categoriesmodel.categorisName}",
            style: const TextStyle(
                fontSize: 16, color: Color.fromARGB(255, 0, 0, 0)),
          )
        ],
      ),
    );
  }
}
