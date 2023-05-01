import 'package:get/get.dart';
import 'package:mbs/objects/review.dart';
import 'package:mbs/objects/theater.dart';

class Movie {
  final int _id;
  final String _name;
  DateTime _showTime; // Time in which the movie is shown
  List<String> _cast = [];
  final String _synopsis;
  Duration _duration; // Length of the movie
  List<Review> _reviews = [];
  List<Theater> _theaters = [];
  List<String> _genres = [];

  Movie(this._id, this._name, this._showTime, this._cast, this._synopsis,
      this._duration);

  int get id => _id;

  String get name => _name;

  DateTime get showTime => _showTime;

  List<String> get cast => _cast;

  String get synopsis => _synopsis;

  Duration get duration => _duration;

  List<Review> get reviews => _reviews;

  List<Theater> get theaters => _theaters;

  List<String> get genres => _genres;

  set showTime(DateTime showTime) {
    _showTime = showTime;
  }

  set cast(List<String> cast) {
    _cast = cast;
  }

  set duration(Duration duration) {
    _duration = duration;
  }

  set reviews(List<Review> reviews) {
    _reviews = reviews;
  }

  set theaters(List<Theater> theaters) {
    _theaters = theaters;
  }

  void addReview(Review review) {
    _reviews.add(review);
  }

  void addTheater(Theater theater) {
    _theaters.add(theater);
  }

  void removeReview(Review review) {
    _reviews.remove(review);
  }

  void removeTheater(Theater theater) {
    _theaters.remove(theater);
  }

  void addGenre(String genre) {
    _genres.add(genre);
  }

  void removeGenre(String genre) {
    _genres.remove(genre);
  }

  void deleteMovie() {
    _theaters.forEach((theater) => theater.removeMovie(this));
  }

  void deleteReview(Review review) {
    _reviews.remove(review);
  }

  void deleteTheater(Theater theater) {
    _theaters.remove(theater);
  }

  void editReview(Review review, String description) {
    review.description = description;
  }
}

class MovieController extends GetxController {
  final _movies = <Movie>[].obs;

  MovieController() {
    Movie movie1 = Movie(
        1,
        "The Dark Knight",
        DateTime(2021, 1, 1),
        ["Christian Bale", "Heath Ledger", "Aaron Eckhart"],
        "Batman fights the Joker",
        Duration(hours: 2, minutes: 32));

    movie1.addGenre("Action");
    movie1.addReview(Review(1, "Good movie", "John Doe", movie1));
    movie1.addReview(Review(2, "Bad movie", "Jane Doe", movie1));
    movie1.addReview(Review(2, "Bad movie", "Jane Doe", movie1));
    movie1.addReview(Review(2, "Bad movie", "Jane Doe", movie1));
    movie1.addReview(Review(2, "Bad movie", "Jane Doe", movie1));
    movie1.addReview(Review(2, "Bad movie", "Jane Doe", movie1));

    addMovie(movie1);
  }

  List<Movie> get movies => _movies;

  void addMovie(Movie movie) {
    _movies.add(movie);
  }

  void removeMovie(Movie movie) {
    _movies.remove(movie);
  }
}
