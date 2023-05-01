import 'package:get/get.dart';
import 'package:mbs/objects/movie.dart';
import 'package:mbs/ui/pages/buyTickets_page.dart';
import 'package:mbs/ui/pages/review_page.dart';

import '../widget/movieProfile.dart';
import 'package:flutter/material.dart';

class selectedMoviePage extends StatefulWidget {
  late String movieName;
  late List<String> movieGenders;
  ImageProvider<Object> movieImage;
  Movie movie;

  selectedMoviePage(
      {required this.movie, required this.movieImage, super.key}) {
    movieName = movie.name;
    movieGenders = movie.genres;
  }

  @override
  State<selectedMoviePage> createState() => _selectedMoviePageState();
}

class _selectedMoviePageState extends State<selectedMoviePage> {
  // List<String> genders = ['fiction', 'fantasy', 'action'];
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
                      icon: const Icon(
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
                    widget.movieName,
                    style: const TextStyle(
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
            Padding(
              padding: const EdgeInsets.all(28.0),
              child: Container(
                  width: 500,
                  height: 180,
                  child: posterMovie(
                    movieName: widget.movieName,
                    movieGenders: widget.movieGenders,
                    movieImage: widget.movieImage,
                  )),
            ),
            Padding(
              padding: const EdgeInsets.all(30.0),
              child: Container(
                height: 200,
                padding: const EdgeInsets.all(18),
                width: double.infinity,
                decoration: BoxDecoration(
                  color: const Color.fromARGB(255, 255, 255, 255),
                  borderRadius: BorderRadius.circular(25),
                  boxShadow: const [
                    BoxShadow(
                      color: Color.fromARGB(255, 48, 2, 58),
                      blurRadius: 5,
                      offset: Offset(0, 1), // Shadow position
                    ),
                  ],
                ),
                child: Column(
                  children: [
                    Expanded(
                      child: Align(
                        alignment: Alignment.centerLeft,
                        child: Text(
                          'User Reviews',
                          style: TextStyle(
                              color: Color.fromARGB(255, 0, 0, 0),
                              fontWeight: FontWeight.w700,
                              fontSize: 20),
                        ),
                      ),
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    Expanded(
                      flex: 3,
                      child: Container(
                        child: ListView.builder(
                            itemCount: widget.movie.reviews.length,
                            scrollDirection: Axis.vertical,
                            itemBuilder: (context, index) {
                              return Column(
                                children: [
                                  Obx(
                                    //got to change this, it's not working
                                    () => review(
                                        widget.movie.reviews[index].author,
                                        widget
                                            .movie.reviews[index].description),
                                  ),
                                  SizedBox(
                                    height: 20,
                                  ),
                                ],
                              );
                            }),
                      ),
                    ),
                  ],
                ),
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Container(
                  decoration: BoxDecoration(
                    color: const Color.fromARGB(58, 255, 255, 255),
                    borderRadius: BorderRadius.circular(10),
                    boxShadow: const [
                      BoxShadow(
                        color: Color.fromARGB(255, 27, 1, 33),
                        blurRadius: 5,
                        offset: Offset(0, 1), // Shadow position
                      ),
                    ],
                  ),
                  child: TextButton(
                      onPressed: () {
                        Get.to(ReviewPage(
                          movie: widget.movie,
                          movieImage: widget.movieImage,
                        ));
                      },
                      child: const Text(
                        'Add review',
                        style: TextStyle(color: Colors.white, fontSize: 22),
                      )),
                ),
                const SizedBox(
                  width: 60,
                ),
                Container(
                  decoration: BoxDecoration(
                    color: const Color.fromARGB(58, 255, 255, 255),
                    borderRadius: BorderRadius.circular(10),
                    boxShadow: const [
                      BoxShadow(
                        color: Color.fromARGB(255, 27, 1, 33),
                        blurRadius: 5,
                        offset: Offset(0, 1), // Shadow position
                      ),
                    ],
                  ),
                  child: TextButton(
                      onPressed: () {
                        Get.to(buyTicketPage(
                            movieName: widget.movieName,
                            movieImage: widget.movieImage));
                      },
                      child: const Text(
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
              child: const Image(image: AssetImage('assets/user.png')),
            )),
        Expanded(
          flex: 3,
          child: Text(widget.name + '\n' + widget.description),
        ),
      ],
    );
  }
}
