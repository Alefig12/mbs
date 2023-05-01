import 'package:mbs/objects/movie.dart';

class Review {
  int _id;
  String _description;
  String _author;
  Movie _movie;

  Review(this._id, this._description, this._author, this._movie) {
    _movie.reviews.add(this);
  }

  int get id => _id;

  String get description => _description;

  String get author => _author;

  Movie get movie => _movie;

  set description(String description) {
    _description = description;
  }

  set author(String author) {
    _author = author;
  }

  set movie(Movie movie) {
    _movie = movie;
  }

  void editReview(String description) {
    _description = description;
  }

  void deleteReview() {
    _movie.reviews.remove(this);
  }
}
