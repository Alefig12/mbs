import 'package:firebase_auth/firebase_auth.dart';
import 'package:get/get.dart';
import 'package:flutter/material.dart';

class AuthenticationController extends GetxController {
  Future<String> login(email, password) async {
    try {
      print("Entre");
      UserCredential userCredential = await FirebaseAuth.instance
          .signInWithEmailAndPassword(email: email, password: password);

      return Future.value("success");
    } on FirebaseAuthException catch (e) {
      if (e.code == 'user-not-found') {
        return Future.value(e.code);
      } else if (e.code == 'wrong-password') {
        return Future.value(e.code);
      }
      print("a");
      return Future.value(e.code);
    } catch (e) {
      print("pos");
      print(e);
      return Future.value(e.toString());
    }
  }

  Future<String> signup(email, password, username) async {
    try {
      UserCredential userCredential = await FirebaseAuth.instance
          .createUserWithEmailAndPassword(email: email, password: password);

      logout();

      return Future.value("success");
    } on FirebaseAuthException catch (e) {
      if (e.code == 'email-already-in-use') {
        return Future.value(e.code);
      }
      return Future.value(e.code);
    } catch (e) {
      print(e.toString());
      return Future.value(e.toString());
    }
  }

  Future<void> logout() async {
    await FirebaseAuth.instance.signOut();
    return Future.value();
  }
}
