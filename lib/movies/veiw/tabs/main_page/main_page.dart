import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:movie_app/api/api_servcies.dart';
import 'package:movie_app/common/widgets/custom_error_widget.dart';
import 'package:movie_app/common/widgets/custom_loading_widget.dart';
import 'package:movie_app/firebase/firebase_services.dart';
import 'package:movie_app/movies/data/popular_movies_list.dart';
import 'package:movie_app/movies/data/recommended_movies_list.dart';
import 'package:movie_app/movies/data/release_movie_list.dart';
import 'package:movie_app/movies/model_view/movies_model.dart';
import 'package:movie_app/movies/model_view/movies_model_firebase.dart';

class MainPageTab extends StatelessWidget {
  static const String routeName = 'mainPageScreen';
  const MainPageTab({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView(
      padding: const EdgeInsets.all(10.0),
      children: [
        FutureBuilder<MoviesModel>(
          future: ApiServices.getPopularMovies(),
          builder: (context, snapshot) {
            if (snapshot.connectionState == ConnectionState.waiting) {
              return const CustomLoadingWidget();
            } else if (snapshot.hasError) {
              return CustomErrorWidget(
                errorMessage: snapshot.error.toString(),
              );
            } else if (snapshot.hasData) {
              MoviesModel? popularMoviesModel = snapshot.data;
              List<Results> movies = popularMoviesModel?.results ?? [];
              return CarouselSlider(
                items: movies.map((movie) {
                  return PopularMoviesList(results: movie);
                }).toList(),
                options: CarouselOptions(
                  viewportFraction: 1,
                  autoPlay: true,
                  height: MediaQuery.of(context).size.height * 0.37,
                ),
              );
            }
            return const SizedBox();
          },
        ),
        SizedBox(
          height: MediaQuery.of(context).size.height * 0.05,
        ),

        // New Releases Section
        Container(
          height: MediaQuery.of(context).size.height * 0.27,
          color: Colors.grey,
          padding: const EdgeInsets.all(10),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Padding(
                padding: EdgeInsets.only(bottom: 10, left: 10),
                child: Text(
                  'New Releases',
                  style: TextStyle(color: Colors.white, fontSize: 18),
                ),
              ),
              FutureBuilder(
                  future: ApiServices.getupcomingMovies(),
                  builder: (context, snapshot) {
                    MoviesModel? upcomingMovies = snapshot.data;
                    List<Results> movies = upcomingMovies?.results ?? [];
                    return Expanded(
                      child: ListView.builder(
                        scrollDirection: Axis.horizontal,
                        itemCount: movies.length,
                        itemBuilder: (context, index) {
                          return FutureBuilder<bool>(
                            future: FirebaseServices.existMovie(
                              movies[index].id.toString(),
                            ),
                            builder: (context, snapshot) {
                              if (snapshot.connectionState ==
                                  ConnectionState.waiting) {
                                return const Padding(
                                  padding: EdgeInsets.all(10.0),
                                  child: CustomLoadingWidget(),
                                );
                              } else if (snapshot.hasError) {
                                return CustomErrorWidget(
                                    errorMessage: snapshot.error.toString());
                              } else if (snapshot.hasData) {
                                MoviesModelFirebase movieModel =
                                    MoviesModelFirebase(
                                  results: movies[index],
                                );
                                movieModel.isWatchList = snapshot.data ?? false;
                                return ReleaseMovieList(
                                  results: movieModel,
                                );
                              } else {
                                return const Center(
                                  child: Text(
                                    "No data available",
                                    style: TextStyle(color: Colors.white),
                                  ),
                                );
                              }
                            },
                          );
                        },
                      ),
                    );
                  }),
            ],
          ),
        ),
        SizedBox(
               height: MediaQuery.of(context).size.height*0.08,
        ),
         Container(
          height: MediaQuery.of(context).size.height * 0.27,
          color: Colors.grey,
          padding: const EdgeInsets.all(10),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Padding(
                padding: EdgeInsets.only(bottom: 10, left: 10),
                child: Text(
                  'recommended',
                  style: TextStyle(color: Colors.white, fontSize: 18),
                ),
              ),
              FutureBuilder(
                  future: ApiServices.getRecommendedMovies(),
                  builder: (context, snapshot) {
                    MoviesModel? upcomingMovies = snapshot.data;
                    List<Results> movies = upcomingMovies?.results ?? [];
                    return Expanded(
                      child: ListView.builder(
                        scrollDirection: Axis.horizontal,
                        itemCount: movies.length,
                        itemBuilder: (context, index) {
                          return FutureBuilder<bool>(
                            future: FirebaseServices.existMovie(
                              movies[index].id.toString(),
                            ),
                            builder: (context, snapshot) {
                              if (snapshot.connectionState ==
                                  ConnectionState.waiting) {
                                return const Padding(
                                  padding: EdgeInsets.all(10.0),
                                  child: CustomLoadingWidget(),
                                );
                              } else if (snapshot.hasError) {
                                return CustomErrorWidget(
                                    errorMessage: snapshot.error.toString());
                              } else if (snapshot.hasData) {
                                MoviesModelFirebase movieModel =
                                    MoviesModelFirebase(
                                  results: movies[index],
                                );
                                movieModel.isWatchList = snapshot.data ?? false;
                                return RecommendedMoviesList(
                                  results: movieModel,
                                );
                              } else {
                                return const Center(
                                  child: Text(
                                    "No data available",
                                    style: TextStyle(color: Colors.white),
                                  ),
                                );
                              }
                            },
                          );
                        },
                      ),
                    );
                  }),
            ],
          ),
        ),
      ],
    );
  }
}
