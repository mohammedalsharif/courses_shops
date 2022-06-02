import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';

class MyUser {
  final String? uid;
  String? firstName;
  String? lastName;
  String? email;

  MyUser({required this.uid});
}

class AuthFireBase {
  FirebaseFirestore _firestore = FirebaseFirestore.instance;
  User? user = FirebaseAuth.instance.currentUser;

  MyUser _userFromFirebase(User? user) {
    return MyUser(uid: user?.uid);
  }

  Future<MyUser?> registerWithEmailAndPassword(
      String email, String password) async {
    try {
      final authResult = await FirebaseAuth.instance
          .createUserWithEmailAndPassword(email: email, password: password);
      return _userFromFirebase(authResult.user);
    } catch (e) {
      print(e);
      return null;
    }
  }

  Future<MyUser?> loginWithEmailAndPassword(
      String email, String password) async {
    try {
      final authResult = await FirebaseAuth.instance
          .signInWithEmailAndPassword(email: email, password: password);
      return _userFromFirebase(authResult.user);
    } catch (e) {
      return null;
    }
  }

  Future<void> logout() async {
    await FirebaseAuth.instance.signOut();
  }

  saveUserDate(
      String? uid, String firstName, String lastName, String email) async {
    Map<String, String> user = Map();
    user["uid"] = uid!;
    user["firstName"] = firstName;
    user["lastName"] = lastName;
    user["email"] = email;
    try {
      _firestore.collection("users").doc().set(user);
    } catch (e) {
      print(e);
    }
  }

  Future getUserDetails() async {
    try {
      DocumentSnapshot ds = await _firestore.collection("users").doc(user?.uid).get();
      String firstName = ds.get('firstName');
      String lastName = ds.get('lastName');
      return [firstName ,lastName];
    } catch (e) {
      print(e);
      return null;
    }
  }
}
