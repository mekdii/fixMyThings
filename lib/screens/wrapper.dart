import 'package:fix/models/user.dart';
import 'package:fix/screens/autenticate/autenticate.dart';
import 'package:fix/screens/homepage/home_page.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class Wrapper extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final user = Provider.of<User>(context);

    //return either home or Authenticate widget
    if (user == null) {
      return Autenticate();
    } else {
      return HomePage();
    }
  }
}
