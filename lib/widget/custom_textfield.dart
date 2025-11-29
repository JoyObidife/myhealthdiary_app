import 'package:flutter/material.dart';

class CustomTextField extends StatelessWidget {
  const CustomTextField({
    super.key,
    required this.label,
     this.controller,
     this.obsecureText = false,
     this.suffixIcon,
     this.textInputType = TextInputType.text,
  });
  final String label;
  final TextEditingController? controller;
  final bool obsecureText;
  final TextInputType textInputType;
  final Widget? suffixIcon;

  @override
  Widget build(BuildContext context) {
    return TextField(
      controller: controller,
      obscureText: obsecureText,
      keyboardType: textInputType,

      decoration: InputDecoration(
        suffixIcon: suffixIcon,
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(16),
          borderSide: BorderSide(color: Colors.black),
        ),
        labelText: label,
        labelStyle: TextStyle(color: Colors.black),
      ),
    );
  }
}
