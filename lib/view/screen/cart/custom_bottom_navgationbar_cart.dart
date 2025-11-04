// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:projct2/controller/cart_controller.dart';
import 'package:projct2/core/constant/color.dart';
import 'package:projct2/view/screen/cart/buttoncart.dart';
import 'package:projct2/view/screen/cart/custombuttoncoupon.dart';

class BottomNavgationBarCart extends GetView<CartController> {
  final String price;
  final String shipping;
  final String discount;

  final String totalprice;
  final TextEditingController controllercoupon;
  final void Function()? onApplyCoupon;
  const BottomNavgationBarCart(
      {Key? key,
      required this.price,
      required this.shipping,
      required this.totalprice,
      required this.controllercoupon,
      this.onApplyCoupon,
      required this.discount})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
        child: Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        GetBuilder<CartController>(
            builder: (controller) => controller.couponname == null
                ? Container(
                    padding: EdgeInsets.symmetric(horizontal: 10),
                    child: Row(children: [
                      Expanded(
                          flex: 2,
                          child: TextFormField(
                            controller: controllercoupon,
                            decoration: InputDecoration(
                                isDense: true,
                                contentPadding: EdgeInsets.symmetric(
                                    vertical: 8, horizontal: 10),
                                hintText: "Coupon Code",
                                border: OutlineInputBorder()),
                          )),
                      SizedBox(width: 5),
                      Expanded(
                          flex: 1,
                          child: CustomButtonCoupon(
                            textbutton: "apply",
                            onPressed: onApplyCoupon,
                          ))
                    ]))
                : Container(
                    child: Text(
                    "Coupon Code ${controller.couponname!}",
                    style: TextStyle(
                        color: Color.fromARGB(255, 255, 38, 0),
                        fontWeight: FontWeight.bold),
                  ))),
        Container(
          margin: EdgeInsets.all(10),
          padding: EdgeInsets.all(10),
          decoration: BoxDecoration(
              border: Border.all(color: Color.fromARGB(255, 0, 0, 0), width: 1),
              borderRadius: BorderRadius.circular(10)),
          child: Column(children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Container(
                    padding: EdgeInsets.symmetric(horizontal: 20),
                    child: Text("Price", style: TextStyle(fontSize: 16))),
                Container(
                    padding: EdgeInsets.symmetric(horizontal: 20),
                    child: Text("$price \DH", style: TextStyle(fontSize: 16)))
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Container(
                    padding: EdgeInsets.symmetric(horizontal: 20),
                    child: Text("Discount", style: TextStyle(fontSize: 16))),
                Container(
                    padding: EdgeInsets.symmetric(horizontal: 20),
                    child: Text("$discount ", style: TextStyle(fontSize: 16)))
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Container(
                    padding: EdgeInsets.symmetric(horizontal: 20),
                    child: Text("Shipping", style: TextStyle(fontSize: 16))),
                Container(
                    padding: EdgeInsets.symmetric(horizontal: 20),
                    child: Text("$shipping ", style: TextStyle(fontSize: 16)))
              ],
            ),
            Divider(),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Container(
                    padding: EdgeInsets.symmetric(horizontal: 20),
                    child: Text("Total Price",
                        style: TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.bold,
                            color: AppColor.secoundColor))),
                Container(
                    padding: EdgeInsets.symmetric(horizontal: 20),
                    child: Text("$totalprice \DH",
                        style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.bold,
                          color: Color.fromARGB(255, 255, 38, 0),
                        )))
              ],
            ),
          ]),
        ),
        SizedBox(height: 10),
        CustomButtonCart(
          textbutton: "Place Order",
          onPressed: () {
            controller.goToPageCheckout();
          },
        )
      ],
    ));
  }
}
