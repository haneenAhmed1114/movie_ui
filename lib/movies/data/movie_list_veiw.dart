import 'package:flutter/material.dart';
import 'package:movie_app/movies/model_view/popular_movies_model.dart';
import 'package:movie_app/movies/veiw/tabs/main_page/main_page.dart';

class MovieListVeiw extends StatelessWidget {
  const MovieListVeiw({super.key, required this.movie});
final List< Results> movie;
  @override
  Widget build(BuildContext context) {
    return SliverList(delegate: 
    SliverChildBuilderDelegate(
      childCount: movie.length,
      (context, index) {
        return MainPageTab(results:movie[index] ,);

    },)) ;
  }
}
