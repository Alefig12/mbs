import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mbs/objects/admin.dart';
import 'package:mbs/objects/customer.dart';
import 'package:mbs/objects/movie.dart';
import 'package:mbs/ui/app.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  Get.put(MovieController());
  Get.put(CustomerController());
  Get.put(AdminController());
  runApp(const MBS());
}
