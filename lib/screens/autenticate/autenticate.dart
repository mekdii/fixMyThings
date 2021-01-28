import 'package:fix/screens/autenticate/registor.dart';
import 'package:fix/screens/autenticate/sign_in.dart';

import 'package:flutter/material.dart';

class Autenticate extends StatefulWidget {
  @override
  _AutenticateState createState() => _AutenticateState();
}

class _AutenticateState extends State<Autenticate> {
  bool showSignIn = true;
  void toogleView() {
    setState(() => showSignIn = !showSignIn);
  }

  @override
  Widget build(BuildContext context) {
    if (showSignIn) {
      return SignIn(toogleView: toogleView);
    } else {
      return Registor(toogleView: toogleView);
    }
  }
}
