import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mbs/ui/pages/login_page.dart';

class MBS extends StatelessWidget {
  const MBS({super.key});

  @override
  Widget build(BuildContext context) {
    return const GetMaterialApp(
      title: 'MBS',
      home: LoginPage(),
    );
  }
}
