import 'package:get/get.dart';
import 'package:mbs/objects/person.dart';

class Admin extends Person {
  Admin(int id, String name, String email, String password)
      : super(id, name, password);
}

class AdminController extends GetxController {
  final _isAdmin = true.obs;

  void setAdmin(bool value) {
    _isAdmin.value = value;
  }

  bool isAdmin() {
    return _isAdmin.value;
  }

  int getTotalNumberOfTickets() {
    int total = 0;

    //Get number of tickets from firebase when it's ready

    return total;
  }
}
