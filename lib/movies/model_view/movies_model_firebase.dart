import 'package:movie_app/movies/model_view/movies_model.dart';

class MoviesModelFirebase {
  String id;
  Results results;
  bool isWatchList;
  MoviesModelFirebase({
    this.id = "",
    required this.results,
    this.isWatchList = false,
  });
  MoviesModelFirebase.fromJson(Map<String, dynamic> json)
      : this(
          id: json['id'] ?? "",
          results: Results.fromJson(json["results"]),
          isWatchList: json['isWatchList'] ?? false,
        );
  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data["id"] = id;
    data["results"] = results.toJson();
    data["isWatchList"] = isWatchList;
    return data;
  }

  MoviesModelFirebase copyWith({
    String? id,
    Results? results,
    bool? isWatchList,
  }) {
    return MoviesModelFirebase(
      id: id ?? this.id,
      results: results ?? this.results,
      isWatchList: isWatchList ?? this.isWatchList,
    );
  }
}