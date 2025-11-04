import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:projct2/controller/onboarding_controller.dart';
import 'package:projct2/view/widget/onboarding/custombutton.dart';
import 'package:projct2/view/widget/onboarding/customslider.dart';
import 'package:projct2/view/widget/onboarding/dotcontroller.dart';

class Onboarding extends StatelessWidget {
  const Onboarding({super.key});

  @override
  Widget build(BuildContext context) {
    Get.put(OnBoardingControllerImp());
    return Scaffold(
        backgroundColor: Colors.white,
        body: SafeArea(
          child: Column(children: [
            const Expanded(
              flex: 4,
              child: CustomSliderOnBoarding(),
            ),
            Expanded(
                flex: 1,
                child: Column(
                  children: const [
                    CustomDotControllerOnBoarding(),
                    Spacer(flex: 2),
                    CustomButtonOnBoarding()
                  ],
                ))
          ]),
        ));
  }
}
