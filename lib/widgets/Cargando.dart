
import 'package:flutter/material.dart';

class Cargando extends StatelessWidget {
  const Cargando({super.key, this.grosor = 2 });
  final double? grosor ;
  @override
  Widget build(BuildContext context) {
    return Center(
      child: CircularProgressIndicator(color: Theme.of(context).secondaryHeaderColor, strokeWidth: grosor!, ),
    );
  }
}
