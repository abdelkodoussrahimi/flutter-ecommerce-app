import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:projct2/core/class/statusrequest.dart';

import '../../../../controller/forgetpassword/forgetpassword_controller.dart';
import '../../../../core/constant/color.dart';
import '../../../widget/auth/custombuttonauth.dart';
import '../../../widget/auth/customtextbodyauth.dart';
import '../../../widget/auth/customtextformauth.dart';
import '../../../widget/auth/customtexttitleauth.dart';

class ForgetPassword extends StatelessWidget {
  const ForgetPassword({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Get.put(ForgetPasswordControllerImp());
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        backgroundColor: const Color.fromRGBO(214, 223, 234, 1),
        elevation: 0.0,
        title: const Text(
          'Forget Password',
          style: TextStyle(color: Color.fromARGB(255, 9, 86, 175)),
        ),
      ),
      body: GetBuilder<ForgetPasswordControllerImp>(
        builder: (controller) => controller.statusRequest ==
                StatusRequest.loading
            ? const Center(
                child: Text("Loading ..."),
              )
            : Container(
                padding:
                    const EdgeInsets.symmetric(vertical: 15, horizontal: 30),
                child: Form(
                  key: controller.formstate,
                  child: ListView(children: [
                    const SizedBox(height: 2),
                    const CustomTextTitleAuth(text: "Check Eamil"),
                    const SizedBox(height: 10),
                    const CustomTextBodyAuth(
                        // please Enter Your Email Address To Recive A verification code
                        text:
                            "please Enter Your Email Address To Recive A verification code"),
                    const SizedBox(height: 15),
                    CustomTextFormAuth(
                      isNumber: false,

                      mycontroller: controller.email,

                      valid: (val) {
                        return null;
                      },
                      hinttext: "Enter Your Email",
                      iconData: Icons.email_outlined,
                      labeltext: "Email",
                      // mycontroller: ,
                    ),
                    CustomButtomAuth(
                        text: "Check",
                        onPressed: () {
                          controller.checkemail();
                        }),
                    const SizedBox(height: 40),
                  ]),
                ),
              ),
      ),
    );
  }
}
