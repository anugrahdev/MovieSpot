// To parse this JSON data, do
//
//     final personResponse = personResponseFromJson(jsonString);

import 'dart:convert';

import 'person.dart';

PersonResponse personResponseFromJson(String str) =>
    PersonResponse.fromJson(json.decode(str));

String personResponseToJson(PersonResponse data) => json.encode(data.toJson());

class PersonResponse {
  PersonResponse({
    this.page,
    this.persons,
    this.totalPages,
    this.totalResults,
  });

  int page;
  List<Person> persons;
  int totalPages;
  int totalResults;
  String error;

  factory PersonResponse.fromJson(Map<String, dynamic> json) => PersonResponse(
        page: json["page"],
        persons:
            List<Person>.from(json["results"].map((x) => Person.fromJson(x))),
        totalPages: json["total_pages"],
        totalResults: json["total_results"],
      );

  PersonResponse.withError(String errorValue)
      : persons = List(),
        error = errorValue;

  Map<String, dynamic> toJson() => {
        "page": page,
        "results": List<dynamic>.from(persons.map((x) => x.toJson())),
        "total_pages": totalPages,
        "total_results": totalResults,
      };
}
