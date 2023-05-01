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
          Divider(
            height: 15,
            thickness: 3,
            color: Colors.white,
          ),
          SizedBox(
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
              padding: EdgeInsets.all(18),
              child: TextField(
                controller: reviewController,
                decoration: InputDecoration(
                  filled: true,
                  enabledBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(15.0),
                  ),
                  fillColor: Color.fromARGB(255, 255, 255, 255),
                  hintText: 'type here...',
                ),
              ),
            ),
          ),
          SizedBox(
            height: 20,
          ),
          Expanded(
            flex: 2,
            child: Container(
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
                    Review review = Review(1, reviewController.text,
                        customerController.customer.username, widget.movie);

                    Get.back();
                  },
                  child: Text(
                    'SEND REVIEW',
                    style: TextStyle(color: Colors.white, fontSize: 22),
                  )),
            ),
          ),
          SizedBox(
            height: 40,
          ),
        ],
      ),
    ));
  }
}
