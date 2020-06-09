// To parse this JSON data, do
//
//     final movieResponse = movieResponseFromJson(jsonString);

import 'dart:convert';

import 'movie.dart';

MovieResponse movieResponseFromJson(String str) =>
    MovieResponse.fromJson(json.decode(str));

String movieResponseToJson(MovieResponse data) => json.encode(data.toJson());

class MovieResponse {
  MovieResponse({
    this.page,
    this.movies,
    this.totalResults,
    this.totalPages,
  });

  int page;
  List<Movie> movies;
  int totalResults;
  int totalPages;
  String error;

  factory MovieResponse.fromJson(Map<String, dynamic> json) => MovieResponse(
        page: json["page"],
        movies: List<Movie>.from(json["results"].map((x) => Movie.fromJson(x))),
        totalResults: json["total_results"],
        totalPages: json["total_pages"],
      );

  MovieResponse.withError(String errorValue)
      : movies = List(),
        error = errorValue;

  Map<String, dynamic> toJson() => {
        "page": page,
        "results": List<dynamic>.from(movies.map((x) => x.toJson())),
        "total_results": totalResults,
        "total_pages": totalPages,
      };
}
