import 'package:auth_ui/Constants/colors.dart';
import 'package:flutter/material.dart';

class CustomCircle extends StatelessWidget {
  const CustomCircle({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 70,
      width: width(context),
      child: Stack(alignment: Alignment.topRight, children: [
        Positioned(
          right: 30,
          top: -30,
          child: Container(
            height: 60,
            width: 70,
            decoration: BoxDecoration(
                color: primaryColor.withOpacity(0.7), shape: BoxShape.circle),
          ),
        ),
      ]),
    );
  }
}
