import 'package:mbs/objects/customer.dart';

class Ticket {
  final int _id;
  final int _movieID;
  int _numberOfSeats;
  double _price;
  String _barcode;
  int _auditoriumID;
  Customer _customer;

  Ticket(this._id, this._movieID, this._numberOfSeats, this._price,
      this._barcode, this._auditoriumID, this._customer);

  int get id => _id;

  int get movieID => _movieID;

  int get numberOfSeats => _numberOfSeats;

  double get price => _price;

  String get barcode => _barcode;

  int get auditoriumID => _auditoriumID;

  Customer get customer => _customer;

  set numberOfSeats(int numberOfSeats) {
    _numberOfSeats = numberOfSeats;
  }

  set price(double price) {
    _price = price;
  }

  set barcode(String barcode) {
    _barcode = barcode;
  }

  set auditoriumID(int auditoriumID) {
    _auditoriumID = auditoriumID;
  }

  set customer(Customer customer) {
    _customer = customer;
  }

  void editTicket(int numberOfSeats, double price, String barcode,
      int auditoriumID, Customer customer) {
    _numberOfSeats = numberOfSeats;
    _price = price;
    _barcode = barcode;
    _auditoriumID = auditoriumID;
    _customer = customer;
  }

  void deleteTicket() {
    _customer.tickets.remove(this);
  }
}
