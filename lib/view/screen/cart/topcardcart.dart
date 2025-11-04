import 'package:flutter/material.dart';
import 'package:projct2/core/constant/color.dart';

class TopCardCart extends StatelessWidget {
  final String message;
  const TopCardCart({Key? key, required this.message}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.only(bottom: 0),
      margin: const EdgeInsets.symmetric(horizontal: 20),
      height: 30,
      decoration: BoxDecoration(
        color: const Color.fromARGB(255, 216, 216, 216),
        borderRadius: BorderRadius.circular(10),
      ),
      child: Text(message,
          textAlign: TextAlign.center,
          style: const TextStyle(
              color: Color.fromARGB(255, 0, 0, 0), fontSize: 20)),
    );
  }
}
