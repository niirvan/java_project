import 'package:flutter/material.dart';
import 'package:login_demo/screens/drawerVersion.dart';
import 'package:login_demo/screens/home_screen.dart';
import 'package:login_demo/screens/splash_screen.dart';



void main() => runApp(MaterialApp(
      home: MyApp(),
      debugShowMaterialGrid: false,
    ));
//      === SPLASH SCREEN ===
class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: MySplashScreen(),
      routes: {
        HomeScreen.routeName :(_) => HomeScreen(),
        DrawerScreen.routeName :(_) => DrawerScreen(),
      },
    );
  }
}
