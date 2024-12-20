import 'package:flutter/material.dart';
import 'package:movie_app/api/api_servcies.dart';
import 'package:movie_app/common/widgets/custom_error_widget.dart';
import 'package:movie_app/common/widgets/custom_loading_widget.dart';
import 'package:movie_app/firebase/firebase_services.dart';
import 'package:movie_app/movies/data/movies_details_veiw.dart';
import 'package:movie_app/movies/data/recommended_movies_list.dart';
import 'package:movie_app/movies/model_view/movies_details_model.dart';
import 'package:movie_app/movies/model_view/movies_model.dart';
import 'package:movie_app/movies/model_view/movies_model_firebase.dart';

class MovieDetailsScreen extends StatelessWidget {
  static const String routeName = 'movieDetailsScreen';

  const MovieDetailsScreen({super.key});

  //final MoviesModelFirebase? moviesModelFirebase;

  @override
  Widget build(BuildContext context) {
     MoviesModelFirebase? movieModel =
        ModalRoute.of(context)!.settings.arguments as MoviesModelFirebase;
    return ListView(
      children: [
        FutureBuilder(
            future: ApiServices.getDetalisMovies(
                movieModel.results.id.toString()),
            builder: (context, snapshot) {
              if (snapshot.connectionState == ConnectionState.waiting) {
                return const CustomLoadingWidget();
              } else if (snapshot.hasError) {
                return CustomErrorWidget(
                    errorMessage: snapshot.error.toString());
              } else if (snapshot.hasData) {
                MoviesDetailsModel moviesDetailsModel = snapshot.data!;
                return MovieDetailsVeiw(detailsModel: moviesDetailsModel);
              } else {
                return const Center(child: Text("No data available"));
              }
            }),
             SizedBox(
            height: MediaQuery.of(context).size.height * 0.05,
          ),
          Container(
            height: MediaQuery.of(context).size.height * 0.4,
            color: Colors.grey,
            padding: EdgeInsets.only(
                top: MediaQuery.of(context).size.height * 0.02,
                bottom: MediaQuery.of(context).size.height * 0.02,
                right: 10,
                left: 10),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Padding(
                  padding: EdgeInsets.only(bottom: 10),
                  child: Text(
                    'More like this',
                    style: TextStyle(color: Colors.white,fontSize: 20),
                  ),
                ),
                FutureBuilder(
                    future: ApiServices.similarMovie(
                        movieModel.results.id.toString()),
                    builder: (context, snapshot) {
                      MoviesModel? moreLike = snapshot.data;
                      List<Results> movies = moreLike?.results ?? [];
                      return Expanded(
                        child: ListView.builder(
                          scrollDirection: Axis.horizontal,
                          itemBuilder: (_, index) {
                            return FutureBuilder<bool>(
                              future: FirebaseServices.existMovie(
                                  movies[index].id.toString()),
                              builder: (BuildContext context, snapshot) {
                                if (snapshot.connectionState ==
                                    ConnectionState.waiting) {
                                  return const CustomLoadingWidget();
                                } else if (snapshot.hasError) {
                                  return CustomErrorWidget(errorMessage: snapshot.error.toString());
                                } else if (snapshot.hasData) {
                                  MoviesModelFirebase movie =
                                      MoviesModelFirebase(results: movies[index]);
                                  movie.isWatchList = snapshot.data!;
                                  return RecommendedMoviesList(
                                    results: movieModel,
                                  );
                                } else {
                                  return const Center(
                                      child: Text("No data available"));
                                }
                              },
                            );
                          },
                          itemCount: movies.length,
                        ),
                      );
                    })
              ],
            ),
          ),
      ],
    );
  }
}
