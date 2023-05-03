class Person {
  int _id;
  String _username;

  Person(this._id, this._username);

  int get id => _id;

  String get username => _username;

  set username(String username) {
    _username = username;
  }
}
