import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mbs/objects/customer.dart';
import 'package:mbs/objects/movie.dart';
import 'package:mbs/objects/review.dart';
import '../widget/movieProfile.dart';

class ReviewPage extends StatefulWidget {
  late String movieName;
  ImageProvider<Object> movieImage;
  Movie movie;

  ReviewPage({
    super.key,
    required this.movie,
    required this.movieImage,
  }) {
    movieName = movie.name;
  }

  @override
  State<ReviewPage> createState() => _ReviewPageState();
}

class _ReviewPageState extends State<ReviewPage> {
  final ScrollController scrollController = ScrollController();
  final TextEditingController reviewController = TextEditingController();
  CustomerController customerController = Get.find<CustomerController>();

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
      body: Column(
        children: [
          Expanded(
            flex: 2,
            child: Row(
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
                    'Reviews',
                    style: TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.w600,
                        fontSize: 35),
                  ),
                ),
              ],
            ),
          ),
          const Divider(
            height: 15,
            thickness: 3,
            color: Colors.white,
          ),
          const SizedBox(
            height: 40,
          ),
          Expanded(
            flex: 10,
            child: Container(
                width: 500,
                height: 150,
                child: posterMovie(
                    movieName: widget.movieName,
                    movieGenders: widget.movie.genres,
                    movieImage: widget.movieImage)),
          ),
          Expanded(
            flex: 4,
            child: Container(
              padding: const EdgeInsets.all(18),
              child: TextField(
                controller: reviewController,
                decoration: InputDecoration(
                  filled: true,
                  enabledBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(15.0),
                  ),
                  fillColor: const Color.fromARGB(255, 255, 255, 255),
                  hintText: 'type here...',
                ),
              ),
            ),
          ),
          const SizedBox(
            height: 20,
          ),
          Expanded(
            flex: 2,
            child: Container(
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
                    MovieController movieController = Get.find();
                    Review review = Review(
                        reviewController.text,
                        customerController.customer.username,
                        movieController.selectedMovie);

                    review.addToMovie();

                    Get.back();
                  },
                  child: const Text(
                    'SEND REVIEW',
                    style: TextStyle(color: Colors.white, fontSize: 22),
                  )),
            ),
          ),
          const SizedBox(
            height: 40,
          ),
        ],
      ),
    ));
  }
}
