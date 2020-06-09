import 'package:flutter/material.dart';
import 'package:moviespot/bloc/get_movies_bygenre_bloc.dart';
import 'package:moviespot/models/genre.dart';
import 'package:moviespot/style/theme.dart' as Style;
import 'package:moviespot/widgets/genre_movies.dart';

class GenresList extends StatefulWidget {
  final List<Genre> genres;

  const GenresList({Key key, @required this.genres}) : super(key: key);
  @override
  _GenresListState createState() => _GenresListState(genres);
}

class _GenresListState extends State<GenresList>
    with SingleTickerProviderStateMixin {
  final List<Genre> genres;

  _GenresListState(this.genres);
  TabController _tabController;
  final MovieListByGenreBloc movieByGenreBloc = MovieListByGenreBloc();

  @override
  void initState() {
    _tabController = TabController(length: genres.length, vsync: this);
    _tabController.addListener(() {
      if (_tabController.indexIsChanging) movieByGenreBloc.drainStream();
    });
    super.initState();
  }

  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 320,
      child: DefaultTabController(
          length: genres.length,
          child: Scaffold(
            backgroundColor: Style.Colors.mainColor,
            appBar: PreferredSize(
                child: AppBar(
                  backgroundColor: Style.Colors.mainColor,
                  bottom: TabBar(
                      controller: _tabController,
                      indicatorColor: Style.Colors.secondColor,
                      indicatorSize: TabBarIndicatorSize.tab,
                      unselectedLabelColor: Style.Colors.titleColor,
                      labelColor: Colors.white,
                      indicatorWeight: 2.5,
                      isScrollable: true,
                      tabs: genres.map((Genre genres) {
                        return Container(
                          padding: EdgeInsets.symmetric(vertical: 10),
                          child: Text(
                            genres.name.toUpperCase(),
                            style: TextStyle(
                                fontSize: 13.5, fontWeight: FontWeight.bold),
                          ),
                        );
                      }).toList()),
                ),
                preferredSize: Size.fromHeight(50)),
            body: TabBarView(
              children: genres.map((Genre genre) {
                return GenreMovies(genreId: genre.id);
              }).toList(),
              controller: _tabController,
              physics: NeverScrollableScrollPhysics(),
            ),
          )),
    );
  }
}
