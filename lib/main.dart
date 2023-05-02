import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mbs/objects/admin.dart';
import 'package:mbs/objects/customer.dart';
import 'package:mbs/objects/movie.dart';
import 'package:mbs/ui/app.dart';

void main() {
  Get.put(MovieController());
  Get.put(CustomerController());
  Get.put(AdminController());
  runApp(const MBS());
}
