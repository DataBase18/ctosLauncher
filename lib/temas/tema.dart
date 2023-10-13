import 'package:flutter/material.dart';

class Tema {
  static ThemeData tema = ThemeData(
    primaryColor: const Color(0xFF111E26),
    secondaryHeaderColor: const Color(0xFF66F2F2),
    disabledColor: const Color(0xFFB3B2B4),
    cardTheme: const CardTheme (
      color:  Color(0xFF3B3B3E ),
    ),
  );

  static const TextStyle cardText =  TextStyle(
      color: Colors.white
  );
}