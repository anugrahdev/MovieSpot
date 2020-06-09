// To parse this JSON data, do
//
//     final genreResponse = genreResponseFromJson(jsonString);

import 'dart:convert';

import 'genre.dart';

GenreResponse genreResponseFromJson(String str) =>
    GenreResponse.fromJson(json.decode(str));

String genreResponseToJson(GenreResponse data) => json.encode(data.toJson());

class GenreResponse {
  GenreResponse({
    this.genres,
  });

  List<Genre> genres;
  String error;

  factory GenreResponse.fromJson(Map<String, dynamic> json) => GenreResponse(
        genres: List<Genre>.from(json["genres"].map((x) => Genre.fromJson(x))),
      );

  GenreResponse.withError(String errorValue)
      : genres = List(),
        error = errorValue;

  Map<String, dynamic> toJson() => {
        "genres": List<dynamic>.from(genres.map((x) => x.toJson())),
      };
}
