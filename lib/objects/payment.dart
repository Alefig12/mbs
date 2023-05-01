import 'package:mbs/objects/customer.dart';

class Payment {
  final int _id;
  double _amount;
  String _paymentMethod;
  Customer _customer;

  Payment(this._id, this._amount, this._paymentMethod, this._customer);

  int get id => _id;

  double get amount => _amount;

  String get paymentMethod => _paymentMethod;

  Customer get customer => _customer;

  set amount(double amount) {
    _amount = amount;
  }

  set paymentMethod(String paymentMethod) {
    _paymentMethod = paymentMethod;
  }

  set customer(Customer customer) {
    _customer = customer;
  }
}
