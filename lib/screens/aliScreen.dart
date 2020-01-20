import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class AliScreen extends StatefulWidget {
  @override
  _AliScreenState createState() => _AliScreenState();
}

class _AliScreenState extends State<AliScreen> {
  final formKey = GlobalKey<FormState>();
  String _email, _password;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Fuckin form'),
      ),
      body: Card(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Form(
            key: formKey,
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: <Widget>[
                TextFormField(
                  decoration: InputDecoration(
                      icon: Icon(
                        Icons.email,
                        color: Colors.blueAccent,
                      ),
                      labelText: 'Emial'),
                  validator: (input) =>
                      !input.contains('@') ? 'Not a valid Email' : null,
                  onSaved: (input) => _email = input,
                ),
                TextFormField(
                  decoration: InputDecoration(
                      icon: Icon(
                        Icons.lock,
                        color: Colors.blueAccent,
                      ),
                      labelText: 'Password'),
                  validator: (input) =>
                      input.length < 8 ? 'You need at least 8' : null,
                  onSaved: (input) => _password = input,
                  obscureText: true,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: <Widget>[
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: RaisedButton(
                        onPressed: _submit,
                        child: Text('Sign in'),
                      ),
                    )
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
  void _submit(){
    if(formKey.currentState.validate()){
      formKey.currentState.save();
    }
  }
}
