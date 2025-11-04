import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:projct2/controller/favorite_controller.dart';
import 'package:projct2/core/class/handlingdataview.dart';
import 'package:projct2/core/constant/routes.dart';
import 'package:projct2/data/model/itemsmodel.dart';
import 'package:projct2/view/screen/auth/home.dart';
import 'package:projct2/view/screen/cart/appbarcart.dart';
import 'package:projct2/view/widget/customappbar.dart';
import 'package:projct2/view/widget/items/customlistitems.dart';

import '../../../controller/items_controller.dart';
import '../../widget/items/listcategoirseitems.dart';

class Items extends StatelessWidget {
  const Items({super.key});

  @override
  Widget build(BuildContext context) {
    ItemsControllerImp controller = Get.put(ItemsControllerImp());
    FavoriteController controllerFav = Get.put(FavoriteController());

    return Scaffold(
        body: Container(
            padding: const EdgeInsets.all(15),
            child: ListView(children: [
              const TopAppbarCart(
                title: 'Items',
              ),
              CustomAppBar(
                mycontroller: controller.search!,
                titleappbar: "Find Product",
                onPressedSearch: () {
                  controller.onSearchItems();
                },
                onChanged: (val) {
                  controller.checkSearch(val);
                },
                onPressedIconFavorite: () {
                  Get.toNamed(AppRoute.myfavroite);
                },
              ),
              const SizedBox(height: 10),
              const ListCategoriesItems(),
              GetBuilder<ItemsControllerImp>(
                  builder: (controller) => HandlingDataView(
                      statusRequest: controller.statusRequest,
                      widget: !controller.isSearch
                          ? GridView.builder(
                              shrinkWrap: true,
                              physics: NeverScrollableScrollPhysics(),
                              itemCount: controller.data.length,
                              gridDelegate:
                                  const SliverGridDelegateWithFixedCrossAxisCount(
                                      crossAxisCount: 2, childAspectRatio: 0.7),
                              itemBuilder: (BuildContext context, index) {
                                controllerFav.isFavorite[controller.data[index]
                                        ['items_id']] =
                                    controller.data[index]['favorite'];
                                return CustomListItems(
                                    //active: false,
                                    itemsModel: ItemsModel.fromJson(
                                        controller.data[index]));
                              })
                          : ListItemsSearch(
                              listdatamodel: controller.listdata)))
            ])));
  }
}
