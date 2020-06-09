// import 'package:flutter/material.dart';
// import 'package:moviespot/models/videos_response.dart';
// import 'package:moviespot/repository/repository.dart';
// import 'package:rxdart/rxdart.dart';

// class VideosBlock {
//   final MovieRepository _repository = MovieRepository();
//   final BehaviorSubject<VideosResponse> _subject =
//       BehaviorSubject<VideosResponse>();

//   getNowPlaying(int id) async {
//     VideosResponse response = await _repository.getVideos(id);
//     _subject.sink.add(response);
//   }

//   void drainStream() {
//     _subject.value = null;
//   }

//   @mustCallSuper
//   void dispose() async {
//     await _subject.drain();
//     _subject.close();
//   }

//   BehaviorSubject<VideosResponse> get subject => _subject;
// }
