import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:login_demo/screens/drawerVersion.dart';
//import 'package:shared_preferences/shared_preferences.dart';

enum TabItem { login, signup }


class HomeScreen extends StatefulWidget {
  bool isLogin = false;
  String name = '' ;
  String pass = '' ;


  static const routeName = "/auth";

  @override
  State<StatefulWidget> createState() {
    return new _MyAppState();
  }
}

TextEditingController textEditingController = new TextEditingController();
TextEditingController _textEditingController = new TextEditingController();

class _MyAppState extends State<HomeScreen> {
  final signinkey = GlobalKey<FormState>();
  final formkey = GlobalKey<FormState>();
  String _userName, _password;
  String _name, _confirmedPassword, _email;
  var currentTab = TabItem.login;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        width: double.infinity,
        height: double.infinity,

//        ==== BACKGROUND IMAGE ====
        decoration: BoxDecoration(
            image: DecorationImage(
          image: AssetImage("Assets/Images/login.png"),
          fit: BoxFit.cover,
        )),
//
        child: SingleChildScrollView(
          child: Column(
            children: <Widget>[
              Padding(
                padding: EdgeInsets.only(top: 150.0, bottom: 30.0),
                child: Container(
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: <Widget>[
                      GestureDetector(
                        onTap: () {
                          setState(() {
                            currentTab = TabItem.signup;
                          });
                        },
                        child: Container(
                          width: 80.0,
                          decoration: BoxDecoration(
                            borderRadius:
                                BorderRadius.all(Radius.circular(25.0)),
                            color: currentTab == TabItem.signup
                                ? Colors.red
                                : Colors.indigo,
                          ),
                          child: Center(child: Text("Sign up")),
                          padding: const EdgeInsets.all(10.0),
                          margin: const EdgeInsets.all(6.0),
                          height: double.infinity,
                        ),
                      ),
                      GestureDetector(
                        onTap: () {
                          setState(() {
                            currentTab = TabItem.login;
                          });
                        },
                        child: Container(
                          width: 80.0,
                          decoration: BoxDecoration(
                            borderRadius:
                                BorderRadius.all(Radius.circular(25.0)),
                            color: currentTab == TabItem.login
                                ? Colors.red
                                : Colors.indigo,
                          ),
                          child: Center(child: Text("Sign in")),
                          padding: const EdgeInsets.all(10.0),
                          margin: const EdgeInsets.all(6.0),
                          height: double.infinity,
                        ),
                      ),
                    ],
                  ),
                  width: 200.0,
                  height: 55.0,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.all(Radius.circular(5.0)),
//                    color: Colors.white70,
                  ),
                ),
              ),
              Stack(
                children: <Widget>[
                  Offstage(
                    offstage: currentTab != TabItem.login,
                    child: buildLogin(),
                  ),
                  Offstage(
                    offstage: currentTab != TabItem.signup,
                    child: buildSignUp(),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
      floatingActionButton: Padding(
        padding: const EdgeInsets.all(30.0),
        child: FloatingActionButton(
          onPressed: () {
            _submit();
            Navigator.pushNamed(context, DrawerScreen.routeName);
          },
          child: Icon(
            Icons.arrow_forward,
            color: Colors.black,
          ),
          backgroundColor: Colors.grey,
        ),
      ),
    );
  }

  Column buildLogin() {
    return Column(
      children: <Widget>[
        Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.all(Radius.circular(20.0)),
            color: Colors.grey,
          ),
          child: Container(
            width: 300.0,
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Form(
                key: signinkey,
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: <Widget>[
                    TextFormField(
                      decoration: InputDecoration(
                          icon: Icon(
                            Icons.person,
                            color: Colors.black54,
                          ),
                          labelText: 'Username'),
                      onSaved: (input) => _userName = input,
                    ),
                    TextFormField(
                      decoration: InputDecoration(
                          icon: Icon(
                            Icons.lock,
                            color: Colors.black54,
                          ),
                          labelText: 'Password'),
                      validator: (input) =>
                          input.length < 8 ? 'You need at least 8' : null,
                      onSaved: (input) => _password = input,
                      obscureText: true,
                    ),
                    //==== save pass word button here ====

                    Padding(
                      padding: const EdgeInsets.only(top: 25.0, bottom: 15.0),
                      child: GestureDetector(
                          onTap: () {
                            //navigation to the forget password page
                          },
                          child: Text(
                            'Forget Password',
                            style: TextStyle(
                                decoration: TextDecoration.underline,
                                color: Colors.black87),
                          )),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
        Padding(
          padding: const EdgeInsets.only(top: 20.0, bottom: 20.0),
          child: Divider(
            color: Colors.white12,
          ),
        ),
        Container(
          margin: const EdgeInsets.only(bottom: 10.0),
          width: 200.0,
          height: 40.0,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.all(Radius.circular(10.0)),
            color: Colors.indigo,
          ),
          child: Row(
            children: <Widget>[
              Padding(
                padding: const EdgeInsets.only(left: 2.0),
                child: Image.asset("Assets/Images/face.png", scale: 15.0),
              ),
              Expanded(
                child: Padding(
                  padding: const EdgeInsets.only(top: 2.0, left: 2.0),
                  child: Text("Sign in with Facebook"),
                ),
              ),
            ],
          ),
        ),
        Container(
          margin: const EdgeInsets.only(top: 10.0),
          width: 200.0,
          height: 40.0,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.all(Radius.circular(10.0)),
            color: Colors.red,
          ),
          child: Row(
            children: <Widget>[
              Padding(
                padding: const EdgeInsets.only(left: 10.0),
                child: Image.asset("Assets/Images/google.png", scale: 20.0),
              ),
              Expanded(
                child: Padding(
                  padding: const EdgeInsets.only(top: 2.0, left: 8.0),
                  child: Text("Sign in with Google"),
                ),
              ),
            ],
          ),
        )
      ],
    );
  }

  void _submit() async{
    if (signinkey.currentState.validate()) {
      signinkey.currentState.save();
      print('saggg');
    }
  }

  Column buildSignUp() {
    return Column(
      children: <Widget>[
        Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.all(Radius.circular(20.0)),
            color: Colors.grey,
          ),
          child: Container(
            width: 300.0,
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Form(
                key: formkey,
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: <Widget>[
                    TextFormField(
                      decoration: InputDecoration(
                          icon: Icon(
                            Icons.perm_identity,
                            color: Colors.black54,
                          ),
                          labelText: 'Name'),
                      onSaved: (input) => _name = input,
                    ),
                    TextFormField(
                      decoration: InputDecoration(
                          icon: Icon(
                            Icons.person,
                            color: Colors.black54,
                          ),
                          labelText: 'Username'),
                      validator: (input) =>
                          input.length < 8 ? 'You need at least 8' : null,
                      onSaved: (input) => _password = input,
                      obscureText: true,
                    ),
                    TextFormField(
                      decoration: InputDecoration(
                          icon: Icon(
                            Icons.email,
                            color: Colors.black54,
                          ),
                          labelText: 'Emial'),
                      validator: (input) =>
                          !input.contains('@') ? 'Invalid Email' : null,
                      onSaved: (input) => _password = input,
                      obscureText: true,
                    ),
                    TextFormField(
                      decoration: InputDecoration(
                          icon: Icon(
                            Icons.lock,
                            color: Colors.black54,
                          ),
                          labelText: 'Password'),
                      validator: (input) =>
                          input.length < 8 ? 'You need at least 8' : null,
                      onSaved: (input) => _password = input,
                      obscureText: true,
                    ),
                    TextFormField(
                      decoration: InputDecoration(
                          icon: Icon(
                            Icons.lock,
                            color: Colors.black54,
                          ),
                          labelText: 'Confirm Password'),
                      validator: (input) =>
                          input.length != _password ? 'Please try again' : null,
                      onSaved: (input) => _password = input,
                      obscureText: true,
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
      ],
    );
  }
}
