import 'package:flutter/material.dart';
import 'package:get/get.dart';

class checkoutPage extends StatefulWidget {
  const checkoutPage({super.key});

  @override
  State<checkoutPage> createState() => _checkoutPageState();
}

int? _card = 2;

class _checkoutPageState extends State<checkoutPage> {
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
                          icon: Icon(
                            Icons.arrow_back,
                            color: Colors.white,
                          ),
                          onPressed: () {
                            Get.back();
                          },
                        )),
                    Expanded(
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
                Divider(
                  height: 15,
                  thickness: 3,
                  color: Colors.white,
                ),
                Row(
                  children: [
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
                SizedBox(
                  height: 30,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Container(
                      width: 100,
                      height: 50,
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(14),
                        boxShadow: [
                          BoxShadow(
                            color: Color.fromARGB(255, 48, 2, 58),
                            blurRadius: 5,
                            offset: Offset(0, 1), // Shadow position
                          ),
                        ],
                      ),
                      child: Icon(
                        Icons.savings,
                        color: Color.fromARGB(255, 255, 55, 165),
                      ),
                    ),
                    SizedBox(
                      width: 40,
                    ),
                    Container(
                      width: 100,
                      height: 50,
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(14),
                        boxShadow: [
                          BoxShadow(
                            color: Color.fromARGB(255, 48, 2, 58),
                            blurRadius: 5,
                            offset: Offset(0, 1), // Shadow position
                          ),
                        ],
                      ),
                      child: Icon(
                        Icons.credit_card,
                        color: Colors.amber,
                      ),
                    )
                  ],
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text("pigPal",
                        style: TextStyle(
                            color: Colors.white,
                            fontSize: 20,
                            fontWeight: FontWeight.w400)),
                    SizedBox(
                      width: 70,
                    ),
                    Text("credit card",
                        style: TextStyle(
                            color: Colors.white,
                            fontSize: 20,
                            fontWeight: FontWeight.w400))
                  ],
                ),
                SizedBox(
                  height: 30,
                ),
                Align(
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
                Align(
                  alignment: Alignment.centerLeft,
                  child: Text('ITEMS',
                      style: TextStyle(
                          color: Colors.white,
                          fontSize: 25,
                          fontWeight: FontWeight.w500)),
                ),
                Container(
                  margin: EdgeInsets.all(10),
                  decoration: BoxDecoration(
                    color: Color.fromARGB(48, 173, 162, 162),
                    borderRadius: BorderRadius.circular(14),
                    boxShadow: [
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
                        Text("x1",
                            style: TextStyle(
                                color: Colors.white,
                                fontSize: 25,
                                fontWeight: FontWeight.w500)),
                        Icon(
                          Icons.airplane_ticket,
                          color: Color.fromARGB(255, 54, 243, 63),
                        ),
                        Text("Legend of white snake",
                            style: TextStyle(
                                color: Colors.white,
                                fontSize: 15,
                                fontWeight: FontWeight.w500))
                      ],
                    ),
                  ),
                ),
                SizedBox(
                  height: 30,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text('TOTAL',
                        style: TextStyle(
                            color: Colors.white,
                            fontSize: 25,
                            fontWeight: FontWeight.w500)),
                    Text('15.00 USD',
                        style: TextStyle(
                            color: Colors.white,
                            fontSize: 25,
                            fontWeight: FontWeight.w500))
                  ],
                ),
                SizedBox(
                  height: 20,
                ),
                Container(
                  width: double.infinity,
                  child: TextButton(
                    child: Text(
                      'Pay',
                      style: TextStyle(fontSize: 40),
                    ),
                    onPressed: () {
                      Get.to(checkoutPage());
                    },
                    style: TextButton.styleFrom(
                        foregroundColor: Colors.red,
                        elevation: 2,
                        backgroundColor: Colors.amber),
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
  Card(String this.cardName, int this.i, int? this.card, {super.key});
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
        style: TextStyle(color: Colors.white),
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
