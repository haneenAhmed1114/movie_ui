import 'package:flutter/material.dart';
import 'package:movie_app/api/api_servcies.dart';
import 'package:movie_app/common/widgets/custom_error_widget.dart';
import 'package:movie_app/common/widgets/custom_loading_widget.dart';
import 'package:movie_app/firebase/firebase_services.dart';
import 'package:movie_app/movies/model_view/browse_name_model.dart';
import 'package:movie_app/movies/model_view/movies_model.dart';
import 'package:movie_app/movies/model_view/movies_model_firebase.dart';
import 'package:movie_app/movies/veiw/tabs/watchlist_tab/widget/custom_watch_card.dart';

class GenreBrowseScreen extends StatelessWidget {
  const GenreBrowseScreen({super.key, });

  static const String routeName = "genreBrowseScreen";

  @override
  Widget build(BuildContext context) {
    Genres genre = ModalRoute.of(context)!.settings.arguments as Genres;
    return Scaffold(
      backgroundColor: Colors.black,
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              IconButton(
                onPressed: () {
                  Navigator.of(context).pop();
                },
                icon: const Icon(
                  Icons.arrow_back,
                  color: Colors.white,
                ),
              ),
              SizedBox(width: MediaQuery.of(context).size.width * 0.04),
              Text(
                genre.name ?? 'Genre',
                style: const TextStyle(color: Colors.white, fontSize: 18),
              ),
            ],
          ),
          FutureBuilder(
            future: ApiServices.getDiscoverMovie(genre.id ?? 0),
            builder: (context, snapshot) {
              if (snapshot.connectionState == ConnectionState.waiting) {
                return const Expanded(child: CustomLoadingWidget());
              } else if (snapshot.hasError) {
                return Expanded(
                  child: CustomErrorWidget(errorMessage: snapshot.error.toString()),
                );
              } else if (snapshot.hasData) {
                MoviesModel? discoverMovies = snapshot.data ;
                List<Results> movies = discoverMovies?.results ?? [];
                if (movies.isEmpty) {
                  return const Expanded(
                    child: Center(
                      child: Text(
                        "No movies available for this genre.",
                        style: TextStyle(color: Colors.white),
                      ),
                    ),
                  );
                }

                return Expanded(
                  child: ListView.separated(
                    itemCount: movies.length,
                    itemBuilder: (context, index) {
                      return FutureBuilder<bool>(
                        future: FirebaseServices.existMovie(movies[index].id.toString()),
                        builder: (context, firebaseSnapshot) {
                          if (firebaseSnapshot.connectionState == ConnectionState.waiting) {
                            return const CustomLoadingWidget();
                          } else if (firebaseSnapshot.hasError) {
                            return CustomErrorWidget(errorMessage: firebaseSnapshot.error.toString());
                          } else if (firebaseSnapshot.hasData) {
                           // print("API Response Data: ${snapshot.data}");
                            MoviesModelFirebase movieModel = MoviesModelFirebase(results: movies[index]);
                            movieModel.isWatchList = firebaseSnapshot.data ?? false;

                            return WatchCard(movieModel: movieModel);
                          } else {
                            return const Center(
                              child: Text("No data available", style: TextStyle(color: Colors.white)),
                            );
                          }
                        },
                      );
                    },
                    separatorBuilder: (_, __) => const Divider(color: Colors.white),
                  ),
                );
              }

              return const Expanded(
                child: Center(
                  child: Text(
                    "Something went wrong.",
                    style: TextStyle(color: Colors.white),
                  ),
                ),
              );
            },
          ),
        ],
      ),
    );
  }
}
