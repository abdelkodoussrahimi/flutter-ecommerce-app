import 'dart:io';

import 'package:awesome_dialog/awesome_dialog.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:projct2/controller/homescreen_controller.dart';
import 'package:projct2/core/constant/routes.dart';

import '../../widget/home/custombottomappbarhome.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Get.put(HomeScreenControllerImp());
    return GetBuilder<HomeScreenControllerImp>(
        builder: (controller) => Scaffold(
            floatingActionButton: FloatingActionButton(
                backgroundColor: Colors.amber,
                onPressed: () {
                  Get.toNamed(AppRoute.cart);
                },
                child: const Icon(Icons.shopping_basket_outlined)),
            floatingActionButtonLocation:
                FloatingActionButtonLocation.centerDocked,
            bottomNavigationBar: const CustomBottomAppBarHome(),
            body: WillPopScope(
                child: controller.listPage.elementAt(controller.currentpage),
                onWillPop: () {
                  AwesomeDialog(
                    context: context,
                    dialogType: DialogType.QUESTION,
                    animType: AnimType.RIGHSLIDE,
                    title: 'warning',
                    desc: ' Do You Want To Exit The app',
                    btnCancelOnPress: () {},
                    btnOkOnPress: () {
                      exit(0);
                    },
                  ).show();
                  return Future.value(false);
                })));
  }
}
