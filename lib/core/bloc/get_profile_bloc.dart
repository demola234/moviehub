import 'package:moviehub/core/repository/movie_repository.dart';
import 'package:moviehub/model/movie_response.dart';
import 'package:moviehub/model/profile_response.dart';
import 'package:rxdart/subjects.dart';

class ProfileBloc {
  final MovieRepository _movieRepository = MovieRepository();
  final BehaviorSubject<PersonResponse> _subject =
      BehaviorSubject<PersonResponse>();

  getMovieByGenre(int id) async {
    PersonResponse response = await _movieRepository.getProfile(id);
    _subject.sink.add(response);
  }

  dispose() {
    _subject.close();
  }

  BehaviorSubject<PersonResponse> get subject => _subject;
}

final personBloc = ProfileBloc();
 