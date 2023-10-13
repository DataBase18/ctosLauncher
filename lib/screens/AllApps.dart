

import 'package:flutter/material.dart';
import '../widgets/widgets.dart';

class AllApps extends StatelessWidget {
  const AllApps ({super.key});

  @override
  Widget build(BuildContext context) {
    final ancho = MediaQuery.of(context).size.width;
    final alto = MediaQuery.of(context).size.height;
    return Scaffold(
      backgroundColor: Theme.of(context).primaryColor,
      body: Padding(
       padding: EdgeInsets.symmetric(vertical: alto*0.08, horizontal: ancho*0.01),
        child: Column(
          children: [
            Container(
              color: Colors.black12,
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Container(
                      decoration: BoxDecoration(
                          border: Border.all(
                              color: Theme.of(context).secondaryHeaderColor,
                              width: 0.4)),
                      width: ancho * 0.1,
                      height: alto * 0.05,
                      child:  Icon(
                        Icons.photo,
                        color: Colors.white,
                      )),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      TextoBorde(label: "Facebook"),
                    ],
                  )
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
