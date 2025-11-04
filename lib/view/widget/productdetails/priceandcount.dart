import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:projct2/core/constant/color.dart';

class PriceAndCountItems extends StatelessWidget {
  final void Function()? onAdd;
  final void Function()? onRemove;
  final String price;
  final String count;
  const PriceAndCountItems(
      {Key? key,
      required this.onAdd,
      required this.onRemove,
      required this.price,
      required this.count})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Row(
          children: [
            CircleAvatar(
                radius: 20,
                backgroundColor: Colors.amber, //<-- SEE HERE
                child: IconButton(
                    color: Colors.black,
                    onPressed: onAdd,
                    icon: const Icon(Icons.add))),
            Container(
                alignment: Alignment.center,
                margin: const EdgeInsets.all(5),
                padding: const EdgeInsets.only(bottom: 2),
                width: 50,
                // height: 30,
                decoration:
                    BoxDecoration(border: Border.all(color: Colors.black)),
                child: Text(
                  count,
                  style: const TextStyle(
                      fontWeight: FontWeight.bold, fontSize: 20, height: 1.1),
                )),
            CircleAvatar(
                radius: 20,
                backgroundColor: Colors.amber, //<-- SEE HERE
                child: IconButton(
                    color: Colors.black,
                    onPressed: onRemove,
                    icon: const Icon(Icons.remove))),
          ],
        ),
        const Spacer(),
        Text(
          "$price \DH",
          style: const TextStyle(
              color: Color.fromARGB(255, 255, 38, 0),
              fontSize: 30,
              fontWeight: FontWeight.bold,
              height: 1.1),
        )
      ],
    );
  }
}
