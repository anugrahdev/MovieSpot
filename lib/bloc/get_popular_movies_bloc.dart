import 'package:moviespot/models/movie_response.dart';
import 'package:moviespot/repository/repository.dart';
import 'package:rxdart/rxdart.dart';

class PopularMoviesListBloc {
  final MovieRepository _repository = MovieRepository();
  final BehaviorSubject<MovieResponse> _subject =
      BehaviorSubject<MovieResponse>();

  getPopularMovies() async {
    MovieResponse response = await _repository.getPopularMovies();
    _subject.sink.add(response);
  }

  dispose() {
    _subject.close();
  }

  BehaviorSubject<MovieResponse> get subject => _subject;
}

// final popularMovieBloc = PopularMoviesListBloc();
