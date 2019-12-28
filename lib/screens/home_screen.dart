
import 'package:flutter/material.dart';

class HomeScreen extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return new _MyAppState();
  }
}

TextEditingController textEditingController = new TextEditingController();
TextEditingController _textEditingController = new TextEditingController();
class _MyAppState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        width: double.infinity,
        height: double.infinity,
        decoration: BoxDecoration(
            image: DecorationImage(
              image: AssetImage("Assets/Images/image (2).png"),
              fit: BoxFit.cover,
            )),
        child: Column(
          children: <Widget>[
            Padding(
              padding: EdgeInsets.only(top: 150.0 , bottom: 50.0 ),
              child: Image.asset(
                "Assets/Images/login.png",
                width: 150.0,
                height: 150.0,
              ),
            ),
            Container(
              width: 300.0,
              height: 40.0,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.all(Radius.circular(20.0)),
                color: Colors.white,
              ),
              child: Row(
                children: <Widget>[
                  Padding(
                    padding: const EdgeInsets.only(left: 10.0),
                    child: Icon(Icons.supervised_user_circle,
                        color: Colors.black54),
                  ),
                  Expanded(
                    child : Padding(
                      padding: const EdgeInsets.only(top : 20.0 , left: 8.0),
                      child: TextField(
                        controller: textEditingController,
                        obscureText: true,
                        textAlign: TextAlign.left,
                        decoration: InputDecoration(
                          border: InputBorder.none,
                          hintText: 'Username',
                          hintStyle: TextStyle(color: Colors.grey),),
                      ),
                    ),
                  ),
                ],
              ),
            ),
            Container(
              margin: EdgeInsets.all(30.0),
              width: 300.0,
              height: 40.0,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.all(Radius.circular(20.0)),
                color: Colors.white,
              ),
              child: Row(
                children: <Widget>[
                  Padding(
                    padding: const EdgeInsets.only(left: 10.0),
                    child: Icon(Icons.lock,
                        color: Colors.black54),
                  ),
                  Expanded(
                    child: Padding(
                      padding: const EdgeInsets.only(top : 20.0 , left: 8.0),
                      child: TextField(
                        controller: _textEditingController,
                        obscureText: true,
                        textAlign: TextAlign.left,
                        decoration: InputDecoration(
                          border: InputBorder.none,
                          hintText: 'Password',
                          hintStyle: TextStyle(color: Colors.grey),),
                      ),
                    ),
                  ),
                ],
              ),
            ),
            Container(
                child: Text.rich(TextSpan(
                    text: "Forget Password" , style: TextStyle(decoration: TextDecoration.underline)
                ))
            ),
          ],
        ),
      ),
      floatingActionButton: Padding(
        padding: const EdgeInsets.all(30.0),
        child: FloatingActionButton(
          onPressed: () {
          },
          child: Icon(Icons.arrow_forward),
          backgroundColor: Colors.black54,
        ),
      ),
    );
  }
}
