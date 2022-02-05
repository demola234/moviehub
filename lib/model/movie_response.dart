import 'package:moviehub/model/movies.dart';

class MovieResponse {
  final List<Movies> movies;
  final String error;

  MovieResponse(this.movies, this.error);

  MovieResponse.fromJson(Map<String, dynamic> json)
      : movies = (json["results"] as List)
            .map((i) => new Movies.fromJson(i))
            .toList(),
        error = "";

  MovieResponse.withError(String errorVaule)
      : movies = List.empty(),
        error = errorVaule;
}
