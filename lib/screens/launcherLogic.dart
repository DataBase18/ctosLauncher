

 import 'package:connectivity_plus/connectivity_plus.dart';

class LauncherLogic {

   Future<bool> validarWifiEncendido() async {
    var connectivityResult = await (Connectivity().checkConnectivity()); 
    if (connectivityResult == ConnectivityResult.wifi) {
      return true;
    } else {
      return false;
    }
  }

 }