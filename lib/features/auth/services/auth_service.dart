import 'package:firebase_auth/firebase_auth.dart' as auth;
import 'package:flutter/material.dart';
import 'package:interview_app_medical/features/auth/model/user_model.dart';

class AuthService {
  bool isSIgnUP = false;
  final auth.FirebaseAuth _auth = auth.FirebaseAuth.instance;
  User? _userFromFirebase(auth.User? user) {
    if (user == null) {
      return null;
    }
    return User(user.uid, user.email);
  }

  Stream<User?>? get user {
    return _auth.authStateChanges().map((_userFromFirebase));
  }

  // Sign In with email and password
  Future<User?> signInWithEmailAndPassword(
      String email, String password) async {
    try {
      auth.UserCredential res = await _auth.signInWithEmailAndPassword(
          email: email, password: password);
      return _userFromFirebase(res.user);
    } catch (e) {
      print(e);
    }
    return null;
  }

  //Add User
  // Future addUser(String uuid, String body) async {
  //   try {
  //     http.Response res =
  //         await http.post(Uri.parse("$firebaseUrl/user"), body: body);
  //     print(res.body);
  //   } catch (e) {
  //     print(e);
  //   }
  // }

  // Sign UP with email and password
  Future signUpWithEmailAndPassword(
      String email, String password, String name, BuildContext context) async {
    try {
      auth.UserCredential res = await _auth.createUserWithEmailAndPassword(
          email: email, password: password);

      if (res != null) {
        return ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: const Text(
              "You are successfully registered 🎉 ",
            ),
            backgroundColor: Theme.of(context).errorColor,
          ),
        );
      }

      // return _userFromFirebase(res.user);

      // User? user = res.user;
      // var userData = ({"name": name, "email": email});
      // var userDataJson = jsonEncode(userData);
      // print("--------------------------------->");
      // print(user!.uid);
      // print("--------------------------------->");
      // addUser(user.uid, userDataJson);

    } catch (e) {
      if (e.toString().contains('[')) {
        var message = e.toString().replaceRange(
            e.toString().indexOf('['), e.toString().indexOf("]") + 2, '');

        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text(
              message,
            ),
            backgroundColor: Theme.of(context).errorColor,
          ),
        );
      } else {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text(
              e.toString(),
            ),
            backgroundColor: Theme.of(context).errorColor,
          ),
        );
      }
    }
  }

  // Sign Out
  Future<void> signOut() async {
    return await _auth.signOut();
  }
}
