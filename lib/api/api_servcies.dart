import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:movie_app/api/api_const.dart';
import 'package:movie_app/movies/model_view/browse_name_model.dart';
import 'package:movie_app/movies/model_view/movies_details_model.dart';
import 'package:movie_app/movies/model_view/movies_model.dart';

class ApiServices {
  static Future<MoviesModel> getPopularMovies() async {
    var url = Uri.https(ApiConsts.baseUrl, ApiConsts.popularEndPoint,
        {'language': 'en-US', 'page': '1'});
    var header = {'Authorization': 'Bearer ${ApiConsts.apiToken}'};
    var response = await http.get(url, headers: header);
    if (response.statusCode == 200) {
      var json = jsonDecode(response.body);
      return MoviesModel.fromJson(json);
    } else {
      throw Exception('failed');
    }
  }

  static Future<MoviesModel?> getupcomingMovies() async {
    var url = Uri.https(ApiConsts.baseUrl, ApiConsts.upcomingEndPoints,
        {'language': 'en-US', 'page': '1'});
    var header = {
      'Authorization': 'Bearer ${ApiConsts.apiToken}',
    };
    var response = await http.get(url, headers: header);
    if (response.statusCode == 200) {
      String body = response.body;
      var json = jsonDecode(body);
      return MoviesModel.fromJson(json);
    } else {
      return null;
    }
  }

  static Future<MoviesModel?> getRecommendedMovies() async {
    var url = Uri.https(ApiConsts.baseUrl, ApiConsts.recommendedEndPoints,
        {'language': 'en-US', 'page': '1'});
    var header = {
      'Authorization': 'Bearer ${ApiConsts.apiToken}',
    };
    var response = await http.get(url, headers: header);
    if (response.statusCode == 200) {
      String body = response.body;
      var json = jsonDecode(body);
      return MoviesModel.fromJson(json);
    } else {
      return null;
    }
  }

  static Future<MoviesDetailsModel?> getDetalisMovies(String movieId) async {
    var details = '/3/movie/$movieId';
    var url = Uri.https(ApiConsts.baseUrl, details, {
      'language': 'en-US',
      'page': '1',
    });
    var header = {
      'Authorization': 'Bearer ${ApiConsts.apiToken}',
    };
    var response = await http.get(url, headers: header);
    if (response.statusCode == 200) {
      String body = response.body;
      var json = jsonDecode(body);
      return MoviesDetailsModel.fromJson(json);
    } else {
      return null;
    }
  }

  static Future<MoviesModel?> similarMovie(String movieId) async {
    String similar = '/3/movie/$movieId/similar';
    var url = Uri.https(ApiConsts.baseUrl, similar, {
      'language': 'en-US',
      'page': '1',
    });
    var header = {
      'Authorization': 'Bearer ${ApiConsts.apiToken}',
    };
    var response = await http.get(url, headers: header);
    if (response.statusCode == 200) {
      String body = response.body;
      var json = jsonDecode(body);
      return MoviesModel.fromJson(json);
    } else {
      return null;
    }
  }

  static Future<MoviesModel> getMoviesSearch(String quary) async {
    var url = Uri.https(ApiConsts.baseUrl, ApiConsts.searchEndpoints, {
      'apiKey': ApiConsts.apiKey,
      'language': 'en-US',
      'include_adult': 'false',
      'page': '1',
      'query': quary
    });
     var header = {
      'Authorization': 'Bearer ${ApiConsts.apiToken}',
    };
    var response = await http.get(url,headers: header);
    String body = response.body;
    var json = jsonDecode(body);
    return MoviesModel.fromJson(json);
  }
    static Future<BrowseNameModel?> getBrowseNameMovies() async {
    var url = Uri.https(ApiConsts.baseUrl, ApiConsts.browseNameEndpoints, {
      'language': 'en-US',
      'page': '1',
    });
    var header = {
      'Authorization': 'Bearer ${ApiConsts.apiToken}',
    };
    var response = await http.get(url, headers: header);
    if (response.statusCode == 200) {
      String body = response.body;
      var json = jsonDecode(body);
      return BrowseNameModel.fromJson(json);
    } else {
      return null;
    }
  }
     static Future<MoviesModel?>getDiscoverMovie(int genreId) async {
    var url = Uri.https(ApiConsts.baseUrl, ApiConsts.browseDiscoverEndpoints, {
      'language': 'en-US',
      'include_adult': 'false',
      'include_video': 'false',
      'page': '1',
      'sort_by': 'popularity.desc',
      'with_genres': '$genreId'
    });
    var header = {
      'Authorization': 'Bearer ${ApiConsts.apiToken}',
    };
    var response = await http.get(url, headers: header);
    if (response.statusCode == 200) {
      String body = response.body;
      var json = jsonDecode(body);
      return MoviesModel.fromJson(json);
    } else {
      return null;
    }
  }



}
