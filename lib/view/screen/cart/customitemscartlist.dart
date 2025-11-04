import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:projct2/core/constant/color.dart';
import 'package:projct2/linkapi.dart';

class CustomItemsCartList extends StatelessWidget {
  final String name;
  final String price;
  final String count;
  final String imagename;
  final void Function()? onAdd;
  final void Function()? onRemove;
  const CustomItemsCartList({
    Key? key,
    required this.name,
    required this.price,
    required this.count,
    required this.imagename,
    required this.onAdd,
    required this.onRemove,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Row(children: [
        Expanded(
            flex: 2,
            child: CachedNetworkImage(
              imageUrl: "${AppLink.imagestItems}/$imagename",
              height: 80,
            )),
        Expanded(
            flex: 3,
            child: ListTile(
              title: Text(name, style: const TextStyle(fontSize: 15)),
              subtitle: Text(price,
                  style: const TextStyle(
                      fontWeight: FontWeight.bold,
                      color: Color.fromARGB(255, 255, 38, 0),
                      fontSize: 17)),
            )),
        Expanded(
            child: Column(
          children: [
            SizedBox(
                height: 35,
                child: CircleAvatar(
                    radius: 20,
                    backgroundColor: Colors.amber, //<-- SEE HERE
                    child: IconButton(
                        color: Colors.black,
                        onPressed: onAdd,
                        icon: const Icon(Icons.add)))),
            SizedBox(
                height: 30,
                child: Text(
                  count,
                  style: const TextStyle(fontSize: 23, fontFamily: "sans"),
                )),
            SizedBox(
                height: 35,
                child: CircleAvatar(
                    radius: 20,
                    backgroundColor: Colors.amber, //<-- SEE HERE
                    child: IconButton(
                        color: Colors.black,
                        onPressed: onRemove,
                        icon: const Icon(Icons.remove))))
          ],
        ))
      ]),
    );
  }
}
