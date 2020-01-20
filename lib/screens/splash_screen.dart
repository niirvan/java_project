import 'package:flutter/material.dart';
import 'package:login_demo/screens/aliScreen.dart';
import 'package:login_demo/screens/drawerVersion.dart';
import 'package:login_demo/screens/home_screen.dart';
import 'package:login_demo/screens/real_home_screen.dart';
import 'package:login_demo/screens/search.dart';
import 'package:splashscreen/splashscreen.dart';

class MySplashScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return new SplashScreen(
        seconds: 5,
        navigateAfterSeconds: new HomeScreen(),
        imageBackground: AssetImage("Assets/Images/signin2.png" ),
//        image: new Image.asset("Assets/Images/amqezi.jpg", fit: BoxFit.fill,),
        styleTextUnderTheLoader: new TextStyle(),
        photoSize: 100.0,
        loaderColor: Colors.deepOrangeAccent
    );
  }
}

