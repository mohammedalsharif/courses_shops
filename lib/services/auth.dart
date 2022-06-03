import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';

import '../model/Courses.dart';

class MyUser {
  String? uid;
  String? firstName;
  String? lastName;
  String? email;

  MyUser({this.uid, this.firstName, this.lastName, this.email});

  MyUser.fromJson(Map<String, dynamic> json) {
    uid = json['id'];
    firstName = json['firstName'];
    lastName = json['lastName'];
    email = json['email'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['uid'] = this.uid;
    data['email'] = this.email;
    data['firstName'] = this.firstName;
    data['lastName'] = this.lastName;
    return data;
  }
}

class AuthFireBase {
  // AuthFireBase._();

  FirebaseFirestore _firestore = FirebaseFirestore.instance;
  static AuthFireBase authFireBase = AuthFireBase();

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

  List<Courses> coursesList = [];

  Future<QuerySnapshot<Map<String, dynamic>>> getCourses() async {
    QuerySnapshot<Map<String, dynamic>> snapshot =
        await _firestore.collection("courses").get();
    return snapshot;
  }

   getAllCourses() async {
    QuerySnapshot<Map<String, dynamic>> snapshot =
        await AuthFireBase.authFireBase.getCourses();
    coursesList.clear();
    for (var item in snapshot.docs) {
      coursesList.add(Courses.fromJson(item.data()));
    }
  }
}
