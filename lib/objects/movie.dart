import 'package:get/get.dart';
import 'package:mbs/objects/review.dart';
import 'package:mbs/objects/theater.dart';

class Movie {
  final int _id;
  final String _name;
  List<String> _cast = [];
  final String _synopsis;
  Duration _duration; // Length of the movie
  List<Review> _reviews = [];
  List<Theater> _theaters = [];
  List<String> _genres = [];

  Movie(this._id, this._name, this._cast, this._synopsis, this._duration);

  int get id => _id;

  String get name => _name;

  List<String> get cast => _cast;

  String get synopsis => _synopsis;

  Duration get duration => _duration;

  List<Review> get reviews => _reviews;

  List<Theater> get theaters => _theaters;

  List<String> get genres => _genres;

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
    theater.addMovie(this);
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

  late final Rx<Movie> _selectedMovie = Movie(
          1,
          "The Dark Knight",
          ["Christian Bale", "Heath Ledger", "Aaron Eckhart"],
          "Batman fights the Joker",
          const Duration(hours: 2, minutes: 32))
      .obs;

  MovieController() {
    Movie movie1 = Movie(
        1,
        "The Dark Knight",
        ["Christian Bale", "Heath Ledger", "Aaron Eckhart"],
        "Batman fights the Joker",
        const Duration(hours: 2, minutes: 32));

    movie1.addGenre("Action");
    movie1.addReview(Review(1, "Good movie", "John Doe", movie1));
    movie1.addReview(Review(2, "Bad movie", "Jane Doe", movie1));
    movie1.addReview(Review(2, "Bad movie", "Jane Doe", movie1));

    movie1.addTheater(Theater(1, "Theater 1", "Address 1"));

    addMovie(movie1);

    Movie movie2 = Movie(
        2,
        "The Dark Knight Rises",
        ["Christian Bale", "Tom Hardy", "Anne Hathaway"],
        "Batman fights Bane",
        const Duration(hours: 2, minutes: 44));

    movie2.addGenre("Action");
    movie2.addReview(Review(1, "Good movie", "John Doe", movie2));

    Movie movie3 = Movie(
        3,
        "Los capybaras",
        ["Christian Bale", "Tom Hardy", "Anne Hathaway"],
        "Batman fights Bane",
        const Duration(hours: 2, minutes: 44));

    addMovie(movie3);
    addMovie(movie2);
  }

  List<Movie> get movies => _movies.value;

  Movie get selectedMovie => _selectedMovie.value;

  set selectedMovie(Movie movie) {
    _selectedMovie.value = movie;
  }

  Movie getMovie(int id) {
    return _movies.firstWhere((movie) => movie.id == id);
  }

  void addMovie(Movie movie) {
    _movies.add(movie);
  }

  void removeMovie(Movie movie) {
    for (Movie m in _movies) {
      print(m.name);
    }
    _movies.removeWhere((element) => element.name == movie.name);
    _movies.refresh();
    print("abajo_____");

    for (Movie m in _movies) {
      print(m.name);
    }
  }

  List<Movie> searchMovie(String name) {
    return _movies
        .where((movie) => movie.name.toLowerCase().contains(name.toLowerCase()))
        .toList();
  }
}
