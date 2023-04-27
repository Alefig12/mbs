// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mbs/ui/pages/checkout_page.dart';
import '../widget/movieProfile.dart';
import 'package:intl/intl.dart';

class buyTicketPage extends StatefulWidget {
  String movieName;
  ImageProvider<Object> movieImage;

  buyTicketPage({
    super.key,
    required this.movieName,
    required this.movieImage,
  });

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

  Widget build(BuildContext context) {
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
                  movieGenders: [''],
                  movieImage: widget.movieImage,
                ),
              ),
            ),
            Expanded(
                flex: 2,
                child: Row(
                  children: [
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
                      DateTime? pickedDate = await showDatePicker(
                          context: context,
                          initialDate: DateTime.now(), //get today's date
                          firstDate: DateTime(
                              2000), //DateTime.now() - not to allow to choose before today.
                          lastDate: DateTime(2101));
                      if (pickedDate != null) {
                        String formattedDate =
                            DateFormat("mm-dd-yyyy").format(pickedDate);
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
                        boxShadow: [
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
                            }
                          });
                        },
                      ),
                    ),
                    Text(
                      "${_counter}",
                      style: TextStyle(color: Colors.white, fontSize: 30),
                    ),
                    Container(
                      decoration: BoxDecoration(
                        color: Color.fromARGB(255, 188, 55, 190),
                        borderRadius: BorderRadius.circular(25),
                        boxShadow: [
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
                            _counter++;
                            _price = 15.99 * _counter;
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
                        child: Text("${_price}",
                            style:
                                TextStyle(color: Colors.white, fontSize: 20))),
                    Expanded(
                        flex: 2,
                        child: Container(
                          width: 100,
                          child: TextButton(
                            child: Text('Pay'),
                            onPressed: () {
                              Get.to(checkoutPage());
                            },
                            style: TextButton.styleFrom(
                                foregroundColor: Colors.red,
                                elevation: 2,
                                backgroundColor: Colors.amber),
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
