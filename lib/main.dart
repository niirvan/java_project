import 'package:flutter/material.dart';
import 'package:login_demo/screens/home_screen.dart';
import 'package:login_demo/screens/splash_screen.dart';



void main() => runApp(MaterialApp(
      home: MyApp(),
      debugShowMaterialGrid: false,
    ));

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'walletapp',
      home: MySplashScreen(),
    );
  }
}
