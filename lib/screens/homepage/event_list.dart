import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:fix/models/event.dart';
import 'package:fix/screens/homepage/event_widget.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class EventList extends StatefulWidget {
  @override
  _EventListState createState() => _EventListState();
}

class _EventListState extends State<EventList> {
  @override
  Widget build(BuildContext context) {
    final datas = Provider.of<List<Event>>(context) ?? [];
    // datas.forEach((brew) {
    //   print(brew.title);
    //   print(brew.duration);
    // });
    // return Container();

    return ListView.builder(
        itemCount: datas.length,
        itemBuilder: (context, index) {
          return EventWidget(brew: datas[index]);
        });
  }
}
