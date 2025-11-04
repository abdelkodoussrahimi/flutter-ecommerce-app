import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:get/get.dart';
import 'package:projct2/controller/auth/login_controller.dart';
import 'package:projct2/core/class/statusrequest.dart';
import 'package:projct2/view/widget/auth/customtextformauth.dart';
import 'package:rive/rive.dart';
import '../../../core/functions/validinput.dart';
import '../../widget/auth/custombuttonauth.dart';
import '../../widget/auth/customtextbodyauth.dart';
import '../../../core/class/animation_enum.dart';
import '../../widget/auth/textsignup.dart';

class Login extends StatefulWidget {
  const Login({super.key});

  @override
  State<Login> createState() => _LoginState();
}

class _LoginState extends State<Login> {
  Artboard? riveArtboard;
  late RiveAnimationController controllerIdle;
  late RiveAnimationController controllerHandsUp;
  late RiveAnimationController controllerHandsDown;
  late RiveAnimationController controllerLookLeft;
  late RiveAnimationController controllerLookRight;
  late RiveAnimationController controllerSuccess;
  late RiveAnimationController controllerFail;

  final GlobalKey<FormState> formKey = GlobalKey<FormState>();
  LoginControllerImp controller = Get.put(LoginControllerImp());

  String testEmail = "omar@gmail.com";
  String testPassword = "123456";
  final passwordFocusNode = FocusNode();

  bool isLookingLeft = false;
  bool isLookingRight = false;

  void removeAllControllers() {
    riveArtboard?.artboard.removeController(controllerIdle);
    riveArtboard?.artboard.removeController(controllerHandsUp);
    riveArtboard?.artboard.removeController(controllerHandsDown);
    riveArtboard?.artboard.removeController(controllerLookLeft);
    riveArtboard?.artboard.removeController(controllerLookRight);
    riveArtboard?.artboard.removeController(controllerSuccess);
    riveArtboard?.artboard.removeController(controllerFail);
    isLookingLeft = false;
    isLookingRight = false;
  }

  void addIdleController() {
    removeAllControllers();
    riveArtboard?.artboard.addController(controllerIdle);
    debugPrint("idleee");
  }

  void addHandsUpController() {
    removeAllControllers();
    riveArtboard?.artboard.addController(controllerHandsUp);
    debugPrint("hands up");
  }

  void addHandsDownController() {
    removeAllControllers();
    riveArtboard?.artboard.addController(controllerHandsDown);
    debugPrint("hands down");
  }

  void addSuccessController() {
    removeAllControllers();
    riveArtboard?.artboard.addController(controllerSuccess);
    debugPrint("Success");
  }

  void addFailController() {
    removeAllControllers();
    riveArtboard?.artboard.addController(controllerFail);
    debugPrint("Faillll");
  }

  void addLookRightController() {
    removeAllControllers();
    isLookingRight = true;
    riveArtboard?.artboard.addController(controllerLookRight);
    debugPrint("Righttt");
  }

  void addLookLeftController() {
    removeAllControllers();
    isLookingLeft = true;
    riveArtboard?.artboard.addController(controllerLookLeft);
    debugPrint("Leftttttt");
  }

  void checkForPasswordFocusNodeToChangeAnimationState() {
    passwordFocusNode.addListener(() {
      if (passwordFocusNode.hasFocus) {
        addHandsUpController();
      } else if (!passwordFocusNode.hasFocus) {
        addHandsDownController();
      }
    });
  }

