

import 'dart:async';

import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:ctoslauncher/widgets/widgets.dart';
import 'package:device_info_plus/device_info_plus.dart';
import 'package:flutter/material.dart';
// import 'package:flutter_blue/flutter_blue.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:provider/provider.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:wifi_info_plugin_plus/wifi_info_plugin_plus.dart';
import 'package:wifi_iot/wifi_iot.dart';

import '../../temas/tema.dart';

class CardHome extends StatefulWidget {
  const CardHome({super.key, required this.label, required this.icono, this.validador=null, this.onTab   });

  final String label;
  final IconData icono;
  final Future? validador;
  final Function? onTab;

  @override
  State<CardHome> createState() => _CardHomeState();
}

class _CardHomeState extends State<CardHome> {
  String conexion="Sin conexión";
  bool bluetoothEncendido=false;

  @override
  void initState(){
    Connectivity().onConnectivityChanged.listen((result) {
      setState(() {
        if (result == ConnectivityResult.mobile) {
          conexion="Datos Moviles";
        } else if (result == ConnectivityResult.wifi) {
          conexion="Wifi";
        } else {
          conexion = "Sin conexión";
        }
      });
    });

    // FlutterBlue.instance.state.listen((state) {
    //   setState(() {
    //     if(state == BluetoothState.on){
    //       bluetoothEncendido=true;
    //     }else if(state == BluetoothState.off){
    //       bluetoothEncendido=false;
    //     }
    //   });
    // });
  }

  @override
  Widget build(BuildContext context) {
    final ancho = MediaQuery.of(context).size.width;
    final alto = MediaQuery.of(context).size.height;

    Color color = Theme.of(context).disabledColor;
    IconData iconoRed = Icons.wifi;
    String textoRed="Wifi";

    if(widget.label=="Red" ){
      if( (conexion=="Wifi" || conexion=="Datos Moviles"  )  ){
        color=Theme.of(context).secondaryHeaderColor;
        if(conexion=="Datos Moviles"){
          iconoRed=Icons.network_cell_outlined;
          textoRed="Datos Moviles";
        }else if(conexion=="Wifi"){
          iconoRed = Icons.wifi;
          textoRed="Wifi";
        }
      }else{
        iconoRed=Icons.wifi_off;
        textoRed="Desconectado";
      }
    }


    return SizedBox(
      width: ancho*0.28,
      height: alto*0.1,
      child: GestureDetector(
        onTap: () async {
          if(widget.onTab!=null){
            widget.onTab!();
          }
        },
        child: Card(
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: _ContenidoCard(icono: widget.label=="Red"?iconoRed: widget.icono, label: widget.label=="Red"?textoRed:widget.label, color: color)
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
