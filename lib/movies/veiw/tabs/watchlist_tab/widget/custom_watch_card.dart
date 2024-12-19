import 'package:flutter/material.dart';
import 'package:movie_app/api/api_const.dart';
import 'package:movie_app/common/app_assets.dart';
import 'package:movie_app/common/app_colors.dart';
import 'package:movie_app/movies/model_view/movies_model_firebase.dart';

import 'package:movie_app/provider/movie_provider.dart';

import 'package:provider/provider.dart';

class WatchCard extends StatefulWidget {
  const WatchCard({super.key, required this.movieModel});
  final MoviesModelFirebase? movieModel;

  @override
  State<WatchCard> createState() => _WatchCardState();
}

class _WatchCardState extends State<WatchCard> {
  @override
  Widget build(BuildContext context) {
    final results = widget.movieModel?.results;
    final String yearDate =
        results!.releaseDate != null && results.releaseDate!.length >= 4
            ? results.releaseDate!.substring(0, 4)
            : "N/A";
    final String backdropPath = results.backdropPath ?? '';
    final String originalTitle = results.originalTitle ?? 'No Title';
    final String voteAverage = results.voteAverage?.toStringAsFixed(1) ?? 'N/A';

    return GestureDetector(
      onTap: () {},
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 10),
        margin: const EdgeInsets.symmetric(vertical: 10),
        width: double.infinity,
        height: 100,
        color: Colors.black,
        child: Row(
          children: [
            Container(
              alignment: Alignment.topLeft,
              width: MediaQuery.of(context).size.width * 0.4,
              decoration: BoxDecoration(
                borderRadius: const BorderRadius.all(Radius.circular(10)),
                color: Colors.white,
                image: backdropPath.isNotEmpty
                    ? DecorationImage(
                        image: NetworkImage(ApiConsts.imageUrl + backdropPath),
                        fit: BoxFit.cover,
                      )
                    : null,
              ),
              child: GestureDetector(
                onTap: () async {
                  setState(() {
                    widget.movieModel!.isWatchList =
                        !widget.movieModel!.isWatchList;
                  });

                  final updatedMovie = widget.movieModel!.copyWith(
                    results: widget.movieModel?.results,
                    isWatchList: widget.movieModel!.isWatchList,
                  );

                  if (updatedMovie.isWatchList) {
                    Provider.of<MovieProvider>(context, listen: false)
                        .addMovie(updatedMovie);
                  } else {
                    Provider.of<MovieProvider>(context, listen: false)
                        .deleteMovie(updatedMovie);
                  }
                },
                child: widget.movieModel!.isWatchList
                    ? Image.asset(AppAssets.bookMark)
                    : Image.asset(AppAssets.notBookMark),
              ),
            ),
            Expanded(
              child: Padding(
                padding: const EdgeInsets.only(left: 10),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Text(
                      originalTitle,
                      style: const TextStyle(color: Colors.white, fontSize: 15),
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                    ),
                    Text(
                      yearDate,
                      style: const TextStyle(color: Colors.white, fontSize: 15),
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                    ),
                    Row(
                      children: [
                        Icon(
                          Icons.star,
                          color: AppColors.goldenColor,
                          size: MediaQuery.of(context).size.width * 0.05,
                        ),
                        Padding(
                          padding: const EdgeInsets.only(left: 5),
                          child: Text(
                            voteAverage,
                            style: const TextStyle(
                                color: AppColors.goldenColor, fontSize: 15),
                          ),
                        )
                      ],
                    )
                  ],
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
