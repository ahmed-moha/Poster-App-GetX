import 'package:flutter/material.dart';

class CustomTextField extends StatelessWidget {
  const CustomTextField({
    Key? key,
    required this.label,
    this.isObscureText = false,
    this.controller,
    this.validator,
    required this.prefixIcon,
    this.suffixIcon,
  }) : super(key: key);
  final String? label;
  final bool isObscureText;
  final TextEditingController? controller;
  final String? Function(String?)? validator;
  final Widget prefixIcon;
  final Widget? suffixIcon;
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(left: 30, right: 30),
      child: TextFormField(
        validator: validator,
        controller: controller,
        obscureText: isObscureText,
        decoration: InputDecoration(
            labelText: label ?? "Username",
            prefixIcon: prefixIcon,
            suffixIcon: suffixIcon),
      ),
    );
  }
}