  @override
  void initState() {
    super.initState();
    controllerIdle = SimpleAnimation(AnimationEnum.idle.name);
    controllerHandsUp = SimpleAnimation(AnimationEnum.hands_up.name);
    controllerHandsDown = SimpleAnimation(AnimationEnum.hands_down.name);
    controllerLookRight = SimpleAnimation(AnimationEnum.Look_down_right.name);
    controllerLookLeft = SimpleAnimation(AnimationEnum.Look_down_left.name);
    controllerSuccess = SimpleAnimation(AnimationEnum.success.name);
    controllerFail = SimpleAnimation(AnimationEnum.fail.name);

    rootBundle.load('assets/images/login_screen_character.riv').then((data) {
      final file = RiveFile.import(data);
      final artboard = file.mainArtboard;
      artboard.addController(controllerIdle);
      setState(() {
        riveArtboard = artboard;
      });
    });

    checkForPasswordFocusNodeToChangeAnimationState();
  }

  void validateEmailAndPassword() {
    Future.delayed(const Duration(seconds: 1), () {
      if (formKey.currentState!.validate()) {
        addSuccessController();
      } else {
        addFailController();
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    Get.put(LoginControllerImp());
    return Scaffold(
        backgroundColor: const Color.fromRGBO(214, 223, 234, 1),
        appBar: AppBar(
          centerTitle: true,
          backgroundColor: const Color.fromRGBO(214, 223, 234, 1),
          elevation: 0.0,
          title: const Text(
            'Sign In',
            style: TextStyle(color: Colors.black),
          ),
        ),
        body: GetBuilder<LoginControllerImp>(
          builder: (controller) => controller.statusRequest ==
                  StatusRequest.loading
              ? const Center(
                  child: Text("loading.."),
                )
              : Padding(
                  padding: EdgeInsets.symmetric(
                      horizontal: MediaQuery.of(context).size.width / 20),
                  child: Form(
                    child: SingleChildScrollView(
                      child: Column(
                        children: [
                          const CustomTextBodyAuth(
                              text:
                                  "Sign In With Your Email And Password OR Continue With Social Media"),
                          SizedBox(
                            height: MediaQuery.of(context).size.height / 3,
                            child: riveArtboard == null
                                ? const SizedBox.shrink()
                                : Rive(
                                    artboard: riveArtboard!,
                                  ),
                          ),
                          Form(
                            key: controller.formstate,
                            child: Column(
                              children: [
                                CustomTextFormAuth(
                                  isNumber: false,
                                  valid: (val) {
                                    return validInput(val!, 5, 100, "email");
                                  },
                                  onchanged: (value) {
                                    if (value.isNotEmpty &&
                                        value.length < 16 &&
                                        !isLookingLeft) {
                                      addLookLeftController();
                                    } else if (value.isNotEmpty &&
                                        value.length > 16 &&
                                        !isLookingRight) {
                                      addLookRightController();
                                    }
                                  },
                                  mycontroller: controller.email,
                                  hinttext: "Enter Your Email",
                                  iconData: Icons.email_outlined,
                                  labeltext: "Email",
                                ),
                                GetBuilder<LoginControllerImp>(
                                  builder: (controller) => CustomTextFormAuth(
                                    obscureText: controller.isshowpassword,
                                    onTapIcon: () {
                                      controller.showPassword();
                                    },
                                    focusnode: passwordFocusNode,
                                    isNumber: false,
                                    valid: (val) {
                                      return validInput(
                                          val!, 5, 30, "password");
                                    },
                                    mycontroller: controller.password,
                                    hinttext: "Enter Your Password",
                                    iconData: Icons.lock_outlined,
                                    labeltext: "Password",
                                  ),
                                ),
                                InkWell(
                                  onTap: () {
                                    controller.goToForgetPassword();
                                  },
                                  child: const Text(
                                    "Forget Password",
                                    textAlign: TextAlign.right,
                                  ),
                                ),
                                CustomButtomAuth(
                                    text: "Sign In",
                                    onPressed: () {
                                      controller.Login();
                                      passwordFocusNode.unfocus();
                                    }),
                                const SizedBox(height: 40),
                                CustomTextSignUpOrSignIn(
                                  textone: "Don't have an account ? ",
                                  texttwo: "SignUp",
                                  onTap: () {
                                    controller.goToSignUp();
                                  },
                                )
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
        ));
  }
}
