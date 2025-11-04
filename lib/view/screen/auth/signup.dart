import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:projct2/core/class/statusrequest.dart';

import 'package:projct2/view/widget/auth/customtextformauth.dart';
import '../../../controller/auth/signup_controller.dart';
import '../../../core/functions/validinput.dart';
import '../../widget/auth/custombuttonauth.dart';
import '../../widget/auth/customtextbodyauth.dart';
import '../../widget/auth/textsignup.dart';

class SignUp extends StatelessWidget {
  const SignUp({super.key});

  @override
  Widget build(BuildContext context) {
    Get.put(SignUpControllerImp());
    return Scaffold(
        backgroundColor: const Color.fromRGBO(214, 223, 234, 1),
        appBar: AppBar(
          centerTitle: true,
          backgroundColor: const Color.fromRGBO(214, 223, 234, 1),
          elevation: 0.0,
          title: const Text(
            'Sign Up',
            style: TextStyle(color: Colors.black),
          ),
        ),
        body: GetBuilder<SignUpControllerImp>(
          builder: (controller) =>
              controller.statusRequest == StatusRequest.loading
                  ? const Center(
                      child: Text("loading.."),
                    )
                  : Padding(
                      padding: EdgeInsets.symmetric(
                          horizontal: MediaQuery.of(context).size.width / 20),
                      child: Form(
                        key: controller.formstate,
                        child: SingleChildScrollView(
                          child: Column(
                            children: [
                              const CustomTextBodyAuth(
                                  text:
                                      "Sign In With Your Email And Password OR Continue With Social Media"),
                              const SizedBox(height: 15),
                              CustomTextFormAuth(
                                isNumber: false,
                                valid: (val) {
                                  return validInput(val!, 3, 20, "username");
                                },
                                mycontroller: controller.username,
                                hinttext: "Enter Your Username",
                                iconData: Icons.person_2_outlined,
                                labeltext: "Username",
                              ),
                              CustomTextFormAuth(
                                isNumber: false,
                                valid: (val) {
                                  return validInput(val!, 3, 40, "email");
                                },
                                mycontroller: controller.email,
                                hinttext: "Enter Your email",
                                iconData: Icons.email_outlined,
                                labeltext: "email",
                              ),
                              CustomTextFormAuth(
                                isNumber: true,
                                valid: (val) {
                                  return validInput(val!, 7, 11, "phone");
                                },
                                mycontroller: controller.phone,
                                hinttext: "Enter Your Phone",
                                iconData: Icons.phone_android_outlined,
                                labeltext: "Phone",
                              ),
                              GetBuilder<SignUpControllerImp>(
                                builder: (controller) => CustomTextFormAuth(
                                  obscureText: controller.isshowpassword,
                                  onTapIcon: () {
                                    controller.showPassword();
                                  },
                                  isNumber: false,
                                  valid: (val) {
                                    return validInput(val!, 3, 20, "password");
                                  },
                                  mycontroller: controller.password,
                                  hinttext: "Enter Your Password",
                                  iconData: Icons.lock_outlined,
                                  labeltext: "Password",
                                ),
                              ),
                              CustomButtomAuth(
                                  text: "Sign Up",
                                  onPressed: () {
                                    controller.signUp();
                                  }),
                              const SizedBox(height: 40),
                              CustomTextSignUpOrSignIn(
                                textone: " have an account ? ",
                                texttwo: " SignIn ",
                                onTap: () {
                                  controller.goToSignIn();
                                },
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
        ));
  }
}
