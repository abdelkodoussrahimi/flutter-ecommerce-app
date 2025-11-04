import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:projct2/core/class/statusrequest.dart';
import 'package:projct2/core/constant/color.dart';
import 'package:projct2/view/widget/auth/custombuttonauth.dart';

import '../../../../controller/forgetpassword/resetpassword_controller.dart';
import '../../../../core/functions/validinput.dart';
import '../../../widget/auth/customtextbodyauth.dart';
import '../../../widget/auth/customtextformauth.dart';
import '../../../widget/auth/customtexttitleauth.dart';

class ResetPassword extends StatelessWidget {
  const ResetPassword({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Get.put(ResetPasswordControllerImp());
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        backgroundColor: const Color.fromRGBO(214, 223, 234, 1),
        elevation: 0.0,
        title: const Text(
          'ResetPassword',
          style: TextStyle(color: Color.fromARGB(255, 9, 86, 175)),
        ),
      ),
      body: GetBuilder<ResetPasswordControllerImp>(
        builder: (controller) => controller.statusRequest ==
                StatusRequest.loading
            ? const Center(child: Text("Loading..."))
            : Container(
                padding:
                    const EdgeInsets.symmetric(vertical: 15, horizontal: 30),
                child: Form(
                  key: controller.formstate,
                  child: ListView(children: [
                    const SizedBox(height: 20),
                    const CustomTextTitleAuth(text: "New Password"),
                    const SizedBox(height: 10),
                    const SizedBox(height: 15),
                    CustomTextFormAuth(
                      isNumber: false,

                      mycontroller: controller.password,
                      valid: (val) {
                        return validInput(val!, 3, 40, "password");
                      },
                      hinttext: "Enter Your Password",
                      iconData: Icons.lock_outline,
                      labeltext: "Password",
                      // mycontroller: ,
                    ),
                    CustomTextFormAuth(
                      isNumber: false,

                      valid: (val) {
                        return validInput(val!, 3, 40, "password");
                      },
                      mycontroller: controller.repassword,
                      hinttext: "Re" "Enter Your Password",
                      iconData: Icons.lock_outline,
                      labeltext: "Password",
                      // mycontroller: ,
                    ),
                    CustomButtomAuth(
                        text: "Success",
                        onPressed: () {
                          controller.goToSuccessResetPassword();
                        }),
                    const SizedBox(height: 30),
                  ]),
                ),
              ),
      ),
    );
  }
}
