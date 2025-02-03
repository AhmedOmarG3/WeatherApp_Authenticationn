import 'package:auth_ui/constants/colors.dart';
import 'package:flutter/material.dart';

class CustomTextField extends StatelessWidget {
  const CustomTextField({
    super.key,
    required this.hintTitle,
    this.onchanged,
    this.obscureText = false,  this.controller, this.KeyboardType, this.validetor, // default to false for easier control
  });
  final TextInputType? KeyboardType;
  final TextEditingController? controller;
  final String hintTitle;
  final ValueChanged<String>? onchanged;
  final bool obscureText;
final FormFieldValidator<String>? validetor;
  @override
  Widget build(BuildContext context) {
    return TextFormField(validator:validetor ,
      keyboardType: KeyboardType,
      controller: controller,
      obscureText: obscureText, // Use the passed value for obscureText
      onChanged: onchanged,
      decoration: InputDecoration(
        hintText: hintTitle,
        hintStyle: TextStyle(color: primaryColor),
        filled: true,
        fillColor: primaryColor.withOpacity(0.2),
        border: OutlineInputBorder(
          borderSide: BorderSide.none,
          borderRadius: BorderRadius.circular(20),
        ),
      ),
    );
  }
}
