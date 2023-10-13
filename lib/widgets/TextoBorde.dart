import 'package:flutter/material.dart';

import '../temas/tema.dart';

class TextoBorde extends StatelessWidget {
  const TextoBorde({super.key, required this.label});
  final String label;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(7),
        color: Colors.black,
        child: Text(
          label,
          style: Tema.cardText,
        ));
  }
}
