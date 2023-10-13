

import 'package:ctoslauncher/widgets/widgets.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../temas/tema.dart';

class CardHome extends StatelessWidget {
  const CardHome({super.key, required this.label, required this.icono, this.validador=null  });

  final String label;
  final IconData icono;
  final Future? validador;

  @override
  Widget build(BuildContext context) {
    final ancho = MediaQuery.of(context).size.width;
    final alto = MediaQuery.of(context).size.height;
    final state = Provider.of<CardHomeState>(context);



    return SizedBox(
      width: ancho*0.28,
      height: alto*0.1,
      child: GestureDetector(
        onTap: () {

        },
        child: Card(
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: validador==null?
                _ContenidoCard(icono: icono, label: label, color: Theme.of(context).disabledColor)
                : FutureBuilder<dynamic>(
              future: validador,
              builder: (context, snapshot) {
                if(snapshot.connectionState == ConnectionState.done){
                  WidgetsBinding.instance?.addPostFrameCallback((_) {
                    try {
                      state.changeEncendido(snapshot.data);
                    } catch (e) {}
                  });
                  return _ContenidoCard(icono: icono, label: label, color: state.wifiEncendido?Theme.of(context).secondaryHeaderColor:Theme.of(context).disabledColor);
                }else{
                  return const Cargando();
                }
              }
            ),
          ),
        ),
      ),
    );
  }
}


class _ContenidoCard extends StatelessWidget {
  const _ContenidoCard({super.key, required this.icono, required this.label, required this.color});
  final IconData icono;
  final String label;
  final Color color;
  @override
  Widget build(BuildContext context) {
    final alto = MediaQuery.of(context).size.height;
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Icon(icono, color: color,),
        SizedBox(height: alto*0.02,),
        TextoBorde(label: label)
      ],);
  }
}
