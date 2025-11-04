import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';

import 'package:projct2/controller/home_controller.dart';
import 'package:projct2/core/class/handlingdataview.dart';
import 'package:projct2/core/constant/color.dart';
import 'package:projct2/core/constant/routes.dart';
import 'package:projct2/data/model/itemsmodel.dart';
import 'package:projct2/linkapi.dart';
import 'package:projct2/view/widget/home/listcategorieshome.dart';
import 'package:projct2/view/widget/home/listpromotionhome.dart';

import '../../widget/customappbar.dart';
import '../../widget/home/customcardhome.dart';
import '../../widget/home/customtitlehome.dart';
import '../../widget/home/listitemshome.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    HomeControllerImp controller = Get.put(HomeControllerImp());

    return GetBuilder<HomeControllerImp>(
        builder: (controller) => Container(
            padding: const EdgeInsets.symmetric(horizontal: 15),
            child: ListView(
              scrollDirection: Axis.vertical,
              children: [
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
                HandlingDataView(
                    statusRequest: controller.statusRequest,
                    widget: !controller.isSearch
                        ? Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              if (controller.promotiondata.isNotEmpty)
                                /*CustomCardHome(
                                  title:
                                      "${controller.promotiondata[0]['promotion_titel']}",
                                  body:
                                      "${controller.promotiondata[0]['promotion_titelbody']}"),*/
                                const Listpromotionhome(),
                              const SizedBox(height: 10),
                              const Text("Categories ",
                                  style: TextStyle(
                                      fontSize: 20,
                                      color: Color.fromARGB(255, 49, 49, 49),
                                      fontWeight: FontWeight.bold)),
                              const SizedBox(height: 10),
                              const ListCategoriesHome(),
                              const CustomTitleHome(
                                  title: "All restaurants around you "),
                              const ListItemsHome(),
                            ],
                          )
                        : ListItemsSearch(listdatamodel: controller.listdata)),
              ],
            )));
  }
}

class ListItemsSearch extends GetView<HomeControllerImp> {
  final List<ItemsModel> listdatamodel;
  const ListItemsSearch({Key? key, required this.listdatamodel})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
        itemCount: listdatamodel.length,
        shrinkWrap: true,
        physics: const NeverScrollableScrollPhysics(),
        itemBuilder: (context, index) {
          return InkWell(
            onTap: () {
              controller.goToPageProductDetails(listdatamodel[index]);
            },
            child: Container(
              margin: const EdgeInsets.symmetric(vertical: 20),
              child: Card(
                  child: Container(
                padding: const EdgeInsets.all(10),
                child: Row(
                  children: [
                    Expanded(
                        child: CachedNetworkImage(
                            imageUrl:
                                "${AppLink.imagestItems}/${listdatamodel[index].itemsImage}")),
                    Expanded(
                        flex: 2,
                        child: ListTile(
                          title: Text(listdatamodel[index].itemsName!),
                          subtitle: Text(listdatamodel[index].categorisImage!),
                        )),
                  ],
                ),
              )),
            ),
          );
        });
  }
}
