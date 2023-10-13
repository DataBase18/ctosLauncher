import 'package:ctoslauncher/screens/AllApps.dart';
import 'package:ctoslauncher/screens/launcherState.dart';
import 'package:ctoslauncher/screens/screens.dart';
import 'package:ctoslauncher/temas/tema.dart';
import 'package:ctoslauncher/widgets/widgets.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(const AppState());
}

class AppState extends StatelessWidget {
  const AppState({super.key });

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => LauncherState() ),
        ChangeNotifierProvider(create: (_) => CardHomeState())
      ],
      child: const MyApp( ),
    );
  }
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: Tema.tema ,
      routes: {
        "launcher": (_) => LauncherScreen(),
        "allApps": (_) => AllApps()
      },
      initialRoute: "launcher"
    );
  }
}


