import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:fix/models/category.dart';
import 'package:fix/models/event.dart';
import 'package:fix/screens/autenticate/registor.dart';
import 'package:fix/screens/homepage/event_list.dart';
import 'package:fix/screens/my_detail.dart';
import 'package:fix/services/auth.dart';
import 'package:fix/services/database.dart';
import 'package:fix/styleguide.dart';
import 'package:flutter/material.dart';

import 'package:provider/provider.dart';

import '../../app_state.dart';
import 'category_widget.dart';
import 'event_widget.dart';
import 'home_page_background.dart';

class HomePage extends StatelessWidget {
  final AuthService _auth = AuthService();
  @override
  Widget build(BuildContext context) {
    return StreamProvider<List<Event>>.value(
      value: DatabaseService().data,
      child: Scaffold(
        body: Stack(
          children: <Widget>[
            HomePageBackground(
              screenHeight: MediaQuery.of(context).size.height,
            ),
            SafeArea(
              child: SingleChildScrollView(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 32.0),
                      child: Row(
                        children: <Widget>[
                          GestureDetector(
                            onTap: () {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => MyDetail()),
                              );
                            },
                            child: CircleAvatar(
                              radius: 30,
                              backgroundImage:
                                  AssetImage('assets/images/mekdi.jpg'),
                            ),
                          ),
                          // borderRadius: BorderRadius.circular(8.0),
                          // child: Image.asset(
                          //   'assets/images/mekdi.jpg',
                          //   width: 70.0,
                          //   height: 70.0,
                          // ),

                          Spacer(),
                          FlatButton.icon(
                            icon: Icon(
                              Icons.person,
                              color: Colors.white,
                            ),
                            label: Text(
                              'Logout',
                              style: TextStyle(color: Colors.white),
                            ),
                            onPressed: () async {
                              await _auth.signOut();
                            },
                          ),
                        ],
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 32.0, vertical: 50.0),
                      child: Text(
                        "WHAT'S UP ",
                        style: whiteHeadingTextStyle,
                      ),
                    ),
                  ],
                ),
              ),
            ),
            SizedBox(
              height: 100.0,
            ),
            Padding(
              padding: const EdgeInsets.only(top: 200.0),
              child: EventList(),
            ),
          ],
        ),

        // children: <Widget>[
        //   HomePageBackground(
        //     screenHeight: MediaQuery.of(context).size.height,
        //   )
        // ],
        // body: EventList(),
      ),
    );
    // body: ChangeNotifierProvider<AppState>(
    //   create: (_) => AppState(),
    //   //  child:DataList(),
    //   child: Stack(
    //     children: <Widget>[
    //       HomePageBackground(
    //         screenHeight: MediaQuery.of(context).size.height,
    //       ),
    //       SafeArea(
    //         child: SingleChildScrollView(
    //           child: Column(
    //             crossAxisAlignment: CrossAxisAlignment.start,
    //             children: <Widget>[
    //               Padding(
    //                 padding: const EdgeInsets.symmetric(horizontal: 32.0),
    //                 child: Row(
    //                   children: <Widget>[
    //                     Text(
    //                       "LOCAL EVENTS",
    //                       style: fadedTextStyle,
    //                     ),
    //                     Spacer(),
    //                     FlatButton.icon(
    //                       icon: Icon(
    //                         Icons.person,
    //                         color: Colors.white,
    //                       ),
    //                       label: Text(
    //                         "logout",
    //                         style: TextStyle(color: Colors.white),
    //                       ),
    //                       onPressed: () async {
    //                         await _auth.signOut();
    //                         print("haluu");
    //                       },
    //                     )
    //                   ],
    //                 ),
    //               ),
    //               Padding(
    //                 padding: const EdgeInsets.symmetric(horizontal: 32.0),
    //                 child: Text(
    //                   "What's Up",
    //                   style: whiteHeadingTextStyle,
    //                 ),
    //               ),
    //               Padding(
    //                 padding: const EdgeInsets.symmetric(vertical: 24.0),
    //                 child: Consumer<AppState>(
    //                   builder: (context, appState, _) =>
    //                       SingleChildScrollView(
    //                     scrollDirection: Axis.horizontal,
    //                     child: Row(
    //                       children: <Widget>[
    //                         for (final category in categories)
    //                           CategoryWidget(category: category)
    //                       ],
    //                     ),
    //                   ),
    //                 ),
    //               ),

    // Padding(
    //  padding: const EdgeInsets.symmetric(horizontal: 16.0),
    // child: EventList(),
    // builder: (context, appState, _) => Column(
    // children: <Widget>[
    // for (final event in events.where((e) => e
    //     .categoryIds
    //     .contains(appState.selectedCategoryId)))
    //   GestureDetector(
    //     onTap: () {

    //     },
    // child: EventWidget(
    //  child: EventList(),
    // event: event,
    //  ),
    // )
    //],
    // ),
    //  ),
    //                   // ),
    //                 ],
    //               ),
    //             ),
    //           ),
    //         ],
    //       ),
    //     ),
    //   ),
    // );
  }
}
