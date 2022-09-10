import 'package:flutter/material.dart';

class FormWidget extends StatelessWidget {
  const FormWidget(
      {super.key,
      required this.label,
      this.obscure = false,
      required this.controllerText});

  final String label;
  final bool obscure;
  final TextEditingController controllerText;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 40, vertical: 10),
      child: TextField(
        
        controller: controllerText,
        obscureText: obscure,
        decoration: InputDecoration(
            border: const OutlineInputBorder(), 
            labelText: label
            ),
      ),
    );
  }
}