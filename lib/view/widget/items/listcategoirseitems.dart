import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:projct2/controller/home_controller.dart';
import 'package:projct2/controller/items_controller.dart';
import 'package:projct2/core/constant/color.dart';
import 'package:projct2/data/model/categoriesmodel.dart';

class ListCategoriesItems extends GetView<ItemsControllerImp> {
  const ListCategoriesItems({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 100,
      child: ListView.separated(
        separatorBuilder: (context, index) => const SizedBox(width: 10),
        itemCount: controller.categories.length,
        scrollDirection: Axis.horizontal,
        itemBuilder: (context, index) {
          return Categories(
            i: index,
            categoriesModel:
                Categoriesmodel.fromJson(controller.categories[index]),
          );
        },
      ),
    );
  }
}

class Categories extends GetView<ItemsControllerImp> {
  final Categoriesmodel categoriesModel;
  final int? i;
  const Categories({Key? key, required this.categoriesModel, required this.i})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
        onTap: () {
          // controller.goToItems(controller.categories, i!);
          controller.changeCat(i!, categoriesModel.categorisId!);
        },
        child: Column(
          children: [
            GetBuilder<ItemsControllerImp>(
                builder: (controller) => Container(
                      padding:
                          const EdgeInsets.only(right: 10, left: 10, bottom: 5),
                      decoration: controller.selectedCat == i
                          ? const BoxDecoration(
                              border: Border(
                                  bottom: BorderSide(
                                      width: 3,
                                      color: Color.fromARGB(255, 0, 0, 0))))
                          : null,
                      child: Text(
                        "${categoriesModel.categorisName}",
                        style:
                            const TextStyle(fontSize: 20, color: AppColor.grey),
                      ),
                    ))
          ],
        ));
  }
}
