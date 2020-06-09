import 'package:moviespot/models/videos.dart';

class VideosResponse {
  VideosResponse({
    this.results,
  });

  List<Videos> results;
  String error;

  factory VideosResponse.fromJson(Map<String, dynamic> json) => VideosResponse(
        results:
            List<Videos>.from(json["results"].map((x) => Videos.fromJson(x))),
      );
  VideosResponse.withError(String errorValue)
      : results = List(),
        error = errorValue;

  Map<String, dynamic> toJson() => {
        "results": List<dynamic>.from(results.map((x) => x.toJson())),
      };
}
