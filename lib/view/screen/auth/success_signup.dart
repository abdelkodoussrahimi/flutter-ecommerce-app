import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:projct2/view/screen/auth/tt.dart';
import 'package:projct2/view/widget/auth/custombuttonauth.dart';

import '../../../controller/auth/successsignup_controller.dart';
import '../../../core/constant/color.dart';

class SuccessSignUp extends StatelessWidget {
  const SuccessSignUp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Get.put(SuccessSignUpControllerImp());
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        backgroundColor: AppColor.backgroundcolor,
        elevation: 0.0,
        title: Text('32'.tr,
            style: Theme.of(context)
                .textTheme
                .headline1!
                .copyWith(color: AppColor.grey)),
      ),
      body: Container(
        padding: const EdgeInsets.all(15),
        child: Column(children: [
          const Center(
              child: Icon(
            Icons.check_circle_outline,
            size: 200,
            color: AppColor.primaryColor,
          )),
          Text("37".tr,
              style: Theme.of(context)
                  .textTheme
                  .headline1!
                  .copyWith(fontSize: 30)),
          Text("38".tr),
          const Spacer(),
          Expanded(
              child: SingleChildScrollView(
            child: Column(
              children: const [loginn()],
            ),
          ))
        ]),
      ),
    );
  }
}
