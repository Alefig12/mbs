class Person {
  int _id;
  String _username;
  String _password;

  Person(this._id, this._username, this._password);

  int get id => _id;

  String get username => _username;

  String get password => _password;

  set username(String username) {
    _username = username;
  }

  set password(String password) {
    _password = password;
  }
}
