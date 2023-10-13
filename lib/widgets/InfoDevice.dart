

import 'package:ctoslauncher/widgets/widgets.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class InfoDevice extends StatelessWidget {
  const InfoDevice({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(children: [
          TextoBorde(label: "Ram utilizada:  ", color: Theme.of(context).secondaryHeaderColor,),
          TextoBorde(label: " 4GB / 8GB ")
        ],),
        Row(children: [
          TextoBorde(label: "Almacenamiento usado:  ", color: Theme.of(context).secondaryHeaderColor,),
          TextoBorde(label: " 4GB / 120 GB ")
        ],),
        Row(children: [
          TextoBorde(label: "Bateria:   ", color: Theme.of(context).secondaryHeaderColor,),
          TextoBorde(label: " 45 % ")
        ],),
        Row(children: [
          TextoBorde(label: "Host: ", color: Theme.of(context).secondaryHeaderColor,),
          TextoBorde(label: "Abner")
        ],),
        Row(children: [
          TextoBorde(label: "MAC: ", color: Theme.of(context).secondaryHeaderColor,),
          TextoBorde(label: " 5C:8E:25:SE:8D:D7")
        ],),
      ],
    );
  }
}
