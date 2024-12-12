import 'package:flutter/material.dart';
import 'package:movie_app/api/api_const.dart';
import 'package:movie_app/movies/model_view/popular_movies_model.dart';
import 'package:movie_app/movies/veiw/tabs/main_page/movie_details_screen.dart';

class PopularMoviesList extends StatefulWidget {
  const PopularMoviesList({
    super.key,
    this.results,
  });
  final Results? results;

  @override
  State<PopularMoviesList> createState() => _PopularMoviesListState();
}

class _PopularMoviesListState extends State<PopularMoviesList> {
  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Image.network(
          ApiConsts.imageUrl + widget.results!.posterPath!,
          height: 250,
          width: double.infinity,
          fit: BoxFit.cover,
        ),
        Positioned(
          bottom: 20,
          left: 20,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                widget.results?.title ?? '',
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
          top: 80,
          left: MediaQuery.of(context).size.width / 2 - 30,
          child: IconButton(
            onPressed: () {
              Navigator.of(context).pushNamed(MovieDetailsScreen.routeName);
            },
            icon: const Icon(
              Icons.play_circle_fill,
              color: Colors.white,
              size: 60,
            ),
          ),
        ),
      ],
    );
  }
}
