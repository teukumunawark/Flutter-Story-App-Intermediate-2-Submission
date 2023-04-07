import 'package:flutter/material.dart';

import '../utils/constants.dart';

class CustomeTextField extends StatelessWidget {
  const CustomeTextField({
    Key? key,
    required this.labelText,
    required this.prefixIcon,
    required this.controller,
    this.suffixIcon,
    this.obscureText = false,
  }) : super(key: key);

  final String labelText;
  final Widget prefixIcon;
  final Widget? suffixIcon;
  final bool obscureText;
  final TextEditingController controller;

  @override
  Widget build(BuildContext context) {
    return TextField(
      obscureText: obscureText,
      controller: controller,
      decoration: InputDecoration(
        labelText: labelText,
        hintStyle: kBodyText,
        prefixIcon: prefixIcon,
        suffixIcon: suffixIcon,
        labelStyle: kBodyText.copyWith(fontSize: 16),
        prefixIconConstraints: const BoxConstraints(minWidth: 60),
        suffixIconConstraints: const BoxConstraints(minWidth: 60),
        enabledBorder: OutlineInputBorder(
          borderSide: const BorderSide(width: 2, color: kSecondery),
          borderRadius: BorderRadius.circular(8),
        ),
        focusedBorder: OutlineInputBorder(
          borderSide: const BorderSide(width: 2, color: kPrimary),
          borderRadius: BorderRadius.circular(50),
        ),
      ),
    );
  }
}

class MultiTextField extends StatelessWidget {
  const MultiTextField({
    Key? key,
    required this.controller,
  }) : super(key: key);

  final TextEditingController controller;

  @override
  Widget build(BuildContext context) {
    return TextField(
      controller: controller,
      keyboardType: TextInputType.multiline,
      maxLines: 5,
      decoration: InputDecoration(
        hintText: "Description",
        hintStyle: kBodyText,
        labelStyle: kBodyText.copyWith(fontSize: 16),
        enabledBorder: OutlineInputBorder(
          borderSide: const BorderSide(width: 2, color: kSecondery),
          borderRadius: BorderRadius.circular(8),
        ),
        focusedBorder: OutlineInputBorder(
          borderSide: const BorderSide(width: 2, color: kPrimary),
          borderRadius: BorderRadius.circular(10),
        ),
      ),
    );
  }
}
