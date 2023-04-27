import 'package:get/get.dart';
import 'package:mbs/ui/pages/buyTickets_page.dart';
import 'package:mbs/ui/pages/review_page.dart';

import '../widget/movieProfile.dart';
import 'package:flutter/material.dart';

class selectedMoviePage extends StatefulWidget {
  const selectedMoviePage({super.key});

  @override
  State<selectedMoviePage> createState() => _selectedMoviePageState();
}

class _selectedMoviePageState extends State<selectedMoviePage> {
  List<String> genders = ['fiction', 'fantasy', 'action'];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
          child: Center(
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
                    'Movie Name',
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
            Padding(
              padding: const EdgeInsets.all(28.0),
              child: Container(width: 400, height: 180, child: Movie()),
            ),
            Text(
              genders[0] + ', ' + genders[1] + ', ' + genders[2],
              style: TextStyle(
                  color: Color.fromARGB(255, 255, 145, 48),
                  fontWeight: FontWeight.w600,
                  fontSize: 20),
            ),
            Padding(
              padding: const EdgeInsets.all(30.0),
              child: Container(
                height: 200,
                padding: EdgeInsets.all(18),
                width: double.infinity,
                decoration: BoxDecoration(
                  color: Color.fromARGB(255, 255, 255, 255),
                  borderRadius: BorderRadius.circular(25),
                  boxShadow: [
                    BoxShadow(
                      color: Color.fromARGB(255, 48, 2, 58),
                      blurRadius: 5,
                      offset: Offset(0, 1), // Shadow position
                    ),
                  ],
                ),
                child: SingleChildScrollView(
                  child: Column(
                    children: [
                      Align(
                        alignment: Alignment.centerLeft,
                        child: Text(
                          'User Reviews',
                          style: TextStyle(
                              color: Color.fromARGB(255, 0, 0, 0),
                              fontWeight: FontWeight.w700,
                              fontSize: 20),
                        ),
                      ),
                      SizedBox(
                        height: 20,
                      ),
                      review('Sthephany', 'I don´t know what im doing here'),
                      SizedBox(
                        height: 20,
                      ),
                      review('Alex',
                          'I really like it, it had plenty action and fiction'),
                      SizedBox(
                        height: 20,
                      ),
                      review('Miguel', 'I don´t know what im doing here'),
                      SizedBox(
                        height: 20,
                      ),
                      review(
                          'Roberto', 'This movie is the greatest of all times.')
                    ],
                  ),
                ),
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Container(
                  decoration: BoxDecoration(
                    color: Color.fromARGB(58, 255, 255, 255),
                    borderRadius: BorderRadius.circular(10),
                    boxShadow: [
                      BoxShadow(
                        color: Color.fromARGB(255, 27, 1, 33),
                        blurRadius: 5,
                        offset: Offset(0, 1), // Shadow position
                      ),
                    ],
                  ),
                  child: TextButton(
                      onPressed: () {
                        Get.to(ReviewPage());
                      },
                      child: Text(
                        'Add review',
                        style: TextStyle(color: Colors.white, fontSize: 22),
                      )),
                ),
                SizedBox(
                  width: 60,
                ),
                Container(
                  decoration: BoxDecoration(
                    color: Color.fromARGB(58, 255, 255, 255),
                    borderRadius: BorderRadius.circular(10),
                    boxShadow: [
                      BoxShadow(
                        color: Color.fromARGB(255, 27, 1, 33),
                        blurRadius: 5,
                        offset: Offset(0, 1), // Shadow position
                      ),
                    ],
                  ),
                  child: TextButton(
                      onPressed: () {
                        Get.to(buyTicketPage());
                      },
                      child: Text(
                        'Buy tickets',
                        style: TextStyle(color: Colors.white, fontSize: 22),
                      )),
                )
              ],
            )
          ],
        ),
      )),
    );
  }
}

class review extends StatefulWidget {
  review(String this.name, String this.description, {super.key});
  final String name;
  final String description;
  @override
  State<review> createState() => _reviewState();
}

class _reviewState extends State<review> {
  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
            flex: 1,
            child: Container(
              width: 30,
              height: 30,
              decoration:
                  BoxDecoration(borderRadius: BorderRadius.circular(10)),
              child: Image(image: AssetImage('assets/user.png')),
            )),
        Expanded(
          flex: 3,
          child: Text(widget.name + '\n' + widget.description),
        ),
      ],
    );
  }
}
