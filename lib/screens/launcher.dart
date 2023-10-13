
import 'package:ctoslauncher/screens/launcherLogic.dart';
import 'package:ctoslauncher/widgets/widgets.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import '../models/models.dart';
import '../temas/tema.dart';
import 'Notificaciones/Notificaciones.dart';



LauncherLogic logic = LauncherLogic();
final PageController controladorSlider = PageController();

class LauncherScreen extends StatelessWidget {
  LauncherScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final ancho = MediaQuery.of(context).size.width;
    final alto = MediaQuery.of(context).size.height;

    return Scaffold(
        backgroundColor: Theme.of(context).primaryColor,
        body: PageView(
          controller: controladorSlider,
          children: [
            _Home(),
            Notificaciones()
          ],
        )
    );
  }
}

class _Home extends StatelessWidget {
  _Home({super.key});

  List<CardHomeModel> cards = [
    CardHomeModel(label: "Wifi", icono: Icons.wifi, validador: logic.validarWifiEncendido()),
    CardHomeModel(label: "Bluetooth", icono: Icons.bluetooth, validador: logic.validarWifiEncendido()),
    CardHomeModel(label: "Datos Moviles", icono: Icons.network_cell_outlined, validador: logic.validarWifiEncendido()),

    CardHomeModel(label: "Chrome", icono:FontAwesomeIcons.chrome),
    CardHomeModel(label: "Ajustes", icono: FontAwesomeIcons.gear),
    CardHomeModel(label: "Whatsapp", icono: FontAwesomeIcons.whatsapp),

    CardHomeModel(label: "Telefono", icono: FontAwesomeIcons.phone),
    CardHomeModel(label: "Reloj", icono: FontAwesomeIcons.clock),
    CardHomeModel(label: "Galeria", icono: FontAwesomeIcons.photoFilm),

    CardHomeModel(label: "CLI", icono: FontAwesomeIcons.terminal),
    CardHomeModel(label: "Musica", icono: FontAwesomeIcons.youtube),
    CardHomeModel(label: "Localizador", icono: FontAwesomeIcons.mapLocationDot),

    CardHomeModel(label: "Calculadora", icono: FontAwesomeIcons.calculator),
    CardHomeModel(label: "Camara", icono: FontAwesomeIcons.camera),
    CardHomeModel(label: "Finanzas", icono: FontAwesomeIcons.moneyBill1Wave),

  ];
  @override
  Widget build(BuildContext context) {
    final ancho = MediaQuery.of(context).size.width;
    final alto = MediaQuery.of(context).size.height;
    return Padding(
        padding: EdgeInsets.symmetric(horizontal: ancho * 0.05, vertical: alto * 0.05),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                FechaYHora(),
                MiniItem(icono: FontAwesomeIcons.cloudArrowDown ),
                MiniItem(icono: FontAwesomeIcons.powerOff ),
                MiniItem(icono: FontAwesomeIcons.rotate ),
                MiniItem(icono: FontAwesomeIcons.lock ),
              ],
            ),
            Expanded(
              child: GridView.builder(
                padding: const EdgeInsets.symmetric(vertical: 0),
                itemCount: cards.length,
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 3,
                ),
                itemBuilder: (BuildContext context, int index) {
                  return CardHome(
                    label: cards[index].label,
                    icono: cards[index].icono,
                    validador: cards[index].validador,
                  );
                },
              ),
            ),
            Divider(color: Theme.of(context).disabledColor,),
            InfoDevice(),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                TextoBorde(label: "DecSecAccess"),
                ElevatedButton(onPressed: (){
                  Navigator.pushNamed(context, "allApps");
                }, child: Text("Todas las apps", style: Tema.buttonText,) )
              ],
            )
          ],
        )
    );
  }
}

