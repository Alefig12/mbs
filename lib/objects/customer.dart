import 'package:get/get.dart';
import 'package:mbs/objects/movie.dart';
import 'package:mbs/objects/payment.dart';
import 'package:mbs/objects/person.dart';
import 'package:mbs/objects/ticket.dart';

class Customer extends Person {
  final String _homeAddress;
  String _phoneNo;
  List<Ticket> _tickets = [];
  List<Payment> _payments = [];
  List<Movie> _movies = [];

  Customer(
      int id, String name, String password, this._homeAddress, this._phoneNo)
      : super(id, name, password);

  String get homeAddress => _homeAddress;

  String get phoneNo => _phoneNo;

  List<Ticket> get tickets => _tickets;

  List<Payment> get payments => _payments;

  List<Movie> get movies => _movies;

  set phoneNo(String phoneNo) {
    _phoneNo = phoneNo;
  }

  set tickets(List<Ticket> tickets) {
    _tickets = tickets;
  }

  set payments(List<Payment> payments) {
    _payments = payments;
  }

  set movies(List<Movie> movies) {
    _movies = movies;
  }

  void addTicket(Ticket ticket) {
    _tickets.add(ticket);
  }

  void addPayment(Payment payment) {
    _payments.add(payment);
  }

  void addMovie(Movie movie) {
    _movies.add(movie);
  }

  void removeTicket(Ticket ticket) {
    _tickets.remove(ticket);
  }

  void removePayment(Payment payment) {
    _payments.remove(payment);
  }

  void removeMovie(Movie movie) {
    _movies.remove(movie);
  }
}

class CustomerController extends GetxController {
  CustomerController() {
    _customer =
        Customer(0, 'The Customer', '12346', 'University Ave', '3002145896');
  }

  late Customer _customer;

  Customer get customer => _customer;

  set customer(Customer customer) {
    _customer = customer;
  }
}
