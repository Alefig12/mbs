import 'package:flutter/material.dart';

class Movie extends StatefulWidget {
  const Movie({super.key});

  @override
  State<Movie> createState() => _MovieState();
}

class _MovieState extends State<Movie> {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Image.network(
        'https://worldwatch.news/images/pages/Explainer.jpg',
        height: 400,
        width: 750,
      ),
    );
  }
}
