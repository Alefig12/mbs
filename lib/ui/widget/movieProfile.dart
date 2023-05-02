// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:flutter/services.dart' show rootBundle;
import 'package:get/get.dart';
import 'package:mbs/objects/movie.dart';
import 'package:mbs/ui/pages/buyTickets_page.dart';

class popularMovie extends StatefulWidget {
  const popularMovie({super.key});

  @override
  State<popularMovie> createState() => _popularMovieState();
}

class _popularMovieState extends State<popularMovie> {
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

class posterMovie extends StatefulWidget {
  String movieName;
  List<String> movieGenders;
  ImageProvider<Object> movieImage;
  bool admin;
  Movie? movie;

  posterMovie(
      {super.key,
      this.movie,
      required this.movieName,
      required this.movieGenders,
      required this.movieImage,
      this.admin = false});

  @override
  State<posterMovie> createState() => _posterMovieState();
}

class _posterMovieState extends State<posterMovie> {
  bool _isPoppedOut = false;
  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async {
        setState(() {
          _isPoppedOut = true;
        });
        return true;
      },
      child: SafeArea(
        child: Column(
          children: [
            if (widget.admin)
              Expanded(
                  flex: 1,
                  child: Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(10),
                        topRight: Radius.circular(10),
                      ),
                      color: Colors.white,
                    ),
                    child: Row(
                      children: [
                        IconButton(
                          icon: Icon(
                            Icons.edit,
                            color: Color.fromARGB(255, 153, 115, 0),
                          ),
                          iconSize: 20,
                          onPressed: () {},
                        ),
                        IconButton(
                          icon: Icon(Icons.delete),
                          iconSize: 20, //
                          onPressed: () =>
                              _onBackButtonPressed(context, widget.movie),
                        )
                      ],
                    ),
                  )),
            Expanded(
              flex: 5,
              child: Image(image: widget.movieImage),
            ),
            SizedBox(
              height: 10,
            ),
            Expanded(
              flex: 1,
              child: Text(
                widget.movieName,
                style: TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.w500,
                    fontSize: 15),
              ),
            ),
            Expanded(
              flex: 1,
              child: Text(
                widget.movieGenders.isEmpty ? '' : widget.movieGenders[0],
                style: TextStyle(
                    color: Color.fromRGBO(255, 141, 64, 1),
                    fontWeight: FontWeight.w500,
                    fontSize: 14),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Future<bool> _onBackButtonPressed(BuildContext context, Movie? movie) async {
    bool? exitApp = await showDialog(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
              title: const Text('Delete movie'),
              content:
                  const Text('Are you sure you want to delete this movie?'),
              actions: <Widget>[
                TextButton(
                    onPressed: () {
                      Navigator.of(context).pop(false);
                    },
                    child: Text('No')),
                TextButton(
                    onPressed: () {
                      MovieController movieController = Get.find();
                      movieController.removeMovie(movie!);
                      setState(() {});
                      Navigator.of(context).pop(false);
                      //delete
                    },
                    child: Text('Yes'))
              ]);
        });
    return exitApp ?? false;
  }
}
