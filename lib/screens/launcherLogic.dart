

import 'package:android_intent_plus/android_intent.dart';
import 'package:url_launcher/url_launcher.dart';

class LauncherLogic {

    void abrirAppAction({required String action, String? package}) async {
      AndroidIntent intent = AndroidIntent(
        action: action,
      );
      intent.launch();
    }

    void abrirAppData({required String action, required String data})  {
      final AndroidIntent intent = AndroidIntent(
        action: action,
        data: data,
      );
      // Lanza el intent.
      intent.launch();
    }

    void abrirAppPackege({required String action, required String package}){
      AndroidIntent intent = AndroidIntent(
        action: action,
        package: package
      );
      intent.launch();
    }

    void abrirAppLauncher(String url){
      final Uri _url = Uri.parse(url);
      launchUrl(_url);
    }

  }
