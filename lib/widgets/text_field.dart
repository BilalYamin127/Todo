import 'package:flutter/material.dart';

class CustomTextFormFiled extends StatelessWidget {
  final TextEditingController controller;
  final String hintText;
  final String suffixText;
  final TextInputType keyboardType;
  final FormFieldValidator<String>? validator;
  final bool? obscureText;
  final bool? autofocus;

  const CustomTextFormFiled({
    this.obscureText,
    this.autofocus,
    super.key,
    required this.controller,
    this.hintText = 'john@gmail.com',
    this.suffixText = 'Email',
    this.keyboardType = TextInputType.emailAddress,
    this.validator,
  });

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      obscureText: obscureText ?? false,
      controller: controller,
      autofocus: autofocus ?? false,
      decoration: InputDecoration(
        hintText: hintText,
        border: OutlineInputBorder(
          borderSide: const BorderSide(color: Colors.black),
          borderRadius: BorderRadius.circular(8),
          gapPadding: 6.0,
        ),
        contentPadding:
            const EdgeInsets.symmetric(vertical: 10, horizontal: 12),
        suffixText: suffixText,
      ),
      validator: validator,
      keyboardType: keyboardType,
    );
  }
}
