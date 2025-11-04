import 'package:flutter/material.dart';

class CustomTextTitleAuth extends StatelessWidget {
  final String text;

  const CustomTextTitleAuth({super.key, required this.text});

  @override
  Widget build(BuildContext context) {
    return Text(text,
        textAlign: TextAlign.center,
        style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 30));
  }
}
