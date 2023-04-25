import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mbs/ui/pages/login_page.dart';
import 'package:mbs/ui/pages/menu_page.dart';
import 'package:mbs/ui/pages/profile_page.dart';
import 'package:mbs/ui/pages/tickets_page.dart';

class MBS extends StatelessWidget {
  const MBS({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: 'MBS',
      theme: ThemeData(scaffoldBackgroundColor: Color.fromARGB(255, 43, 4, 56)),
      home:
          LoginPage(), // change back to login page// change back to login page
    );
  }
}
