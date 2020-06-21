import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
/* Pages */
import "./pages/splash_screen.dart";

class Main extends StatefulWidget {
  @override
  _MainState createState() => _MainState();
}

class _MainState extends State<Main> {
  @override
  Widget build(BuildContext context) {
    SystemChrome.setPreferredOrientations([
      DeviceOrientation.portraitUp,
      DeviceOrientation.portraitDown,
    ]);
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: "Flutter",
      home: SplashScreen(),
    );
  }
}

void main() {
  runApp(Main());
}
