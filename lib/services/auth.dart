import 'package:firebase_auth/firebase_auth.dart';
import 'package:fix/models/user.dart';
import 'package:fix/services/database.dart';

class AuthService {
  final FirebaseAuth _auth = FirebaseAuth.instance;

//create user object based on firebae user
  User _userfromfirebaseuser(FirebaseUser user) {
    return user != null ? User(uid: user.uid) : null;
  }

  currentUser() async {
    final FirebaseUser user = await _auth.currentUser();
    final uid = user.uid;
    print(uid);
    return uid;
    // here you write the codes to input the data into firestore
  }

  Future signInAnon() async {
    try {
      AuthResult result = await _auth.signInAnonymously();
      FirebaseUser user = result.user;
      return _userfromfirebaseuser(user);
    } catch (e) {
      print(e.toString);
      return null;
    }
  }

  //auth change user stream
  Stream<User> get user {
    return _auth.onAuthStateChanged.map(_userfromfirebaseuser);
  }

  //sign out
  Future signOut() async {
    try {
      return await _auth.signOut();
    } catch (e) {
      print(e.toString());
      return null;
    }
  }

  //registor with email and password
  Future registerWithEmailAndPassword(String email, String password) async {
    try {
      AuthResult result = await _auth.createUserWithEmailAndPassword(
          email: email.trim(), password: password.trim());
      FirebaseUser user = result.user;
      // create a new document for the user with the uid
      // await DatabaseService(uid: user.uid).updateUserData(
      //     'Kiddy', 'my pc', 'my ubuntu 18.04 crashes', 'bahirdar', '3HR');
      return _userfromfirebaseuser(user);
    } catch (error) {
      print(error.toString());
      return null;
    }
  }

  // sign in with email and password
  Future signInWithEmailAndPassword(String email, String password) async {
    try {
      AuthResult result = await _auth.signInWithEmailAndPassword(
          email: email.trim(), password: password.trim());
      FirebaseUser user = result.user;
      return user;
    } catch (error) {
      print(error.toString());
      return null;
    }
  }
}
