// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mbs/objects/movie.dart';
import 'package:mbs/ui/pages/checkout_page.dart';
import '../widget/movieProfile.dart';
import 'package:intl/intl.dart';

class buyTicketPage extends StatefulWidget {
  late String movieName;
  ImageProvider<Object> movieImage;
  Movie movie;

  buyTicketPage({
    super.key,
    required this.movie,
    required this.movieImage,
  }) {
    movieName = movie.name;
  }

  @override
  State<buyTicketPage> createState() => _buyTicketPageState();
}

class _buyTicketPageState extends State<buyTicketPage> {
  final ScrollController scrollController = ScrollController();
  TextEditingController dateController = TextEditingController();
  int _counter = 0;
  double _price = 0;
  @override
  void initState() {
    super.initState();
    dateController.text = "";
  }

  DateTime? pickedDate;

  Widget build(BuildContext context) {
    MovieController movieController = Get.find<MovieController>();
    return SafeArea(
        child: Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(18.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
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
                    'Buy Tickets',
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
            Expanded(
              flex: 8,
              child: Padding(
                padding: const EdgeInsets.only(top: 8.0),
                child: posterMovie(
                  movieName: widget.movieName,
                  movieGenders: widget.movie.genres,
                  movieImage: widget.movieImage,
                ),
              ),
            ),
            Expanded(
                flex: 2,
                child: Row(
                  children: const [
                    Icon(
                      Icons.place,
                      color: Colors.white,
                    ),
                    Text('Cinemark Movies 16 and XD',
                        style: TextStyle(
                            color: Colors.white,
                            fontWeight: FontWeight.w600,
                            fontSize: 25))
                  ],
                )),
            Expanded(
                flex: 1,
                child: Padding(
                  padding: const EdgeInsets.only(left: 25.0),
                  child: Align(
                    alignment: Alignment.centerLeft,
                    child: Text('5721 58th St, Lubbock, TX 87643',
                        style: TextStyle(
                            color: Color.fromARGB(255, 236, 124, 238),
                            fontWeight: FontWeight.w500,
                            fontSize: 15)),
                  ),
                )),
            SizedBox(
              height: 10,
            ),
            Expanded(
                flex: 2,
                child: TextField(
                    controller:
                        dateController, //editing controller of this TextField
                    decoration: const InputDecoration(
                        icon: Icon(
                          Icons.calendar_today,
                          color: Colors.white,
                        ), //icon of text field
                        labelText: "Enter Date",
                        labelStyle:
                            TextStyle(color: Color.fromARGB(255, 61, 2, 54)),
                        floatingLabelStyle: TextStyle(
                            color: Color.fromARGB(255, 61, 2, 54),
                            fontWeight: FontWeight.w800),
                        filled: true,
                        fillColor: Colors.white
                        //label text of field
                        ),
                    readOnly: true, // when true user cannot edit text
                    onTap: () async {
                      pickedDate = await showDatePicker(
                          context: context,
                          initialDate: DateTime.now(), //get today's date
                          firstDate: DateTime(
                              2000), //DateTime.now() - not to allow to choose before today.
                          lastDate: DateTime(2101));
                      if (pickedDate != null) {
                        String formattedDate =
                            DateFormat("MM-dd-yyyy").format(pickedDate!);
                        print(
                            formattedDate); //pickedDate output format => 2019-03-10
                        setState(() {
                          dateController.text = formattedDate.toString();
                        });
                      } else {
                        print("not selected");
                      }
                    })),
            SizedBox(
              height: 20,
            ),
            Expanded(
                flex: 2,
                child: Text('TICKETS TO PURCHASE',
                    style: TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.w600,
                        fontSize: 25))),
            Expanded(
                flex: 2,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Container(
                      decoration: BoxDecoration(
                        color: Color.fromARGB(255, 188, 55, 190),
                        borderRadius: BorderRadius.circular(25),
                        boxShadow: const [
                          BoxShadow(
                            color: Color.fromARGB(255, 48, 2, 58),
                            blurRadius: 5,
                            offset: Offset(0, 1), // Shadow position
                          ),
                        ],
                      ),
                      child: IconButton(
                        icon: Icon(Icons.remove),
                        onPressed: () {
                          setState(() {
                            if (_counter > 0) {
                              _counter--;
                              _price = 15.99 * _counter;
                              _price = double.parse(_price.toStringAsFixed(2));
                            }
                          });
                        },
                      ),
                    ),
                    Text(
                      "$_counter",
                      style: TextStyle(color: Colors.white, fontSize: 30),
                    ),
                    Container(
                      decoration: BoxDecoration(
                        color: Color.fromARGB(255, 188, 55, 190),
                        borderRadius: BorderRadius.circular(25),
                        boxShadow: const [
                          BoxShadow(
                            color: Color.fromARGB(255, 48, 2, 58),
                            blurRadius: 5,
                            offset: Offset(0, 1), // Shadow position
                          ),
                        ],
                      ),
                      child: IconButton(
                        icon: Icon(Icons.add),
                        onPressed: () {
                          setState(() {
                            //user can only buy 10 tickets
                            if (_counter < 10) _counter++;

                            _price = 15.99 * _counter;
                            _price = double.parse(_price.toStringAsFixed(2));
                          });
                        },
                      ),
                    ),
                  ],
                )),
            Expanded(
                flex: 3,
                child: Row(
                  children: [
                    Expanded(
                        flex: 2,
                        child: Text("$_price",
                            style:
                                TextStyle(color: Colors.white, fontSize: 20))),
                    Expanded(
                        flex: 2,
                        child: Container(
                          width: 100,
                          child: TextButton(
                            onPressed: () {
                              if (_counter == 0) {
                                Get.snackbar(
                                    'Error', 'Please select a ticket to buy',
                                    snackPosition: SnackPosition.BOTTOM,
                                    backgroundColor: Colors.red,
                                    colorText: Colors.white,
                                    duration: const Duration(seconds: 2));
                                return;
                              }
                              if (pickedDate == null) {
                                Get.snackbar(
                                  'Error',
                                  'Please select a date to continue',
                                  snackPosition: SnackPosition.BOTTOM,
                                  backgroundColor: Colors.red,
                                  colorText: Colors.white,
                                );
                                return;
                              }

                              Get.to(checkoutPage(
                                  price: _price,
                                  date: pickedDate!,
                                  tickets: _counter));
                            },
                            style: TextButton.styleFrom(
                                foregroundColor: Colors.red,
                                elevation: 2,
                                backgroundColor: Colors.amber),
                            child: Text('Pay'),
                          ),
                        ))
                  ],
                ))
          ],
        ),
      ),
    ));
  }
}
