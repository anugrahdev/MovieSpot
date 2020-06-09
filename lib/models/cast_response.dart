// To parse this JSON data, do
//
//     final castResponse = castResponseFromJson(jsonString);

import 'dart:convert';

import 'cast.dart';

CastResponse castResponseFromJson(String str) =>
    CastResponse.fromJson(json.decode(str));

String castResponseToJson(CastResponse data) => json.encode(data.toJson());

class CastResponse {
  CastResponse({
    this.id,
    this.cast,
    this.crew,
  });

  int id;
  List<Cast> cast;
  List<Crew> crew;
  String error;

  factory CastResponse.fromJson(Map<String, dynamic> json) => CastResponse(
        id: json["id"],
        cast: List<Cast>.from(json["cast"].map((x) => Cast.fromJson(x))),
        crew: List<Crew>.from(json["crew"].map((x) => Crew.fromJson(x))),
      );

  CastResponse.withError(String errorValue)
      : cast = List(),
        error = errorValue;

  Map<String, dynamic> toJson() => {
        "id": id,
        "cast": List<dynamic>.from(cast.map((x) => x.toJson())),
        "crew": List<dynamic>.from(crew.map((x) => x.toJson())),
      };
}
