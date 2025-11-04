import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:projct2/view/widget/auth/custombuttonauth.dart';

import '../../../controller/auth/checkemail_controller.dart';
import '../../../core/constant/color.dart';
import '../../../core/functions/validinput.dart';
import '../../widget/auth/customtextbodyauth.dart';
import '../../widget/auth/customtextformauth.dart';
import '../../widget/auth/customtexttitleauth.dart';

class CheckEmail extends StatelessWidget {
  const CheckEmail({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    CheckEmailControllerImp controller = Get.put(CheckEmailControllerImp());
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        backgroundColor: AppColor.backgroundcolor,
        elevation: 0.0,
        title: Text('27'.tr,
            style: Theme.of(context)
                .textTheme
                .headline1!
                .copyWith(color: AppColor.grey)),
      ),
      body: Container(
        padding: const EdgeInsets.symmetric(vertical: 15, horizontal: 30),
        child: ListView(children: [
          const SizedBox(height: 20),
          CustomTextTitleAuth(text: "28".tr),
          const SizedBox(height: 10),
          CustomTextBodyAuth(text: "29".tr),
          const SizedBox(height: 15),
          CustomTextFormAuth(
            isNumber: false,

            valid: (val) {
              return validInput(val!, 3, 20, "email");
            },
            mycontroller: controller.email,
            hinttext: "12".tr,
            iconData: Icons.email_outlined,
            labeltext: "18".tr,
            // mycontroller: ,
          ),
          CustomButtomAuth(
              text: "30".tr,
              onPressed: () {
                controller.goToSuccessSignUp();
              }),
          const SizedBox(height: 40),
        ]),
      ),
    );
  }
}
