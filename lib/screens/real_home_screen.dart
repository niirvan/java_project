import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
//import 'package:shared_preferences/shared_preferences.dart';

class ThisHomeScreen extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return new _MyAppState();
  }
}

class _MyAppState extends State<ThisHomeScreen> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        width: double.infinity,
        height: double.infinity,
        decoration: BoxDecoration(
            image: DecorationImage(
          image: AssetImage("Assets/Images/bg.png"),
          fit: BoxFit.cover,
        )),
        child: Column(
          children: <Widget>[
            Padding(
              padding: const EdgeInsets.only(top: 30.0, left: 15.0),
              child: Container(
                child: Row(
//                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[
                    GestureDetector(
                      onTap: () {
                        print("sag");
                      },
                      child: Icon(Icons.more_horiz),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(left: 50.0),
                      child: Image.asset("Assets/Images/logoflutter.png",
                          scale: 1.5),
                    ),
                  ],
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(25.0),
              child: Container(
                child: Row(
                  children: <Widget>[
                    GestureDetector(
                        //some features
                        onTap: () {
                          print("gav");
                        },
                        child: Icon(Icons.more_horiz)),
                  ],
                ),
              ),
            ),
            
          ],
        ),
      ),
    );
  }
}
