import 'package:fix/screens/Login/components/body.dart';
import 'package:flutter/material.dart';

class LoginScreen extends StatelessWidget {
  final Function toogleView;
  LoginScreen({this.toogleView});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Body(),
    );
  }
}
