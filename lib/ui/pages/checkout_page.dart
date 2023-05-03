import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mbs/objects/customer.dart';
import 'package:mbs/objects/movie.dart';
import 'package:mbs/objects/ticket.dart';
import 'package:mbs/ui/pages/firebase_central.dart';
import 'package:mbs/ui/pages/menu_page.dart';
import 'package:mbs/ui/pages/navigationBar.dart';

class checkoutPage extends StatefulWidget {
  final double price;
  final DateTime date;
  final int tickets;

  const checkoutPage({
    required this.price,
    required this.date,
    required this.tickets,
    super.key,
  });

  @override
  State<checkoutPage> createState() => _checkoutPageState();
}

int? _card = 2;

class _checkoutPageState extends State<checkoutPage> {
  MovieController movieController = Get.find();
  CustomerController customerController = Get.find<CustomerController>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
          child: Center(
        child: Padding(
          padding: const EdgeInsets.all(18.0),
          child: SingleChildScrollView(
            child: Column(
              children: [
                Row(
                  children: [
                    Expanded(
                        flex: 1,
                        child: IconButton(
                          icon: const Icon(
                            Icons.arrow_back,
                            color: Colors.white,
                          ),
                          onPressed: () {
                            Get.back();
                          },
                        )),
                    const Expanded(
                      flex: 4,
                      child: Text(
                        'CHECKOUT',
                        style: TextStyle(
                            color: Colors.white,
                            fontWeight: FontWeight.w600,
                            fontSize: 35),
                      ),
                    ),
                  ],
                ),
                const Divider(
                  height: 15,
                  thickness: 3,
                  color: Colors.white,
                ),
                Row(
                  children: const [
                    Text(
                      "PAYMENT METHOD",
                      style: TextStyle(
                          color: Colors.white,
                          fontSize: 25,
                          fontWeight: FontWeight.w500),
                    ),
                    Icon(
                      Icons.question_mark_rounded,
                      size: 20,
                      color: Colors.white,
                    )
                  ],
                ),
                const SizedBox(
                  height: 30,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    Column(
                      children: [
                        GestureDetector(
                          onTap: () {
                            print('click pigPal');
                          },
                          child: Container(
                            width: 100,
                            height: 50,
                            decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.circular(14),
                              boxShadow: const [
                                BoxShadow(
                                  color: Color.fromARGB(255, 48, 2, 58),
                                  blurRadius: 5,
                                  offset: Offset(0, 1), // Shadow position
                                ),
                              ],
                            ),
                            child: const Icon(
                              Icons.savings,
                              color: Color.fromARGB(255, 255, 55, 165),
                            ),
                          ),
                        ),
                        const Text("pigPal",
                            style: TextStyle(
                                color: Colors.white,
                                fontSize: 20,
                                fontWeight: FontWeight.w400)),
                      ],
                    ),
                    Column(
                      children: [
                        GestureDetector(
                          onTap: () {
                            print('click credit card');
                          },
                          child: Container(
                            width: 100,
                            height: 50,
                            decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.circular(14),
                              boxShadow: const [
                                BoxShadow(
                                  color: Color.fromARGB(255, 48, 2, 58),
                                  blurRadius: 5,
                                  offset: Offset(0, 1), // Shadow position
                                ),
                              ],
                            ),
                            child: const Icon(
                              Icons.credit_card,
                              color: Colors.amber,
                            ),
                          ),
                        ),
                        const Text("credit card",
                            style: TextStyle(
                                color: Colors.white,
                                fontSize: 20,
                                fontWeight: FontWeight.w400))
                      ],
                    ),
                  ],
                ),
                const SizedBox(
                  height: 30,
                ),
                const Align(
                  alignment: Alignment.centerLeft,
                  child: Text('SELECT YOUR CARD',
                      style: TextStyle(
                          color: Colors.white,
                          fontSize: 25,
                          fontWeight: FontWeight.w500)),
                ),
                Column(
                  children: <Widget>[
                    Card('VISA XXX XXXXX', 0, _card),
                    Card('MASTER XXXXXX XX', 1, _card),
                    Card('DEBIT XX XX XX', 2, _card),
                    Card('CAFE XOXOXOXOX', 0, _card),
                  ],
                ),
                const Align(
                  alignment: Alignment.centerLeft,
                  child: Text('ITEMS',
                      style: TextStyle(
                          color: Colors.white,
                          fontSize: 25,
                          fontWeight: FontWeight.w500)),
                ),
                Container(
                  margin: const EdgeInsets.all(10),
                  decoration: BoxDecoration(
                    color: const Color.fromARGB(48, 173, 162, 162),
                    borderRadius: BorderRadius.circular(14),
                    boxShadow: const [
                      BoxShadow(
                        color: Color.fromARGB(255, 48, 2, 58),
                        blurRadius: 5,
                        offset: Offset(0, 1), // Shadow position
                      ),
                    ],
                  ),
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        Text("x${widget.tickets}",
                            style: const TextStyle(
                                color: Colors.white,
                                fontSize: 25,
                                fontWeight: FontWeight.w500)),
                        const Icon(
                          Icons.airplane_ticket,
                          color: Color.fromARGB(255, 54, 243, 63),
                        ),
                        Text(movieController.selectedMovie.name,
                            style: const TextStyle(
                                color: Colors.white,
                                fontSize: 15,
                                fontWeight: FontWeight.w500))
                      ],
                    ),
                  ),
                ),
                const SizedBox(
                  height: 30,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    const Text('TOTAL',
                        style: TextStyle(
                            color: Colors.white,
                            fontSize: 25,
                            fontWeight: FontWeight.w500)),
                    Text('${widget.price}',
                        style: const TextStyle(
                            color: Colors.white,
                            fontSize: 25,
                            fontWeight: FontWeight.w500))
                  ],
                ),
                const SizedBox(
                  height: 20,
                ),
                Container(
                  width: double.infinity,
                  child: TextButton(
                    onPressed: () {
                      Movie movie = movieController.selectedMovie;

                      //String that contains information of the movie, id of the customer and number of tickets
                      String _barcode = movie.id.toString() +
                          customerController.customer.id.toString() +
                          widget.tickets.toString();

                      Ticket ticket = Ticket(
                          movie,
                          widget.tickets,
                          widget.price,
                          _barcode,
                          customerController.customer,
                          "Lubbock",
                          widget.date);
                      ticket.addToCustomer();

                      Get.offAll(const FirebaseCentral());
                    },
                    style: TextButton.styleFrom(
                        foregroundColor: Colors.red,
                        elevation: 2,
                        backgroundColor: Colors.amber),
                    child: const Text(
                      'Pay',
                      style: TextStyle(fontSize: 40),
                    ),
                  ),
                )
              ],
            ),
          ),
        ),
      )),
    );
  }
}

class Card extends StatefulWidget {
  Card(this.cardName, this.i, this.card, {super.key});
  final String cardName;
  final int i;
  int? card;

  @override
  State<Card> createState() => _CardState();
}

class _CardState extends State<Card> {
  @override
  Widget build(BuildContext context) {
    return ListTile(
      title: Text(
        widget.cardName,
        style: const TextStyle(color: Colors.white),
      ),
      leading: Radio<int>(
        value: widget.i,
        groupValue: _card,
        onChanged: (int? value) {
          setState(() {
            _card = value;
          });
        },
      ),
    );
  }
}
