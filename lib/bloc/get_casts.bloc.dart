// import 'package:flutter/material.dart';
// import 'package:moviespot/models/cast_response.dart';
// import 'package:moviespot/repository/repository.dart';
// import 'package:rxdart/rxdart.dart';

// class CastBloc {
//   final MovieRepository _repository = MovieRepository();
//   final BehaviorSubject<CastResponse> _subject =
//       BehaviorSubject<CastResponse>();

//   getCasts(int id) async {
//     CastResponse response = await _repository.getCasts(id);
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

//   BehaviorSubject<CastResponse> get subject => _subject;
// }