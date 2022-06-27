import 'dart:convert';
import 'dart:math';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:interview_app_medical/global_constant.dart/const_string.dart';

class AuthService {
  final FirebaseAuth _auth = FirebaseAuth.instance;

  // Auth Chnge
  // Stream<User?> get user {
  //   return _auth.authStateChanges().map((User user)=> );
  // }

  // Sign In with email and password
  Future signInWithEmailAndPassword(String email, String password) async {
    try {
      UserCredential res = await _auth.signInWithEmailAndPassword(
          email: email, password: password);
    } catch (e) {}
  }

  //Add User
  Future addUser(String uuid, String body) async {
    try {
      http.Response res =
          await http.post(Uri.parse("$firebaseUrl/user"), body: body);
      print(res.body);
    } catch (e) {
      print(e);
    }
  }

  // Sign UP with email and password
  Future signUpWithEmailAndPassword(
      String email, String password, String name, BuildContext context) async {
    try {
      UserCredential res = await _auth.createUserWithEmailAndPassword(
          email: email, password: password);
          
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
}
