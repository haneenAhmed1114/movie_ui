import 'package:flutter/material.dart';
import 'package:movie_app/api/api_const.dart';
import 'package:movie_app/common/app_assets.dart';
import 'package:movie_app/movies/model_view/movies_model_firebase.dart';
import 'package:movie_app/provider/movie_provider.dart';
import 'package:provider/provider.dart';

class ReleaseMovieList extends StatefulWidget {
  const ReleaseMovieList({super.key, this.results});
    final MoviesModelFirebase? results;

  @override
  State<ReleaseMovieList> createState() => _ReleaseMovieListState();
}

class _ReleaseMovieListState extends State<ReleaseMovieList> {
  @override
  Widget build(BuildContext context) {
    return 
        Container(
        margin: const EdgeInsets.symmetric(horizontal: 10),
        alignment: Alignment.topLeft,
        height: MediaQuery.of(context).size.height * 0.20,
        width: MediaQuery.of(context).size.width * 0.33,
        decoration: BoxDecoration(
            borderRadius: const BorderRadius.all(Radius.circular(10)),
            color: Colors.transparent,
            image: DecorationImage(
                image: NetworkImage(ApiConsts.imageUrl +
                    widget.results!.results.posterPath!),
                fit: BoxFit.fill)),
                child: GestureDetector(
          onTap: () async {
            setState(() {
              widget.results!.isWatchList = !widget.results!.isWatchList;
            });

            MoviesModelFirebase updatedMovie = widget.results!.copyWith(
              results: widget.results?.results,
              isWatchList: widget.results!.isWatchList,
            );
            if (updatedMovie.isWatchList) {
              Provider.of<MovieProvider>(context, listen: false)
                  .addMovie(updatedMovie);
            } else {
              Provider.of<MovieProvider>(context, listen: false)
                  .deleteMovie(updatedMovie);
            }
          },
          child: widget.results!.isWatchList
              ? Image.asset(AppAssets.bookMark)
              : Image.asset(AppAssets.notBookMark),
        ),
      );
  }
      
  }
