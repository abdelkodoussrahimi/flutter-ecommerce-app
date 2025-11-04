import 'package:flutter/material.dart';
import 'package:projct2/core/constant/color.dart';

class CardPaymentMethodCheckout extends StatelessWidget {
  final String title;
  final bool isActive;
  const CardPaymentMethodCheckout(
      {Key? key, required this.title, required this.isActive})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 10),
      padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
      decoration: BoxDecoration(
          color: isActive == true
              ? const Color.fromARGB(255, 255, 38, 0)
              : const Color.fromARGB(255, 250, 250, 250),
          borderRadius: BorderRadius.circular(20)),
      child: Text(title,
          style: TextStyle(
              color: isActive == true ? Colors.white : AppColor.secoundColor,
              height: 1,
              fontWeight: FontWeight.bold)),
    );
  }
}
