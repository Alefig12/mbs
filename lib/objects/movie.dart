import 'dart:math';

import 'package:firebase_database/firebase_database.dart';
import 'package:get/get.dart';
import 'package:mbs/objects/review.dart';
import 'package:mbs/objects/theater.dart';

class Movie {
  late final int _id;
  final String _name;
  List<String> _cast = [];
  final String _synopsis;
  Duration _duration; // Length of the movie
  List<Review> _reviews = [];
  List<Theater> _theaters = [];
  List<String> _genres = [];

  Movie(this._name, this._cast, this._synopsis, this._duration);

  int get id => _id;

  set id(int id) {
    _id = id;
  }

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
    MovieController movieController = Get.find();

    movieController.addReviewToMovie(review: review);
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
          "The Dark Knight",
          ["Christian Bale", "Heath Ledger", "Aaron Eckhart"],
          "Batman fights the Joker",
          const Duration(hours: 2, minutes: 32))
      .obs;

  MovieController() {
    // Movie movie1 = Movie(
    //     "The Dark Knight",
    //     ["Christian Bale", "Heath Ledger", "Aaron Eckhart"],
    //     "Batman fights the Joker",
    //     const Duration(hours: 2, minutes: 32));
    // movie1.id = 1;
    // movie1.addGenre("Action");
    // movie1.addReview(Review("Good movie", "John Doe", movie1));
    // movie1.addReview(Review("Bad movie", "Jane Doe", movie1));
    // movie1.addReview(Review("Bad movie", "Jane Doe", movie1));

    // movie1.addTheater(Theater(1, "Theater 1", "Address 1"));

    // addMovie(movie1);

    // Movie movie2 = Movie(
    //     "The Dark Knight Rises",
    //     ["Christian Bale", "Tom Hardy", "Anne Hathaway"],
    //     "Batman fights Bane",
    //     const Duration(hours: 2, minutes: 44));
    // movie2.id = 2;
    // movie2.addGenre("Action");
    // movie2.addReview(Review("Good movie", "John Doe", movie2));

    // Movie movie3 = Movie(
    //     "Los capybaras",
    //     ["Christian Bale", "Tom Hardy", "Anne Hathaway"],
    //     "Batman fights Bane",
    //     const Duration(hours: 2, minutes: 44));
    // movie3.id = 3;
    // addMovie(movie3);
    // addMovie(movie2);
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
    _movies.refresh();
  }

  void removeMovie(Movie movie) {
    for (Movie m in _movies) {
      print(m.name);
    }
    _movies.removeWhere((element) => element.name == movie.name);
    _movies.refresh();

    //remove movie from database
    final database = FirebaseDatabase.instance.ref();
    print(movie.id.toString());
    database.child('movies').child(movie.id.toString()).remove();
  }

  List<Movie> searchMovie(String name) {
    return _movies
        .where((movie) => movie.name.toLowerCase().contains(name.toLowerCase()))
        .toList();
  }

  Future<void> fetchMovies() async {
    final database = FirebaseDatabase.instance.ref();
    DataSnapshot movies = await database.child('movies').get();
    final List<dynamic> moviesList = movies.value as List<dynamic>;
    print(moviesList);
    _movies.clear();

    for (var movie in moviesList) {
      if (movie == null) {
        continue;
      }
      final int id = movie['id'];
      final String name = movie['name'];
      final List<String> cast = List<String>.from(movie['cast']);
      final String synopsis = movie['synopsis'];
      final int duration = movie['duration'];
      final List<String> genres = List<String>.from(movie['genres']);

      final Movie newMovie =
          Movie(name, cast, synopsis, Duration(minutes: duration));
      newMovie.id = id;
      genres.forEach((genre) => newMovie.addGenre(genre));
      addMovie(newMovie);
      await fetchReviewsAndAddToMovie(newMovie);
      print("Movie number " + id.toString() + " added");
      print(newMovie.reviews);
    }
  }

  Future<void> addMovieToDatabase(Movie movie) async {
    final database = FirebaseDatabase.instance.ref();
    final int newId;

    //get last id number added to database
    final DataSnapshot snapshot = await database.child('movies').get();

    if (snapshot.value is List) {
      print('is list');

      final List<dynamic> movies = snapshot.value as List<dynamic>;

      if (!movies.isEmpty) {
        final int lastId = movies.last['id'];
        newId = lastId + 1;
      } else {
        newId = 1;
        print("here now");
      }
    } else {
      print('is map');
      final Map<dynamic, dynamic> movies =
          snapshot.value as Map<dynamic, dynamic>;

      if (movies.isEmpty) {
        newId = 1;
      } else {
        newId = movies.keys.map((e) => int.parse(e)).reduce(max) + 1;
      }
    }

    //check for greatest id number

    //add movie to database
    await database.child('movies').child(newId.toString()).set({
      'id': newId,
      'name': movie.name,
      'cast': movie.cast,
      'synopsis': movie.synopsis,
      'duration': movie.duration.inMinutes,
      'genres': movie.genres,
      'reviews': movie.reviews,
    });

    //add movie to controller
    movie.id = newId;
    addMovie(movie);
  }

  Future<void> fetchReviewsAndAddToMovie(Movie movie) async {
    final database = FirebaseDatabase.instance.ref();
    DataSnapshot? reviews = await database
        .child('movies')
        .child(movie.id.toString())
        .child('reviews')
        .get();

    print(movie.id.toString());

    print(reviews.value);
    print("here");

    //null check

    if (reviews.value == null) {
      return;
    }

    final Map<dynamic, dynamic> reviewsList =
        reviews.value as Map<dynamic, dynamic>;

    reviewsList.forEach((key, value) {
      final int id = value['id'];
      final String description = value['description'];
      final String author = value['author'];
      final int movieId = value['movie'];

      final Review newReview = Review(description, author, movie);
      newReview.id = id;
      movie.reviews.add(newReview);
      _movies.refresh();
    });
  }

  Movie searchMovieById(int id) {
    return _movies.firstWhere((movie) => movie.id == id);
  }

  Future<void> addReviewToMovie({required Review review}) async {
    final databaseRef = FirebaseDatabase.instance.ref();
    int newId;

    //get last id number added to database

    newId = Random().nextInt(1000000);

    //add review to database
    databaseRef
        .child('movies')
        .child(review.movie.id.toString())
        .child('reviews')
        .child(newId.toString())
        .set({
      'id': newId,
      'description': review.description,
      'author': review.author,
      'movie': review.movie.id,
    });

    //add review to controller
    review.id = newId;
    review.movie.reviews.add(review);
  }
}
