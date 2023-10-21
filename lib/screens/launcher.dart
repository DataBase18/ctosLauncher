
import 'package:ctoslauncher/screens/launcherLogic.dart';
import 'package:ctoslauncher/widgets/widgets.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:url_launcher/url_launcher.dart';

import '../Constantes.dart';
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
    CardHomeModel(label: "Red", icono: Icons.wifi, onTap: ()  {
      logic.abrirAppAction(action: Constantes.wifiConfigAction);
    }),
    CardHomeModel(label: "Chrome", icono:FontAwesomeIcons.chrome, onTap: (){
      logic.abrirAppData(action: Constantes.VIEWAction, data: Constantes.chromeDataUrl);
    }),
    CardHomeModel(label: "Ajustes", icono: FontAwesomeIcons.gear, onTap: (){
      logic.abrirAppAction(action: Constantes.configAppAction);
    }) ,
    CardHomeModel(label: "Telefono", icono: FontAwesomeIcons.phone, onTap: (){
      logic.abrirAppAction(action: Constantes.DIALAction);
    }),
    CardHomeModel(label: "Reloj", icono: FontAwesomeIcons.clock, onTap: (){
      logic.abrirAppPackege(action: Constantes.MAINAction, package: Constantes.relojPackageName );
    }),
    CardHomeModel(label: "Galeria", icono: FontAwesomeIcons.photoFilm, onTap: () {
      logic.abrirAppLauncher(Constantes.galeriaOpenUrl);
    }),

    CardHomeModel(label: "CLI", icono: FontAwesomeIcons.terminal, onTap: (){
      logic.abrirAppPackege(action: Constantes.MAINAction, package: Constantes.cliPackageName);
    }),
    CardHomeModel(label: "Musica", icono: FontAwesomeIcons.youtube , onTap: (){
      logic.abrirAppPackege(action: Constantes.MAINAction, package: Constantes.ytMusicPackageName);
    }),
    CardHomeModel(label: "Localizador", icono: FontAwesomeIcons.mapLocationDot, onTap: (){
      logic.abrirAppData(action: Constantes.VIEWAction, data: 'geo:0,0');
    }),

    CardHomeModel(label: "Calculadora", icono: FontAwesomeIcons.calculator, onTap: (){
      logic.abrirAppPackege(action: Constantes.MAINAction, package: Constantes.calcProPackageName);
    }),
    CardHomeModel(label: "Camara", icono: FontAwesomeIcons.camera, onTap: (){
      logic.abrirAppAction(action: Constantes.camaraAppAction);
    }),

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
                    onTab: cards[index].onTap,
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

