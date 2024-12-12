import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:movie_app/api/api_const.dart';
import 'package:movie_app/movies/model_view/popular_movies_model.dart';

class ApiServices {
  static Future<PopularMoviesModel> getPopularMovies() async {
    var url = Uri.https(ApiConsts.baseUrl, ApiConsts.popularEndPoint,
        {'language': 'en-US', 'page': '1'});
    var header = {'Authorization': 'Bearer ${ApiConsts.apiToken}'};
    print(url);
    var response = await http.get(url, headers: header);
    if (response.statusCode == 200) {
      var json = jsonDecode(response.body);
      return PopularMoviesModel.fromJson(json);
    } else {
      throw Exception('failed');
    }
  }
}
