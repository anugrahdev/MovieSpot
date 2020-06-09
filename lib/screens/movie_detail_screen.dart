// import 'package:flutter/material.dart';
// import 'package:moviespot/bloc/get_movie_detail.dart';
// import 'package:moviespot/models/movie.dart';
// import 'package:moviespot/models/videos.dart';
// import 'package:moviespot/models/movie_detail_response.dart';
// import 'package:moviespot/style/theme.dart' as Style;
// import 'package:sliver_fab/sliver_fab.dart';

// class MovieDetailScreen extends StatefulWidget {
//   final Movie movie;

//   const MovieDetailScreen({Key key, this.movie}) : super(key: key);
//   @override
//   _MovieDetailScreenState createState() => _MovieDetailScreenState(movie);
// }

// class _MovieDetailScreenState extends State<MovieDetailScreen> {
//   final Movie movie;

//   _MovieDetailScreenState(this.movie);
//   final MovieDetailBloc movieDetailBloc = MovieDetailBloc();
//   @override
//   void initState() {
//     movieDetailBloc.getMovieDetail(movie.id);
//     super.initState();
//   }

//   @override
//   void dispose() {
//     movieDetailBloc.drainStream();
//     super.dispose();
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//         backgroundColor: Style.Colors.mainColor,
//         body: Builder(builder: (context) {
//           return SliverFab(
//             floatingWidget: StreamBuilder<MovieDetailResponse>(
//               stream: movieDetailBloc.subject.stream,
//               builder: (context, AsyncSnapshot<MovieDetailResponse> snapshot) {
//                 if (snapshot.hasData) {
//                   return _buildVideoWidget(snapshot.data);
//                 } else if (snapshot.hasError) {
//                   return _buildErrorWidget(snapshot.error);
//                 } else {
//                   return _buildLoadingWidget();
//                 }
//               },
//             ),
//             floatingPosition: FloatingPosition(right: 20),
//             expandedHeight: 200,
//             slivers: <Widget>[
//               SliverAppBar(
//                 backgroundColor: Style.Colors.mainColor,
//                 expandedHeight: 200,
//                 pinned: true,
//                 flexibleSpace: FlexibleSpaceBar(
//                   title: Text(
//                     movie.title.length > 40
//                         ? movie.title.substring(0, 37) + "..."
//                         : movie.title,
//                     style: TextStyle(fontSize: 12, fontWeight: FontWeight.bold),
//                   ),
//                   background: Stack(
//                     children: <Widget>[
//                       Container(
//                         decoration: BoxDecoration(
//                             shape: BoxShape.rectangle,
//                             image: DecorationImage(
//                                 image: NetworkImage(
//                                     "https://image.tmdb.org/t/p/w780/" +
//                                         movie.backdropPath))),
//                         child: Container(
//                           decoration: BoxDecoration(
//                               color: Colors.black.withOpacity(0.5)),
//                         ),
//                       ),
//                       Container(
//                         decoration: BoxDecoration(
//                             gradient: LinearGradient(
//                                 colors: [
//                               Colors.black.withOpacity(0.9),
//                               Colors.black.withOpacity(0.0)
//                             ],
//                                 begin: Alignment.bottomCenter,
//                                 end: Alignment.topCenter)),
//                       )
//                     ],
//                   ),
//                 ),
//               )
//             ],
//           );
//         }));
//   }

//   Widget _buildLoadingWidget() {
//     return Center(
//       child: Container(
//         margin: EdgeInsetsDirectional.only(top: 10),
//         child: Column(
//           mainAxisAlignment: MainAxisAlignment.center,
//           children: <Widget>[
//             SizedBox(
//               height: 25,
//               width: 25,
//               child: CircularProgressIndicator(
//                 valueColor: AlwaysStoppedAnimation<Color>(Colors.white),
//                 strokeWidth: 5,
//               ),
//             )
//           ],
//         ),
//       ),
//     );
//   }

//   Widget _buildErrorWidget(String error) {
//     return Center(
//       child: Column(
//         mainAxisAlignment: MainAxisAlignment.center,
//         children: <Widget>[Text("Error occured $error")],
//       ),
//     );
//   }

//   Widget _buildVideoWidget(MovieDetailResponse data) {
//     List<Videos> videos = data.videos.results;
//     return FloatingActionButton(
//       onPressed: () {},
//       backgroundColor: Style.Colors.secondColor,
//       child: Icon(Icons.play_arrow),
//     );
//   }
// }
