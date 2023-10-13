
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class MiniItem extends StatelessWidget {
  const MiniItem({super.key, required this.icono, this.accion=null});
  final IconData icono;
  final Function? accion;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: (){
        if(accion !=null){
          accion!();
        }
      },
      child: Container(
        width: 30,
        color: Colors.black,
        child: Padding(
          padding: const EdgeInsets.only(right: 5, top: 3, bottom: 5, left: 4),
          child: Icon(icono, color: Theme.of(context).secondaryHeaderColor, size: 12),
        ),
      ),
    );
  }
}
