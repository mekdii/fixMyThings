import 'package:fix/models/event.dart';
import 'package:fix/screens/user_detail.dart';
import 'package:fix/styleguide.dart';
import 'package:flutter/material.dart';

class EventWidget extends StatelessWidget {
  //final Event event;

  //const EventWidget({Key key, this.event}) : super(key: key);
  final Event brew;
  EventWidget({this.brew});

  @override
  Widget build(BuildContext context) {
    //   return Padding(
    //     padding: const EdgeInsets.only(top: 8.0),
    //     child: Card(
    //       margin: EdgeInsets.fromLTRB(20.0, 6.0, 20.0, 0.0),
    //       child: ListTile(
    //         leading: CircleAvatar(
    //           radius: 25.0,
    //           backgroundColor: Colors.brown[100],
    //         ),
    //         title: Text(brew.title),
    //         subtitle: Text('Takes ${brew.location} sugar(s)'),
    //       ),
    //     ),
    //   );
    // }
    return Card(
      margin: const EdgeInsets.symmetric(vertical: 20),
      elevation: 4,
      color: Colors.white,
      shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.all(Radius.circular(24))),
      child: Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[
            Container(
                child: Row(
              children: [
                GestureDetector(
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => UserDetail()),
                    );
                    // print("user photo clicked");
                  },
                  child: CircleAvatar(
                    radius: 25,
                    backgroundImage: AssetImage('assets/images/mekdi.jpg'),
                  ),
                ),
                SizedBox(
                  width: 10.0,
                ),
                Text(brew.username),
              ],

              //    CircleAvatar(
              //   radius: 25,
              //   backgroundImage: AssetImage('assets/images/mekdi.jpg'),
              // ),
            )
                // children: <Widget>[

                //   CircleAvatar(
                //     radius: 25,
                //     backgroundImage: AssetImage('assets/images/mekdi.jpg'),
                //   ),
                //   SizedBox(
                //     width: 10.0,
                //   ),
                //   Text(brew.username)
                // ],
                ),
            SizedBox(
              height: 10.0,
            ),
            ClipRRect(
              borderRadius: BorderRadius.all(
                Radius.circular(30),
              ),
              child: Image.asset(
                'assets/images/cooking_1.jpeg',
                height: 150,
                fit: BoxFit.fitWidth,
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 8.0, left: 8.0),
              child: Row(
                children: <Widget>[
                  Expanded(
                    flex: 3,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        Text(
                          brew.title,
                          style: eventTitleTextStyle,
                        ),
                        SizedBox(
                          height: 10,
                        ),
                        FittedBox(
                          child: Row(
                            children: <Widget>[
                              Icon(Icons.location_on),
                              SizedBox(
                                width: 5,
                              ),
                              Text(
                                brew.location,
                                style: eventLocationTextStyle,
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                  Expanded(
                    flex: 1,
                    child: Text(
                      brew.duration.toUpperCase(),
                      textAlign: TextAlign.right,
                      style: eventLocationTextStyle.copyWith(
                        fontWeight: FontWeight.w900,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
