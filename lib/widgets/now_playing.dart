import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:moviespot/bloc/get_nowplaying_bloc.dart';
import 'package:moviespot/models/movie.dart';
import 'package:moviespot/models/movie_response.dart';
import 'package:page_indicator/page_indicator.dart';
import 'package:moviespot/style/theme.dart' as Style;

class NowPlaying extends StatefulWidget {
  @override
  _NowPlayingState createState() => _NowPlayingState();
}

class _NowPlayingState extends State<NowPlaying> {
  final NowPlayingListBloc nowPlayingMovieBloc = NowPlayingListBloc();

  @override
  void initState() {
    nowPlayingMovieBloc.getNowPlaying();
    super.initState();
  }

  @override
  void dispose() {
    nowPlayingMovieBloc.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return StreamBuilder<MovieResponse>(
      stream: nowPlayingMovieBloc.subject.stream,
      builder: (context, AsyncSnapshot<MovieResponse> snapshot) {
        if (snapshot.hasData) {
          return _buildNowPlayingWidget(snapshot.data);
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

  Widget _buildNowPlayingWidget(MovieResponse data) {
    List<Movie> movies = data.movies;
    if (movies.isNotEmpty) {
      return Container(
        height: 220,
        child: PageIndicatorContainer(
          length: movies.take(5).length,
          align: IndicatorAlign.bottom,
          shape: IndicatorShape.circle(size: 5),
          indicatorSpace: 8,
          padding: EdgeInsets.all(5),
          indicatorColor: Style.Colors.titleColor,
          indicatorSelectorColor: Style.Colors.secondColor,
          child: PageView.builder(
            itemCount: movies.take(5).length,
            scrollDirection: Axis.horizontal,
            itemBuilder: (context, index) {
              return Stack(
                children: <Widget>[
                  Container(
                    width: MediaQuery.of(context).size.width,
                    height: 220,
                    decoration: BoxDecoration(
                        shape: BoxShape.rectangle,
                        image: DecorationImage(
                            image: NetworkImage(
                                "https://image.tmdb.org/t/p/w780/" +
                                    movies[index].backdropPath),
                            fit: BoxFit.cover)),
                  ),
                  Container(
                    decoration: BoxDecoration(
                        gradient: LinearGradient(
                            colors: [
                              Style.Colors.mainColor.withOpacity(1.0),
                              Style.Colors.mainColor.withOpacity(0.0)
                            ],
                            begin: Alignment.bottomCenter,
                            end: Alignment.topCenter,
                            stops: [0.0, 0.9])),
                  ),
                  Positioned(
                      left: 0,
                      top: 0,
                      right: 0,
                      bottom: 0,
                      child: Icon(
                        FontAwesomeIcons.playCircle,
                        color: Style.Colors.secondColor,
                        size: 40,
                      )),
                  Positioned(
                    bottom: 30,
                    child: Container(
                      padding: EdgeInsets.symmetric(horizontal: 10),
                      width: 250,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: <Widget>[
                          Text(
                            movies[index].title,
                            style: TextStyle(
                                height: 1.5,
                                color: Colors.white,
                                fontWeight: FontWeight.bold,
                                fontSize: 16),
                          )
                        ],
                      ),
                    ),
                  )
                ],
              );
            },
          ),
        ),
      );
    } else {
      return Container(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Text("No Movies Found"),
        ),
      );
    }
  }
}
