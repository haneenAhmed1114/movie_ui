import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:movie_app/api/api_servcies.dart';
import 'package:movie_app/common/app_assets.dart';
import 'package:movie_app/common/widgets/custom_error_widget.dart';
import 'package:movie_app/common/widgets/custom_loading_widget.dart';
import 'package:movie_app/movies/data/popular_movies_list.dart';
import 'package:movie_app/movies/model_view/popular_movies_model.dart';

class MainPageTab extends StatelessWidget {
  static const String routeName = 'mainPageScreen';
  const MainPageTab({super.key});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Padding(
        padding: const EdgeInsets.all(10.0),
        child: Container(
          color: Colors.black,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              FutureBuilder<PopularMoviesModel>(
                  future: ApiServices.getPopularMovies(),
                  builder: (context, snapshot) {
                    if (snapshot.connectionState == ConnectionState.waiting) {
                      return const CustomLoadingWidget();
                    } else if (snapshot.hasError) {
                      return CustomErrorWidget(
                          errorMessage: snapshot.error.toString());
                    } else if (snapshot.hasData) {
                      PopularMoviesModel? popularMoviesModel = snapshot.data;
                      List<Results> movies = popularMoviesModel?.results ?? [];
                      return CarouselSlider(
                          items: movies.map((movie) {
                            return PopularMoviesList(results: movie);
                          }).toList(),
                          options: CarouselOptions(
                              viewportFraction: 1,
                              autoPlay: true,
                              height:
                                  MediaQuery.of(context).size.height * 0.37));
                    }
                    return Container();
                  }),
              const SizedBox(height: 20),
              const Padding(
                padding: EdgeInsets.all(8.0),
                child: Text(
                  "New Releases",
                  style: TextStyle(color: Colors.white, fontSize: 18),
                ),
              ),
              const SizedBox(height: 10),
              SizedBox(
                height: 170,
                child: ListView.builder(
                  scrollDirection: Axis.horizontal,
                  itemCount: 10,
                  itemBuilder: (context, index) => Container(
                    color: Colors.grey[800],
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Center(
                          child: Image.asset(
                            AppAssets.sImage,
                            height: 150,
                            width: 140,
                            alignment: Alignment.center,
                            fit: BoxFit.contain,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
              const SizedBox(height: 20),
              const Padding(
                padding: EdgeInsets.all(8.0),
                child: Text(
                  "Recomended",
                  style: TextStyle(color: Colors.white, fontSize: 18),
                ),
              ),
              const SizedBox(height: 10),
              SizedBox(
                height: 170,
                child: ListView.builder(
                  scrollDirection: Axis.horizontal,
                  itemCount: 10,
                  itemBuilder: (context, index) => Container(
                    color: Colors.grey[800],
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Center(
                          child: Image.asset(
                            AppAssets.rImage,
                            height: 150,
                            width: 140,
                            alignment: Alignment.center,
                            fit: BoxFit.contain,
                          ),
                        ),
                        Text(
                          "Movie ${index + 1}",
                          style: const TextStyle(
                              color: Colors.white, fontSize: 12),
                          maxLines: 1,
                          overflow: TextOverflow.ellipsis,
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
