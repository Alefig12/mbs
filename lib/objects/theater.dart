import 'package:mbs/objects/movie.dart';

class Theater {
  final int _id;
  String _name;
  final String _address;
  List<Movie> _movies = [];

  Theater(this._id, this._name, this._address);

  int get id => _id;

  String get name => _name;

  String get address => _address;

  List<Movie> get movies => _movies;

  set name(String name) {
    _name = name;
  }

  set movies(List<Movie> movies) {
    _movies = movies;
  }

  void addMovie(Movie movie) {
    _movies.add(movie);
  }

  void removeMovie(Movie movie) {
    _movies.remove(movie);
  }
}
