import 'package:flutter/material.dart';
import 'package:movie_app/api/api_const.dart';
import 'package:movie_app/movies/model_view/movies_model.dart';
import 'package:movie_app/movies/model_view/movies_model_firebase.dart';
import 'package:movie_app/movies/veiw/tabs/main_page/movie_details_screen.dart';

class PopularMoviesList extends StatefulWidget {
  const PopularMoviesList({
    super.key,
    this.results, this.modelFirebase,
  });
  final Results? results;
 final MoviesModelFirebase ?modelFirebase;

  @override
  State<PopularMoviesList> createState() => _PopularMoviesListState();
}

class _PopularMoviesListState extends State<PopularMoviesList> {
  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Image.network(
              ApiConsts.imageUrl + widget.results!.backdropPath!,
              fit: BoxFit.contain,
            ),
            SizedBox(
            height: MediaQuery.of(context).size.height * 0.38,
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  Container(
                    margin: const EdgeInsets.symmetric(horizontal: 10),
                    alignment: Alignment.bottomLeft,
                    width: MediaQuery.of(context).size.width * 0.35,
                    height: MediaQuery.of(context).size.height * 0.25,
                    decoration: BoxDecoration(
                        borderRadius: const BorderRadius.all(Radius.circular(10)),
                        color: Colors.white,
                        image: DecorationImage(
                            image: NetworkImage(ApiConsts.imageUrl +
                                widget.results!.posterPath!),
                            fit: BoxFit.fill)),
                              ),]
                ),
            ),
        Positioned(
          bottom: MediaQuery.of(context).size.width * 0.01,
          left: MediaQuery.of(context).size.height * 0.25,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                widget.results?.originalTitle ?? '',
                style: const TextStyle(
                  color: Colors.white,
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                ),
              ),
              Text(
                widget.results?.releaseDate ?? '',
                style: const TextStyle(
                  color: Colors.white70,
                  fontSize: 14,
                ),
              ),
            ],
          ),
        ),
        Positioned(

          child: IconButton(
            onPressed: () {
              Navigator.of(context).pushNamed(MovieDetailsScreen.routeName,arguments:  widget.modelFirebase);
            },
            icon:const Center(
              child:  Icon(
                Icons.play_circle_fill,
                color: Colors.white,
                size: 60,
              ),
            ),
          ),
        ),
      ],
    );
  }
}
