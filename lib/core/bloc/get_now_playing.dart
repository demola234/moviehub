import 'package:moviehub/core/repository/movie_repository.dart';
import 'package:moviehub/model/movie_response.dart';
import 'package:rxdart/subjects.dart';

class PlayingMovie {
  final MovieRepository _movieRepository = MovieRepository();
  final BehaviorSubject<MovieResponse> _subject =
      BehaviorSubject<MovieResponse>();

  getNowPlaying(int id) async {
    MovieResponse response = await _movieRepository.getPlayingMovie();
    _subject.sink.add(response);
  }

  dispose() {
    _subject.close();
  }

  BehaviorSubject<MovieResponse> get subject => _subject;
}

final playingBloc = PlayingMovie();
