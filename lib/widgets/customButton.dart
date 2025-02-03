import 'package:auth_ui/Constants/colors.dart';
import 'package:flutter/material.dart';

class CustomButton extends StatelessWidget {
  const CustomButton({
    super.key, required this.text, required this.onTap,
  });
final String text;
final Function() onTap;
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap:onTap,
      child: Container(
        alignment: Alignment.center,
        width: width(context) * 0.87,
        height: 50,
        decoration: BoxDecoration(
            color: primaryColor, borderRadius: BorderRadius.circular(20)),
        child: Text(
          text,
          style: TextStyle(
              color: Colors.white, fontSize: 20, fontWeight: FontWeight.bold),
        ),
      ),
    );
  }
}
