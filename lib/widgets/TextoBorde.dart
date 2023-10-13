import 'package:flutter/material.dart';

import '../temas/tema.dart';

class TextoBorde extends StatelessWidget {
  const TextoBorde({super.key, required this.label, this.color=null});
  final String label;
  final Color? color;
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(5),
        color: Colors.black,
        child: Text(
          label,
          style: Tema.cardText.copyWith(
            color: color??Colors.white
          ),
        ));
  }
}
