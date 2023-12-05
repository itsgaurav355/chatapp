import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class AuthService extends ChangeNotifier {
  //creating instance of the firebase
  final FirebaseAuth _firebaseAuth = FirebaseAuth.instance;

  //creating new instance for firestore to store msgs
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;

  //sign in method
  Future<UserCredential> signInWithEmailPassword(
      String email, String password) async {
    try {
      UserCredential userCredential =
          await _firebaseAuth.signInWithEmailAndPassword(
        email: email,
        password: password,
      );
      //after creating user creating a document for storing the msgsin users collection for user
      _firestore.collection('users').doc(userCredential.user!.uid).set({
        'uid': userCredential.user!.uid,
        'email': email,
      }, SetOptions(merge: true));
      return userCredential;
    } on FirebaseAuthException catch (e) {
      throw Exception(e.code);
    }
  }

  //sign out method
  Future<void> signOut() async {
    return await _firebaseAuth.signOut();
  }

  //sign up method
  Future<UserCredential> signUpUserWithCredentials(
    String email,
    String password,
  ) async {
    try {
      UserCredential userCredential = await _firebaseAuth
          .createUserWithEmailAndPassword(email: email, password: password);
      //after creating user creating a document for storing the msgsin users collection for user
      _firestore.collection('users').doc(userCredential.user!.uid).set({
        'uid': userCredential.user!.uid,
        'email': email,
      });
      return userCredential;
    } on FirebaseAuthException catch (e) {
      throw Exception(e.code);
    }
  }
}
