import 'package:dio/dio.dart';
import 'package:moviehub/model/genre_response.dart';
import 'package:moviehub/model/movie_response.dart';
import 'package:moviehub/model/profile_response.dart';

class MovieRepository {
  static String mainUrl = "https://api.themoviedb.org/3";

  final Dio _dio = Dio();
  final String apiKey = "47835040e5b6e12f164773237b0d48ea";
  var getPopularUrl = "$mainUrl/movie/top_rated";
  var getMoviesUrl = "$mainUrl/discover/movie";
  var getPlayingUrl = "$mainUrl/movie/now_playing";
  var getGenreUrl = "$mainUrl/genre/movie/list";
  var getProfileUrl = "$mainUrl/trending/person/week";

  Future<MovieResponse> getMovies() async {
    var params = {
      "api_key": apiKey,
    };
    try {
      Response response =
          await _dio.get(getPopularUrl, queryParameters: params);
      // print(response.data);
      return MovieResponse.fromJson(response.data);
    } catch (e, stackTrace) {
      print("Expection occured: $e stracktrace: $stackTrace");
      return MovieResponse.withError("$e");
    }
  }

  Future<MovieResponse> getPlayingMovie() async {
    var params = {"api_key": apiKey, "language": "en-US", "page": 1};
    try {
      Response response =
          await _dio.get(getPlayingUrl, queryParameters: params);
      return MovieResponse.fromJson(response.data);
    } catch (e, stackTrace) {
      print("Expection occured: $e stracktrace: $stackTrace");
      return MovieResponse.withError("$e");
    }
  }

  Future<GenreResponse> getGenres() async {
    var params = {"api_key": apiKey, "language": "en-US", "page": 1};
    try {
      Response response = await _dio.get(getGenreUrl, queryParameters: params);
      return GenreResponse.fromJson(response.data);
    } catch (e, stackTrace) {
      print("Expection occured: $e stracktrace: $stackTrace");
      return GenreResponse.withError("$e");
    }
  }

  Future<PersonResponse> getProfile(int id) async {
    var params = {
      "api_key": apiKey,
      "language": "en-US",
      "page": 1,
      "with_genres": id
    };
    try {
      Response response =
          await _dio.get(getProfileUrl, queryParameters: params);
      return PersonResponse.fromJson(response.data);
    } catch (e, stackTrace) {
      print("Expection occured: $e stracktrace: $stackTrace");
      return PersonResponse.withError("$e");
    }
  }

  Future<MovieResponse> getMoviesbyGenre(int id) async {
    var params = {
      "api_key": apiKey,
      "language": "en-US",
      "page": 1,
      "with_genre": id
    };
    try {
      Response response = await _dio.get(getMoviesUrl, queryParameters: params);
      return MovieResponse.fromJson(response.data);
    } catch (e, stackTrace) {
      print("Expection occured: $e stracktrace: $stackTrace");
      return MovieResponse.withError("$e");
    }
  }
}
