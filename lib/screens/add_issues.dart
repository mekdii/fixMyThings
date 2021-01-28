import 'package:firebase_auth/firebase_auth.dart';
import 'package:fix/services/auth.dart';
import 'package:fix/services/database.dart';
import 'package:flutter/material.dart';

class AddIssues extends StatefulWidget {
  @override
  _AddIssuesState createState() => _AddIssuesState();
}

class _AddIssuesState extends State<AddIssues> {
  final _auth = AuthService();

  final _formKey = GlobalKey<FormState>();
  String username = '';
  String title = '';
  String description = '';
  String location = '';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blueAccent,
      ),
      body: SafeArea(
        top: false,
        bottom: false,
        child: Form(
          key: _formKey,
          child: Padding(
            padding:
                const EdgeInsets.symmetric(horizontal: 50.0, vertical: 15.0),
            child: Column(
              children: <Widget>[
                TextFormField(
                  validator: (val) =>
                      val.isEmpty ? "username cant be empty " : null,
                  onChanged: (val) {
                    setState(() => username = val);
                  },
                  decoration: const InputDecoration(
                      hintText: 'insert user name', labelText: 'User Name'),
                ),
                SizedBox(
                  height: 13.0,
                ),
                TextFormField(
                  validator: (val) =>
                      val.isEmpty ? "title cant be empty" : null,
                  onChanged: (val) {
                    setState(() => title = val);
                  },
                  decoration: const InputDecoration(
                      hintText: 'title', labelText: 'insert title'),
                ),
                SizedBox(
                  height: 13.0,
                ),
                TextFormField(
                  validator: (val) =>
                      val.isEmpty ? "description cNT be empty" : null,
                  onChanged: (val) {
                    setState(() => description = val);
                  },
                  decoration: const InputDecoration(
                      hintText: 'description', labelText: 'insert description'),
                ),
                SizedBox(
                  height: 13.0,
                ),
                TextFormField(
                  validator: (val) =>
                      val.isEmpty ? "location cant be empty" : null,
                  onChanged: (val) {
                    setState(() => location = val);
                  },
                  decoration: const InputDecoration(
                      hintText: 'location', labelText: 'insert location'),
                ),
                SizedBox(
                  height: 40.0,
                ),
                ClipRRect(
                  borderRadius: BorderRadius.circular(29),
                  child: FlatButton(
                    padding: EdgeInsets.symmetric(vertical: 20, horizontal: 40),
                    color: Colors.blueAccent,
                    child: Text(
                      'Submit',
                      style: TextStyle(color: Colors.white),
                    ),
                    onPressed: () async {
                      if (_formKey.currentState.validate()) {
                        FirebaseUser auth =
                            await FirebaseAuth.instance.currentUser();
                        String uid = auth.uid;
                        print(uid);
                        await DatabaseService(uid: uid).updateUserData(
                            username, title, description, location, "3H");
                      } else {
                        print("what the fuck nigga");
                      }
                    },
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
