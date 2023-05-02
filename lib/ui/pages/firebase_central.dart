import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:mbs/ui/pages/login_page.dart';
import 'package:mbs/ui/pages/navigationBar.dart';

class FirebaseCentral extends StatelessWidget {
  const FirebaseCentral({super.key});

  @override
  Widget build(BuildContext context) {
    return StreamBuilder(
      stream: FirebaseAuth.instance.authStateChanges(),
      builder: (context, snapshot) {
        if (snapshot.hasData) {
          return const NavPage();
        } else {
          return const LoginPage();
        }
      },
    );
  }
}
