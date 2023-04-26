import 'package:flutter/material.dart';
import 'package:flutter/services.dart' show rootBundle;
import 'package:get/get.dart';
import 'package:mbs/ui/pages/buyTickets_page.dart';

class Movie extends StatefulWidget {
  const Movie({super.key});

  @override
  State<Movie> createState() => _MovieState();
}

class _MovieState extends State<Movie> {
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          image: DecorationImage(
              image: AssetImage('assets/poster2.jpg'), fit: BoxFit.cover),
          borderRadius: BorderRadius.circular(10)),
    );
  }
}

class popularMovie extends StatefulWidget {
  const popularMovie({super.key});

  @override
  State<popularMovie> createState() => _popularMovieState();
}

class _popularMovieState extends State<popularMovie> {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Expanded(
            flex: 5,
            child: Container(
              width: 100,
              decoration: BoxDecoration(
                  image: DecorationImage(
                      image: AssetImage('assets/poster1.jpg'),
                      fit: BoxFit.cover),
                  borderRadius: BorderRadius.circular(10)),
            )),
        Expanded(
          flex: 1,
          child: Text(
            'Movie Name',
            style: TextStyle(
                color: Colors.white, fontWeight: FontWeight.w500, fontSize: 15),
          ),
        ),
        Expanded(
          flex: 1,
          child: Text(
            'Movie Gener(s)',
            style: TextStyle(
                color: Color.fromRGBO(255, 141, 64, 1),
                fontWeight: FontWeight.w500,
                fontSize: 10),
          ),
        ),
      ],
    );
  }
}
