
import 'package:flutter/material.dart';

class CardHomeModel {
  final String label;
  final IconData icono;
  final Future<bool>? validador;
  final Function? onTap;

  CardHomeModel({required this.label, required this.icono, this.validador, this.onTap});
}