import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:movie_app/common/app_colors.dart';
import 'package:movie_app/firebase/firebase_services.dart';
import 'package:movie_app/movies/model_view/movies_model_firebase.dart';


class MovieProvider extends ChangeNotifier {
  bool isWatch = false;
  Stream<List<MoviesModelFirebase>> getMovies() async* {
    try {
      yield* FirebaseServices.getWatchList();
    } catch (e) {
 Fluttertoast.showToast(
            msg: e.toString(),
            toastLength: Toast.LENGTH_SHORT,
            gravity: ToastGravity.BOTTOM,
            timeInSecForIosWeb: 1,
            backgroundColor:AppColors.goldenColor,
            textColor: Colors.white,
            fontSize: 16.0);
    }
  }

  Future<void> addMovie(MoviesModelFirebase movie) async {
    try {
      await FirebaseServices.addMovieWatchList(movie).then((value) {
        Fluttertoast.showToast(
            msg: "Add to Watchlist",
            toastLength: Toast.LENGTH_SHORT,
            gravity: ToastGravity.BOTTOM,
            timeInSecForIosWeb: 1,
            backgroundColor:AppColors.goldenColor,
            textColor: Colors.white,
            fontSize: 16.0);
      });
      notifyListeners();
    } catch (e) {
      Fluttertoast.showToast(
          msg: "something went wrong",
          toastLength: Toast.LENGTH_SHORT,
          gravity: ToastGravity.BOTTOM,
          timeInSecForIosWeb: 1,
          backgroundColor: Colors.blue,
          textColor: Colors.white,
          fontSize: 16.0);
    }
  }

  Future<void> deleteMovie(MoviesModelFirebase movie) async {
    try {
      await FirebaseServices.deleteMovieWatchList(movie);
      notifyListeners();
    } catch (e) {
      Fluttertoast.showToast(
          msg: "something went wrong",
          toastLength: Toast.LENGTH_SHORT,
          gravity: ToastGravity.BOTTOM,
          timeInSecForIosWeb: 1,
          backgroundColor: Colors.blue,
          textColor: Colors.white,
          fontSize: 16.0);
    }
  }
}