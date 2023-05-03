import 'dart:math';

import 'package:firebase_database/firebase_database.dart';
import 'package:get/get.dart';
import 'package:mbs/objects/admin.dart';
import 'package:mbs/objects/movie.dart';
import 'package:mbs/objects/payment.dart';
import 'package:mbs/objects/person.dart';
import 'package:mbs/objects/ticket.dart';

class Customer extends Person {
  late final String _homeAddress;
  late String _phoneNo;
  List<Ticket> _tickets = [];
  List<Payment> _payments = [];
  List<Movie> _movies = [];

  Customer(int id, String name) : super(id, name);

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
    CustomerController customerController = Get.find();
    customerController.addTicketToCustomer(ticket: ticket);
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

  @override
  String toString() {
    return 'Customer {id: $id, name: $username}';
  }
}

class CustomerController extends GetxController {
  CustomerController() {
    _customer = Customer(408576, 'd@d.com');
  }

  late Customer _customer;

  Customer get customer => _customer;

  set customer(Customer customer) {
    _customer = customer;
  }

  Future<void> addCustomerToDatabase(String email) async {
    // generate random id
    Random random = Random();
    int id = random.nextInt(1000000);
    // add customer to database
    final databaseRef = FirebaseDatabase.instance.ref();
    await databaseRef.child('customers').child(id.toString()).set({
      'id': id,
      'name': email,
    });
  }

  Future<void> getCustomerFromDatabase(String email) async {
    final databaseRef = FirebaseDatabase.instance.ref();
    DataSnapshot dataSnapshot = await databaseRef.child('customers').get();
    Map<dynamic, dynamic> customers = dataSnapshot.value as Map;
    print(customers);
    customers.forEach((key, value) async {
      if (value['name'] == email) {
        _customer = Customer(value['id'], value['name']);
        print(_customer);

        //get tickets
        List<Ticket> tickets = [];
        dataSnapshot = await databaseRef
            .child('customers')
            .child(key)
            .child('tickets')
            .get();

        if (dataSnapshot.value != null) {
          List<dynamic> ticketsList = value['tickets'] as List<dynamic>;
          int i = 0;
          print(ticketsList);

          ticketsList.forEach((value) {
            if (i != 0) {
              //Ticket ticket = Ticket(_movie, _numberOfSeats, _price, _barcode, _customer, _cinemaName, _showTime)
              String barcode = value['barcode'].toString();
              String cinemaName = value['cinemaName'];

              MovieController movieController = Get.find();
              Movie movie = movieController.searchMovieById(value['movie']);
              int numberOfSeats = value['numberOfSeats'];
              double price = value['price'];
              DateTime showTime = DateTime.parse(value['showTime']);

              Ticket ticket = Ticket(movie, numberOfSeats, price, barcode,
                  _customer, cinemaName, showTime);

              //look for movie with id

              ticket.id = value['id'];
              tickets.add(ticket);
            }
            i++;

            _customer.tickets = tickets;
          });
        }
      }

      AdminController adminController = Get.find();

      if (_customer.id == 1) {
        adminController.setAdmin(true);
      }
    });
  }

  Future<void> addTicketToCustomer({required Ticket ticket}) async {
    List<Ticket> tickets = _customer.tickets;
    int newId = tickets.isEmpty ? 1 : tickets.last.id + 1;

    ticket.id = newId;

    tickets.add(ticket);

    // add ticket to customer
    final databaseRef = FirebaseDatabase.instance.ref();

    await databaseRef
        .child('customers')
        .child(_customer.id.toString())
        .child('tickets')
        .child(ticket.id.toString())
        .set({
      'id': ticket.id,
      'movie': ticket.movie.id,
      'numberOfSeats': ticket.numberOfSeats,
      'price': ticket.price,
      'barcode': ticket.barcode,
      'cinemaName': ticket.cinemaName,
      'showTime': ticket.showTime.toString(),
    });
  }
}
