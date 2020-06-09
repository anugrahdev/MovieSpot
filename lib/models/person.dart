class Person {
  Person({
    this.adult,
    this.gender,
    this.name,
    this.id,
    // this.knownFor,
    this.knownForDepartment,
    this.profilePath,
    this.popularity,
    // this.mediaType,
  });

  bool adult;
  int gender;
  String name;
  int id;
  // List<KnownFor> knownFor;
  String knownForDepartment;
  String profilePath;
  double popularity;
  // ResultMediaType mediaType;

  factory Person.fromJson(Map<String, dynamic> json) => Person(
        adult: json["adult"],
        gender: json["gender"],
        name: json["name"],
        id: json["id"],
        // knownFor: List<KnownFor>.from(
        //     json["known_for"].map((x) => KnownFor.fromJson(x))),
        knownForDepartment: json["known_for_department"],
        profilePath: json["profile_path"],
        popularity: json["popularity"].toDouble(),
        // mediaType: resultMediaTypeValues.map[json["media_type"]],
      );

  Map<String, dynamic> toJson() => {
        "adult": adult,
        "gender": gender,
        "name": name,
        "id": id,
        // "known_for": List<dynamic>.from(knownFor.map((x) => x.toJson())),
        "known_for_department": knownForDepartment,
        "profile_path": profilePath,
        "popularity": popularity,
        // "media_type": resultMediaTypeValues.reverse[mediaType],
      };
}

// class KnownFor {
//   KnownFor({
//     this.id,
//     this.video,
//     this.voteCount,
//     this.voteAverage,
//     this.title,
//     this.releaseDate,
//     this.originalLanguage,
//     this.originalTitle,
//     this.genreIds,
//     this.backdropPath,
//     this.adult,
//     this.overview,
//     this.posterPath,
//     this.popularity,
//     this.mediaType,
//   });

//   int id;
//   bool video;
//   int voteCount;
//   double voteAverage;
//   String title;
//   DateTime releaseDate;
//   OriginalLanguage originalLanguage;
//   String originalTitle;
//   List<int> genreIds;
//   String backdropPath;
//   bool adult;
//   String overview;
//   String posterPath;
//   double popularity;
//   KnownForMediaType mediaType;

//   factory KnownFor.fromJson(Map<String, dynamic> json) => KnownFor(
//         id: json["id"],
//         video: json["video"],
//         voteCount: json["vote_count"],
//         voteAverage: json["vote_average"].toDouble(),
//         title: json["title"],
//         releaseDate: DateTime.parse(json["release_date"]),
//         originalLanguage: originalLanguageValues.map[json["original_language"]],
//         originalTitle: json["original_title"],
//         genreIds: List<int>.from(json["genre_ids"].map((x) => x)),
//         backdropPath: json["backdrop_path"],
//         adult: json["adult"],
//         overview: json["overview"],
//         posterPath: json["poster_path"],
//         popularity: json["popularity"].toDouble(),
//         mediaType: knownForMediaTypeValues.map[json["media_type"]],
//       );

//   Map<String, dynamic> toJson() => {
//         "id": id,
//         "video": video,
//         "vote_count": voteCount,
//         "vote_average": voteAverage,
//         "title": title,
//         "release_date":
//             "${releaseDate.year.toString().padLeft(4, '0')}-${releaseDate.month.toString().padLeft(2, '0')}-${releaseDate.day.toString().padLeft(2, '0')}",
//         "original_language": originalLanguageValues.reverse[originalLanguage],
//         "original_title": originalTitle,
//         "genre_ids": List<dynamic>.from(genreIds.map((x) => x)),
//         "backdrop_path": backdropPath,
//         "adult": adult,
//         "overview": overview,
//         "poster_path": posterPath,
//         "popularity": popularity,
//         "media_type": knownForMediaTypeValues.reverse[mediaType],
//       };
// }

// enum KnownForMediaType { MOVIE }

// final knownForMediaTypeValues = EnumValues({"movie": KnownForMediaType.MOVIE});

// enum OriginalLanguage { EN }

// final originalLanguageValues = EnumValues({"en": OriginalLanguage.EN});

// enum KnownForDepartment { ACTING, DIRECTING }

// final knownForDepartmentValues = EnumValues({
//   "Acting": KnownForDepartment.ACTING,
//   "Directing": KnownForDepartment.DIRECTING
// });

// enum ResultMediaType { PERSON }

// final resultMediaTypeValues = EnumValues({"person": ResultMediaType.PERSON});

// class EnumValues<T> {
//   Map<String, T> map;
//   Map<T, String> reverseMap;

//   EnumValues(this.map);

//   Map<T, String> get reverse {
//     if (reverseMap == null) {
//       reverseMap = map.map((k, v) => new MapEntry(v, k));
//     }
//     return reverseMap;
//   }
