import 'package:flutter/material.dart';

class BytebankTextField extends StatelessWidget {
  final String labelText;
  final TextInputType inputType;
  final TextEditingController controller;

  const BytebankTextField({
    Key? key,
    required this.labelText,
    required this.inputType,
    required this.controller,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextField(
      controller: controller,
      keyboardType: inputType,
      decoration: InputDecoration(
        labelText: labelText,
        focusedBorder: OutlineInputBorder(
          borderSide: BorderSide(
            color: Theme.of(context).primaryColor,
          ),
        ),
      ),
      style: TextStyle(
        fontSize: 24.0,
      ),
    );
  }
}
