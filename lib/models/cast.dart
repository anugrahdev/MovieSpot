class Cast {
  Cast({
    this.castId,
    this.character,
    this.creditId,
    this.gender,
    this.id,
    this.name,
    this.order,
    this.profilePath,
  });

  int castId;
  String character;
  String creditId;
  int gender;
  int id;
  String name;
  int order;
  String profilePath;

  factory Cast.fromJson(Map<String, dynamic> json) => Cast(
        castId: json["cast_id"],
        character: json["character"],
        creditId: json["credit_id"],
        gender: json["gender"],
        id: json["id"],
        name: json["name"],
        order: json["order"],
        profilePath: json["profile_path"] == null ? null : json["profile_path"],
      );

  Map<String, dynamic> toJson() => {
        "cast_id": castId,
        "character": character,
        "credit_id": creditId,
        "gender": gender,
        "id": id,
        "name": name,
        "order": order,
        "profile_path": profilePath == null ? null : profilePath,
      };
}

class Crew {
  Crew({
    this.creditId,
    this.department,
    this.gender,
    this.id,
    this.job,
    this.name,
    this.profilePath,
  });

  String creditId;
  Department department;
  int gender;
  int id;
  String job;
  String name;
  String profilePath;

  factory Crew.fromJson(Map<String, dynamic> json) => Crew(
        creditId: json["credit_id"],
        department: departmentValues.map[json["department"]],
        gender: json["gender"],
        id: json["id"],
        job: json["job"],
        name: json["name"],
        profilePath: json["profile_path"] == null ? null : json["profile_path"],
      );

  Map<String, dynamic> toJson() => {
        "credit_id": creditId,
        "department": departmentValues.reverse[department],
        "gender": gender,
        "id": id,
        "job": job,
        "name": name,
        "profile_path": profilePath == null ? null : profilePath,
      };
}

enum Department {
  PRODUCTION,
  COSTUME_MAKE_UP,
  ART,
  SOUND,
  VISUAL_EFFECTS,
  DIRECTING,
  WRITING,
  CAMERA,
  EDITING,
  CREW,
  LIGHTING
}

final departmentValues = EnumValues({
  "Art": Department.ART,
  "Camera": Department.CAMERA,
  "Costume & Make-Up": Department.COSTUME_MAKE_UP,
  "Crew": Department.CREW,
  "Directing": Department.DIRECTING,
  "Editing": Department.EDITING,
  "Lighting": Department.LIGHTING,
  "Production": Department.PRODUCTION,
  "Sound": Department.SOUND,
  "Visual Effects": Department.VISUAL_EFFECTS,
  "Writing": Department.WRITING
});

class EnumValues<T> {
  Map<String, T> map;
  Map<T, String> reverseMap;

  EnumValues(this.map);

  Map<T, String> get reverse {
    if (reverseMap == null) {
      reverseMap = map.map((k, v) => new MapEntry(v, k));
    }
    return reverseMap;
  }
}
