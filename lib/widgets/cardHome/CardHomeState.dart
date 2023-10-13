
import 'package:flutter/widgets.dart';

class CardHomeState extends ChangeNotifier {
  bool wifiEncendido = false;
  void changeEncendido (bandera) {
    wifiEncendido=bandera;
    notifyListeners();
  }
}