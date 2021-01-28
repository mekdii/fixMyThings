import 'package:fix/screens/Signup/components/body.dart';
import 'package:flutter/material.dart';

class SignUpScreen extends StatefulWidget {
  final Function toogleView;
  SignUpScreen({this.toogleView});
  @override
  _SignUpScreenState createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Body(),
    );
  }
}
