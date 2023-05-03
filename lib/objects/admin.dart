import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:get/get.dart';
import 'package:mbs/objects/person.dart';

class Admin extends Person {
  Admin(int id, String name, String email) : super(id, name);
}

class AdminController extends GetxController {
  final _isAdmin = false.obs;

  void setAdmin(bool value) {
    _isAdmin.value = value;
  }

  bool isAdmin() {
    return _isAdmin.value;
  }

  Future<int> getTotalNumberOfTickets() async {
    int total = 0;

    //Get totl number of tickets of each customer from firebase

    final databaseRef = FirebaseDatabase.instance.ref();

    await databaseRef.child("customers").get().then((DataSnapshot snapshot) {
      Map<dynamic, dynamic> values = snapshot.value as Map;
      values.forEach((key, values) {
        if (values["tickets"] != null) {
          print(values["tickets"]);
          total += values["tickets"].length as int;
        }
      });
    });

    return total;
  }
}
