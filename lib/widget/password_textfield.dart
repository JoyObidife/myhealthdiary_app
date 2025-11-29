import 'package:flutter/material.dart';
import 'package:myhealthdiary_app/widget/custom_textfield.dart';

class PasswordTextfield extends StatefulWidget {
  const PasswordTextfield({super.key, this.controller});
  final TextEditingController? controller;

  @override
  State<PasswordTextfield> createState() => _PasswordTextfieldState();
}

class _PasswordTextfieldState extends State<PasswordTextfield> {
  bool _hidePassword = true;
  @override
  Widget build(BuildContext context) {
    return CustomTextField(
      controller: widget.controller,
      label: "Password",
      obsecureText: _hidePassword,
      suffixIcon: IconButton(
        onPressed: () {
          setState(() {
            _hidePassword = !_hidePassword;
          });
        }, 
        icon: Icon(_hidePassword ? Icons.visibility_off : Icons.visibility),
      ),
    );
  }
}
