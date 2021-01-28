import 'package:flutter/material.dart';

class UserDetail extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomPadding: false,
      appBar: AppBar(
        backgroundColor: Colors.blueAccent,
      ),
      body: Column(
        children: <Widget>[
          Container(
            decoration: BoxDecoration(
              gradient: LinearGradient(
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
                colors: [Colors.blueAccent, Colors.black],
              ),
            ),
            child: Container(
              width: double.infinity,
              height: 250.0,
              child: Center(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: <Widget>[
                    CircleAvatar(
                      radius: 30,
                      backgroundImage: AssetImage('assets/images/mekdi.jpg'),
                    ),
                    SizedBox(
                      height: 10.0,
                    ),
                    Text(
                      'Mekdes Genetu',
                      style: TextStyle(color: Colors.white, fontSize: 22.0),
                    ),
                    SizedBox(
                      height: 20.0,
                    ),
                    Card(
                      margin: EdgeInsets.symmetric(
                          horizontal: 20.0, vertical: 10.0),
                      clipBehavior: Clip.antiAlias,
                      color: Colors.white,
                      elevation: 8.0,
                      child: Padding(
                        padding: const EdgeInsets.symmetric(
                            vertical: 10.0, horizontal: 20.0),
                        child: Row(
                          children: <Widget>[
                            Expanded(
                              child: Column(
                                children: <Widget>[
                                  Text(
                                    'POSTS',
                                    style: TextStyle(
                                        color: Colors.blue,
                                        fontWeight: FontWeight.bold),
                                  ),
                                  SizedBox(
                                    height: 10.0,
                                  ),
                                  Text(
                                    '300',
                                    style: TextStyle(color: Colors.blue),
                                  ),
                                ],
                              ),
                            ),
                            Expanded(
                              child: Column(
                                children: <Widget>[
                                  Text(
                                    'Followers',
                                    style: TextStyle(
                                        color: Colors.blue,
                                        fontWeight: FontWeight.bold),
                                  ),
                                  SizedBox(
                                    height: 10.0,
                                  ),
                                  Text(
                                    '300k',
                                    style: TextStyle(color: Colors.blue),
                                  ),
                                ],
                              ),
                            ),
                            Expanded(
                              child: Column(
                                children: <Widget>[
                                  Text(
                                    'POSTS',
                                    style: TextStyle(
                                        color: Colors.blue,
                                        fontWeight: FontWeight.bold),
                                  ),
                                  SizedBox(
                                    height: 10.0,
                                  ),
                                  Text(
                                    '300',
                                    style: TextStyle(color: Colors.blue),
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
          Container(
            child: Padding(
              padding:
                  const EdgeInsets.symmetric(vertical: 32.0, horizontal: 20.0),
              child: Card(
                elevation: 16.0,
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.all(Radius.circular(24))),
                child: Column(
                  children: <Widget>[
                    Text(
                      'PHONE NUMBER',
                      style: TextStyle(
                          color: Colors.blue, fontWeight: FontWeight.bold),
                    ),
                    SizedBox(
                      height: 12.0,
                    ),
                    Text(
                      '0962782800',
                      style: TextStyle(fontSize: 20.0),
                    ),
                    SizedBox(height: 30.0),
                    Text(
                      'EMAIL',
                      style: TextStyle(
                        color: Colors.blue,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    SizedBox(
                      height: 12.0,
                    ),
                    Text(
                      'MekdesGenetu9797@gmail.com',
                      style: TextStyle(fontSize: 20.0),
                    ),
                    SizedBox(height: 30.0),
                    Text(
                      'LOCATION',
                      style: TextStyle(
                        color: Colors.blue,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    SizedBox(
                      height: 12.0,
                    ),
                    Text(
                      'bahirdar kebele 5',
                      style: TextStyle(fontSize: 20.0),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
