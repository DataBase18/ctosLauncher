import 'package:ctoslauncher/widgets/widgets.dart';
import 'package:flutter/material.dart';

import '../../temas/tema.dart';

class Notificaciones extends StatelessWidget {
  const Notificaciones({super.key});

  @override
  Widget build(BuildContext context) {
    final ancho = MediaQuery.of(context).size.width;
    final alto = MediaQuery.of(context).size.height;
    return Padding(
      padding:
          EdgeInsets.symmetric(horizontal: ancho * 0.05, vertical: alto * 0.05),
      child: Column(
        children: [
          const Text( "Ultimas Notificaiones",  style: Tema.title,  ),
          SizedBox(
            height: alto * 0.02,
          ),
          Container(
            color: Colors.black12,
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                    decoration: BoxDecoration(
                        border: Border.all(
                            color: Theme.of(context).secondaryHeaderColor,
                            width: 0.4)),
                    width: ancho * 0.2,
                    height: alto * 0.11,
                    child:  Icon(
                      Icons.photo,
                      color: Colors.white,
                    )),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    TextoBorde(label: "Watsapp"),
                    TextoBorde(label: "com.whatsapp.meta"),
                    Row(
                      children: [
                        TextoBorde(label: "La superFamilia: "),
                        TextoBorde(label: "Por la 22 calle", color: Theme.of(context).secondaryHeaderColor,),
                      ],
                    ),
                    TextoBorde(label: "Hace 21 minutos"),
                  ],
                )
              ],
            ),
          )
        ],
      ),
    );
  }
}
