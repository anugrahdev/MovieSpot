import 'package:eva_icons_flutter/eva_icons_flutter.dart';
import 'package:flutter/material.dart';
import 'package:moviespot/style/theme.dart' as Style;
import 'package:moviespot/widgets/genres.dart';
import 'package:moviespot/widgets/now_playing.dart';
import 'package:moviespot/widgets/persons.dart';
import 'package:moviespot/widgets/popular.dart';

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Style.Colors.mainColor,
      appBar: AppBar(
        backgroundColor: Style.Colors.mainColor,
        centerTitle: true,
        title: Text("MovieSpot"),
        leading: Icon(
          EvaIcons.menu2Outline,
          color: Colors.white,
        ),
        actions: <Widget>[
          IconButton(
            icon: Icon(
              EvaIcons.searchOutline,
              color: Colors.white,
            ),
            onPressed: () {},
          )
        ],
      ),
      body: ListView(
        children: <Widget>[
          NowPlaying(),
          GenresWidget(),
          PersonWidget(),
          PopularWidget()
        ],
      ),
    );
  }
}
