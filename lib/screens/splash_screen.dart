import 'package:flutter/material.dart';
import 'package:login_demo/screens/home_screen.dart';
import 'package:splashscreen/splashscreen.dart';

class MySplashScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return new SplashScreen(
        seconds: 14,
        navigateAfterSeconds: new HomeScreen(),
        title: new Text('Welcome In SplashScreen'),
        image: new Image.asset('screenshot.png'),
        backgroundColor: Colors.white,
        styleTextUnderTheLoader: new TextStyle(),
        photoSize: 100.0,
        loaderColor: Colors.red
    );
  }
}

