import 'package:flutter/material.dart';

class TituloWidget extends StatelessWidget {
  const TituloWidget({super.key, required this.mensaje});

  final String mensaje;

  @override
  Widget build(BuildContext context) {
    return Text(
      mensaje,
      style: const TextStyle(
          color: Colors.lightGreen, fontSize: 40, fontWeight: FontWeight.bold),
    );
  }
}
