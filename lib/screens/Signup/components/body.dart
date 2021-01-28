import 'package:fix/components/already_have_an_account_acheck.dart';
import 'package:fix/components/rounded_button.dart';
import 'package:fix/components/rounded_input_field.dart';
import 'package:fix/components/rounded_password_field.dart';
import 'package:fix/screens/Login/components/background.dart';
import 'package:fix/screens/Login/login_screen.dart';
import 'package:fix/screens/Signup/components/social_icon.dart';
import 'package:fix/services/auth.dart';
import 'package:flutter/material.dart';

import 'package:flutter_svg/svg.dart';

import 'or_divider.dart';

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
                "SIGNUP",
                style: TextStyle(fontWeight: FontWeight.bold),
              ),
              SizedBox(height: size.height * 0.03),
              SvgPicture.asset(
                "assets/icons/signup.svg",
                height: size.height * 0.35,
              ),
              RoundedInputField(
                hintText: "Your Email",
                //  validator: (val) => val.isEmpty ? "Enter an email" : null,
                onChanged: (value) {
                  setState(() => email = value);
                },
              ),
              RoundedPasswordField(
                //  validator: (val) =>
                //  val.length < 8 ? "Enter an password 8 chars long" : null,
                onChanged: (value) {
                  setState(() => password = value);
                },
              ),
              RoundedButton(
                text: "SIGNUP",
                press: () async {
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
              SizedBox(height: size.height * 0.03),
              AlreadyHaveAnAccountCheck(
                login: false,
                press: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) {
                        return LoginScreen();
                      },
                    ),
                  );
                },
              ),
              OrDivider(),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  SocalIcon(
                    iconSrc: "assets/icons/facebook.svg",
                    press: () {},
                  ),
                  SocalIcon(
                    iconSrc: "assets/icons/twitter.svg",
                    press: () {},
                  ),
                  SocalIcon(
                    iconSrc: "assets/icons/google-plus.svg",
                    press: () {},
                  ),
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
