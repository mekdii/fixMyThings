import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:fix/models/event.dart';

class DatabaseService {
  final String uid;
  final event = Event();
  DatabaseService({this.uid});

  final CollectionReference userdatacollection =
      Firestore.instance.collection('userData');
  final CollectionReference postcollection = Firestore.instance
      .collection('userData')
      .document('SgiTLfNHwhVYkqGH7fEPkyDDAtr1')
      .collection('posts');

  //final Future<DocumentReference> postscollections =
  //  Firestore.instance.collection('userData').document().collection('posts').add(toJson());

  Future<void> updateUserData(String username, String title, String description,
      String location, String duration) async {
    List yourItemList = [];
    for (int i = 0; i < 10; i++)
      yourItemList.add({
        "username": username,
        "title": title,
        "description": description,
        "location": location
      });
    return await userdatacollection.document(uid).setData({
      'posts': FieldValue.arrayUnion(yourItemList),
      // 'title': FieldValue.arrayUnion([username]),
      // 'description': FieldValue.arrayUnion([username]),
      // 'location': FieldValue.arrayUnion([username]),
      // 'duration': FieldValue.arrayUnion([username]),
    }, merge: true);
  }

  // brew list from snapshot
  List<Event> _brewListFromSnapshot(QuerySnapshot snapshot) {
    return snapshot.documents.map((doc) {
      //print(doc.data);
      return Event(
          username: doc.data['username'] ?? '',
          title: doc.data['title'] ?? '',
          description: doc.data['description'] ?? '',
          location: doc.data['location'] ?? '',
          duration: doc.data['duration'] ?? '');
    }).toList();
  }

  // get brews stream
  Stream<List<Event>> get data {
    return userdatacollection.snapshots().map(_brewListFromSnapshot);
  }
}
