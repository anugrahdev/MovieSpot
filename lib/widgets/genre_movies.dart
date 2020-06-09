import 'package:eva_icons_flutter/eva_icons_flutter.dart';
import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:moviespot/bloc/get_movies_bygenre_bloc.dart';
import 'package:moviespot/models/movie.dart';
import 'package:moviespot/models/movie_response.dart';
import 'package:moviespot/style/theme.dart' as Style;

class GenreMovies extends StatefulWidget {
  final int genreId;

  const GenreMovies({Key key, @required this.genreId}) : super(key: key);

  @override
  _GenreMoviesState createState() => _GenreMoviesState(genreId);
}

class _GenreMoviesState extends State<GenreMovies> {
  final int genreId;
  _GenreMoviesState(this.genreId);

  final MovieListByGenreBloc movieByGenreBloc = MovieListByGenreBloc();

  @override
  void initState() {
    movieByGenreBloc.getMoviesByGenre(genreId);
    super.initState();
  }

  @override
  void dispose() {
    movieByGenreBloc.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return StreamBuilder<MovieResponse>(
      stream: movieByGenreBloc.subject.stream,
      builder: (context, AsyncSnapshot<MovieResponse> snapshot) {
        if (snapshot.hasData) {
          return _buildGenreMoviesWidget(snapshot.data);
        } else if (snapshot.hasError) {
          return _buildErrorWidget(snapshot.error);
        } else {
          return _buildLoadingWidget();
        }
      },
    );
  }

  Widget _buildLoadingWidget() {
    return Center(
      child: Container(
        margin: EdgeInsetsDirectional.only(top: 10),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            SizedBox(
              height: 25,
              width: 25,
              child: CircularProgressIndicator(
                valueColor: AlwaysStoppedAnimation<Color>(Colors.white),
                strokeWidth: 5,
              ),
            )
          ],
        ),
      ),
    );
  }

  Widget _buildErrorWidget(String error) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[Text("Error occured $error")],
      ),
    );
  }

  Widget _buildGenreMoviesWidget(MovieResponse data) {
    List<Movie> movies = data.movies;
    if (movies != null) {
      return Container(
        height: 275,
        padding: EdgeInsets.only(left: 10),
        child: ListView.builder(
            scrollDirection: Axis.horizontal,
            itemCount: movies.length,
            itemBuilder: (context, index) {
              return Padding(
                padding: EdgeInsets.fromLTRB(0, 10, 10, 10),
                child: Column(
                  children: <Widget>[
                    movies[index].posterPath != null
                        ? Container(
                            width: 120,
                            height: 180,
                            decoration: BoxDecoration(
                                shape: BoxShape.rectangle,
                                borderRadius:
                                    BorderRadius.all(Radius.circular(2)),
                                image: DecorationImage(
                                    image: NetworkImage(
                                        "https://image.tmdb.org/t/p/w500/" +
                                            movies[index].posterPath),
                                    fit: BoxFit.cover)),
                          )
                        : Container(
                            width: 120,
                            height: 180,
                            decoration: BoxDecoration(
                                color: Style.Colors.secondColor,
                                shape: BoxShape.rectangle,
                                borderRadius:
                                    BorderRadius.all(Radius.circular(2))),
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: <Widget>[
                                Icon(
                                  EvaIcons.filmOutline,
                                  color: Colors.white,
                                  size: 50,
                                )
                              ],
                            ),
                          ),
                    SizedBox(
                      height: 10,
                    ),
                    Container(
                        width: 100,
                        child: Text(
                          movies[index].title,
                          maxLines: 2,
                          style: TextStyle(
                              height: 1.5,
                              color: Colors.white,
                              fontWeight: FontWeight.bold,
                              fontSize: 11.5),
                        )),
                    SizedBox(height: 5),
                    Row(
                      children: <Widget>[
                        Text(movies[index].voteAverage.toString(),
                            style: TextStyle(
                                color: Colors.white,
                                fontSize: 10,
                                fontWeight: FontWeight.bold)),
                        SizedBox(width: 5),
                        RatingBar(
                          itemSize: 8,
                          initialRating: movies[index].voteAverage / 2,
                          minRating: 1,
                          direction: Axis.horizontal,
                          allowHalfRating: true,
                          itemCount: 5,
                          itemPadding: EdgeInsets.symmetric(horizontal: 2),
                          itemBuilder: (context, _) => Icon(
                            EvaIcons.star,
                            color: Style.Colors.secondColor,
                          ),
                          onRatingUpdate: (rating) {
                            print(rating);
                          },
                        )
                      ],
                    )
                  ],
                ),
              );
            }),
      );
    } else {
      return Container(
        child: Text("Movie Not Found"),
      );
    }
  }
}
