 import 'package:moviehub/model/genre.dart';

class GenreResponse {
  final List<Genre> genre;
  final String error;

  GenreResponse(this.genre, this.error);

  GenreResponse.fromJson(Map<String, dynamic> json)
      : genre = (json["results"] as List)
            .map((i) => new Genre.fromJson(i))
            .toList(),
        error = "";
 
  GenreResponse.withError(String errorVaule)
      : genre = List.empty(),
        error = errorVaule;
}
