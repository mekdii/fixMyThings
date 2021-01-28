import 'package:fix/services/auth.dart';
import 'package:flutter/material.dart';

class Registor extends StatefulWidget {
  final Function toogleView;
  Registor({this.toogleView});
  @override
  _RegistorState createState() => _RegistorState();
}

class _RegistorState extends State<Registor> {
  final AuthService _auth = AuthService();
  final _formkey = GlobalKey<FormState>();
  String email = '';
  String password = '';
  String error = '';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.brown[100],
      appBar: AppBar(
        backgroundColor: Colors.brown[400],
        elevation: 0.0,
        title: Text("registor in fixmythings"),
        actions: <Widget>[
          FlatButton.icon(
            icon: Icon(Icons.person),
            label: Text("Registor"),
            onPressed: () {
              widget.toogleView();
            },
          )
        ],
      ),
      body: Container(
        padding: EdgeInsets.symmetric(vertical: 20.0, horizontal: 50.0),
        child: Form(
          key: _formkey,
          child: Column(
            children: <Widget>[
              SizedBox(
                height: 20.0,
              ),
              TextFormField(
                  validator: (val) => val.isEmpty ? "Enter an email" : null,
                  onChanged: (val) {
                    setState(() => email = val);
                  }),
              SizedBox(
                height: 20.0,
              ),
              TextFormField(
                  validator: (val) =>
                      val.length < 8 ? "Enter an password 8 chars long" : null,
                  obscureText: true,
                  onChanged: (val) {
                    setState(() => password = val);
                  }),
              SizedBox(
                height: 20.0,
              ),
              RaisedButton(
                color: Colors.pink[400],
                child: Text(
                  'Registor',
                  style: TextStyle(color: Colors.white),
                ),
                onPressed: () async {
                  if (_formkey.currentState.validate()) {
                    dynamic result = await _auth.registerWithEmailAndPassword(
                        email, password);
                    if (result == null) {
                      setState(() => error = 'please supply a valid email');
                    } else {}
                  }

                  print(email);

                  print(password);
                },
              ),
              SizedBox(height: 12.0),
              Text(
                error,
                style: TextStyle(color: Colors.red, fontSize: 14),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
