import 'package:moviehub/core/repository/movie_repository.dart';
import 'package:moviehub/model/genre_response.dart';
import 'package:rxdart/subjects.dart';

class GenreListBloc {
  final MovieRepository _movieRepository = MovieRepository();
  final BehaviorSubject<GenreResponse> _subject =
      BehaviorSubject<GenreResponse>();

  getGenre() async {
    GenreResponse response = await _movieRepository.getGenres();
    _subject.sink.add(response);
  }

  dispose() {
    _subject.close();
  }

  BehaviorSubject<GenreResponse> get subject => _subject;
}

final genresBloc = GenreListBloc();
