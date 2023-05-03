import 'package:mbs/objects/customer.dart';
import 'package:mbs/objects/movie.dart';

class Ticket {
  late final int _id;
  final Movie _movie;
  int _numberOfSeats;
  double _price;
  String _barcode;
  String _cinemaName;
  DateTime _showTime;

  Customer _customer;

  Ticket(this._movie, this._numberOfSeats, this._price, this._barcode,
      this._customer, this._cinemaName, this._showTime) {}

  int get id => _id;

  Movie get movie => _movie;

  int get numberOfSeats => _numberOfSeats;

  double get price => _price;

  String get barcode => _barcode;

  Customer get customer => _customer;

  String get cinemaName => _cinemaName;

  DateTime get showTime => _showTime;

  set numberOfSeats(int numberOfSeats) {
    _numberOfSeats = numberOfSeats;
  }

  set price(double price) {
    _price = price;
  }

  set barcode(String barcode) {
    _barcode = barcode;
  }

  set customer(Customer customer) {
    _customer = customer;
  }

  set cinemaName(String cinemaName) {
    _cinemaName = cinemaName;
  }

  set showTime(DateTime showTime) {
    _showTime = showTime;
  }

  set id(int id) {
    _id = id;
  }

  void editTicket(int numberOfSeats, double price, String barcode,
      int auditoriumID, Customer customer) {
    _numberOfSeats = numberOfSeats;
    _price = price;
    _barcode = barcode;
    _customer = customer;
  }

  void addToCustomer() {
    _customer.addTicket(this);
  }

  void deleteTicket() {
    _customer.tickets.remove(this);
  }
}
