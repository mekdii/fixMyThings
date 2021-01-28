import 'package:fix/components/already_have_an_account_acheck.dart';
import 'package:fix/components/rounded_button.dart';
import 'package:fix/components/rounded_input_field.dart';
import 'package:fix/components/rounded_password_field.dart';
import 'package:fix/screens/Login/components/background.dart';
import 'package:fix/screens/Signup/signup_screen.dart';
import 'package:fix/services/auth.dart';
import 'package:flutter/material.dart';

import 'package:flutter_svg/svg.dart';

class Body extends StatefulWidget {
  @override
  _BodyState createState() => _BodyState();
}

class _BodyState extends State<Body> {
  final AuthService _auth = AuthService();
  final _formkey = GlobalKey<FormState>();
  String email = '';
  String password = '';
  String error = '';
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Background(
      child: SingleChildScrollView(
        child: Form(
          key: _formkey,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Text(
                "LOGIN",
                style: TextStyle(fontWeight: FontWeight.bold),
              ),
              SizedBox(height: size.height * 0.03),
              SvgPicture.asset(
                "assets/icons/login.svg",
                height: size.height * 0.35,
              ),
              SizedBox(height: size.height * 0.03),
              RoundedInputField(
                hintText: "Your Email",
                onChanged: (value) {
                  setState(() => email = value);
                },
              ),
              RoundedPasswordField(
                onChanged: (value) {
                  setState(() => password = value);
                },
              ),
              RoundedButton(
                text: "LOGIN",
                press: () async {
                  if (_formkey.currentState.validate()) {
                    dynamic result =
                        await _auth.signInWithEmailAndPassword(email, password);
                    if (result == null) {
                      setState(() =>
                          error = 'could not sign in with this credintials');
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
              SizedBox(height: size.height * 0.03),
              AlreadyHaveAnAccountCheck(
                press: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) {
                        return SignUpScreen();
                      },
                    ),
                  );
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
