import 'package:flutter/material.dart';

class TextFieldKPU extends StatelessWidget {
  const TextFieldKPU(
      {super.key,
      required this.controller,
      required this.labelText,
      required this.hintText});
  final TextEditingController controller;
  final String labelText;
  final String hintText;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: controller,
      decoration: InputDecoration(
        labelText: labelText,
        hintText: hintText,
        contentPadding: const EdgeInsets.symmetric(horizontal: 10),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10),
        ),
      ),
    );
  }
}
