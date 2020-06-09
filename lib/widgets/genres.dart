import 'package:flutter/material.dart';
import 'package:moviespot/bloc/get_genres_bloc.dart';
import 'package:moviespot/models/genre.dart';
import 'package:moviespot/models/genre_response.dart';

import 'genres_list.dart';

class GenresWidget extends StatefulWidget {
  @override
  _GenresWidgetState createState() => _GenresWidgetState();
}

class _GenresWidgetState extends State<GenresWidget> {
  final GenresListBloc genreBloc = GenresListBloc();

  @override
  void initState() {
    genreBloc.getGenres();
    super.initState();
  }

  @override
  void dispose() {
    genreBloc.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return StreamBuilder<GenreResponse>(
      stream: genreBloc.subject.stream,
      builder: (context, AsyncSnapshot<GenreResponse> snapshot) {
        if (snapshot.hasData) {
          return _buildGenreWidget(snapshot.data);
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

  Widget _buildGenreWidget(GenreResponse data) {
    List<Genre> genres = data.genres;
    if (genres.isNotEmpty) {
      return GenresList(genres: genres);
    } else {
      return Container(
        margin: EdgeInsets.all(10),
        child: Text("Genres are empty"),
      );
    }
  }
}
