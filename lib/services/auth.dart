import 'package:brew_crew/models/user.dart';
import 'package:brew_crew/services/database.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';

class AuthService {
  final FirebaseAuth _auth = FirebaseAuth.instance;

  MUser _userFromFirebaseUser(User user) {
    // if (user != null) {
    print("User id from if is ${user.uid}");
    return MUser(uId: user.uid);
    // } else {
    //   return null;
    // }
  }

  //auth change user stream
  Stream<User?> get user {
    // User user;
    // if (user != null) {
    return _auth.authStateChanges();
    // } else {
    //   return null;
    // }
    // return _auth
    //     .authStateChanges()
    //     .map((User? user) => _userFromFirebaseUser(user!));
  }

  //login with email and password
  Future loginWithEmailAndPassword(String email, String password) async {
    try {
      UserCredential result = await _auth.signInWithEmailAndPassword(
          email: email, password: password);
      User? user = result.user;
      return _userFromFirebaseUser(user!);
    } catch (e) {
      print(e.toString());
      return null;
    }
  }

//register in with email and password
  Future registerWithEmailAndPassword(String email, String password) async {
    try {
      UserCredential result = await _auth.createUserWithEmailAndPassword(
          email: email, password: password);
      User? user = result.user;
      //creating a dummy document for the user
      await DatabaseService(uid: user!.uid).updateUserData('0', 'Name', 100);
      return _userFromFirebaseUser(user);
    } catch (e) {
      print(e.toString());
      return null;
    }
  }

//sign in anonymously
  Future signInAnon() async {
    try {
      UserCredential result = await _auth.signInAnonymously();
      User? user = result.user;
      print("Hello");
      return _userFromFirebaseUser(user!);
    } catch (e) {
      print(e.toString());
      return null;
    }
  }

  Future signOut() async {
    try {
      return await _auth.signOut();
    } catch (e) {
      print(e.toString());
      return null;
    }
  }
}
