import 'package:mbs/objects/movie.dart';

class Review {
  late int _id;
  String _description;
  String _author;
  Movie _movie;

  Review(this._description, this._author, this._movie) {}

  int get id => _id;

  String get description => _description;

  String get author => _author;

  Movie get movie => _movie;

  set id(int id) {
    _id = id;
  }

  set description(String description) {
    _description = description;
  }

  set author(String author) {
    _author = author;
  }

  set movie(Movie movie) {
    _movie = movie;
  }

  void addToMovie() {
    movie.addReview(this);
  }

  void editReview(String description) {
    _description = description;
  }

  void deleteReview() {
    _movie.reviews.remove(this);
  }
}
