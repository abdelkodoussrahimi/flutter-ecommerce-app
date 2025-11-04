import 'package:flutter/material.dart';

class CustomTextFormAuth extends StatelessWidget {
  final String hinttext;
  final String labeltext;
  final IconData iconData;
  final bool isNumber;
  final bool? obscureText;
  final void Function()? onTapIcon;

  final String? Function(String?) valid;
  final Function(String)? onchanged;
  final FocusNode? focusnode;

  final TextEditingController? mycontroller;
  const CustomTextFormAuth({
    super.key,
    required this.hinttext,
    required this.labeltext,
    required this.iconData,
    required this.mycontroller,
    required this.valid,
    this.onchanged,
    this.focusnode,
    required this.isNumber,
    this.obscureText,
    this.onTapIcon,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(bottom: 20),
      child: TextFormField(
        keyboardType: isNumber
            ? const TextInputType.numberWithOptions(decimal: true)
            : TextInputType.text,
        controller: mycontroller,
        obscureText: obscureText == null || obscureText == false ? false : true,
        onChanged: onchanged,
        validator: valid,
        focusNode: focusnode,
        decoration: InputDecoration(
          hintText: hinttext,
          hintStyle: const TextStyle(fontSize: 14),
          floatingLabelBehavior: FloatingLabelBehavior.always,
          label: Container(
              margin: const EdgeInsets.symmetric(horizontal: 15),
              child: Text(labeltext)),
          suffixIcon: InkWell(onTap: onTapIcon, child: Icon(iconData)),
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(25.0),
          ),
        ),
      ),
    );
  }
}
