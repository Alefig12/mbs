import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mbs/ui/pages/buyTickets_page.dart';
import 'package:mbs/ui/pages/firebase_central.dart';
import 'package:mbs/ui/pages/login_page.dart';
import 'package:mbs/ui/pages/main_page.dart';
import 'package:mbs/ui/pages/menu_page.dart';
import 'package:mbs/ui/pages/navigationBar.dart';
import 'package:mbs/ui/pages/profile_page.dart';
import 'package:mbs/ui/pages/review_page.dart';
import 'package:mbs/ui/pages/tickets_page.dart';
import 'package:mbs/ui/pages/signup_page.dart';
import 'package:mbs/ui/pages/addmovie_page.dart';

class MBS extends StatelessWidget {
  const MBS({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: 'MBS',
      theme: ThemeData(
          scaffoldBackgroundColor: const Color.fromARGB(255, 43, 4, 56)),
      home: const FirebaseCentral(), // change back to login page
    );
  }
}
