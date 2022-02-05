 import 'package:moviehub/model/movies.dart';

class GenreResponse {
  final List<Movies> genre;
  final String error;

  GenreResponse(this.genre, this.error);

  GenreResponse.fromJson(Map<String, dynamic> json)
      : genre = (json["results"] as List)
            .map((i) => new Movies.fromJson(i))
            .toList(),
        error = "";
 
  GenreResponse.withError(String errorVaule)
      : genre = List.empty(),
        error = errorVaule;
}
