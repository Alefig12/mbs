import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../widget/movieProfile.dart';

class ReviewPage extends StatefulWidget {
  const ReviewPage({super.key});

  @override
  State<ReviewPage> createState() => _ReviewPageState();
}

class _ReviewPageState extends State<ReviewPage> {
  final ScrollController scrollController = ScrollController();

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
      body: Column(
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
                  'Reviews',
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
          SizedBox(
            height: 40,
          ),
          Text(
            'Movie Name',
            style: TextStyle(
                color: Colors.white, fontWeight: FontWeight.w600, fontSize: 35),
          ),
          SizedBox(
            height: 40,
          ),
          Container(width: 400, height: 150, child: Movie()),
          SizedBox(
            height: 40,
          ),
          Container(
            padding: EdgeInsets.all(18),
            child: TextField(
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
          SizedBox(
            height: 20,
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
                  Get.back();
                },
                child: Text(
                  'SEND REVIEW',
                  style: TextStyle(color: Colors.white, fontSize: 22),
                )),
          )
        ],
      ),
    ));
  }
}
