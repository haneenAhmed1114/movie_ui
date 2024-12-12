import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:movie_app/api/api_servcies.dart';
import 'package:movie_app/common/widgets/custom_error_widget.dart';
import 'package:movie_app/common/widgets/custom_loading_widget.dart';
import 'package:movie_app/movies/data/movie_list_veiw.dart';
import 'package:movie_app/movies/model_view/Movie_Thumb_Model.dart';
import 'package:movie_app/movies/model_view/popular_movies_model.dart';

class PopularMoviesList extends StatefulWidget {
  const PopularMoviesList({super.key, });


  @override
  State<PopularMoviesList> createState() => _PopularMoviesListState();
}

class _PopularMoviesListState extends State<PopularMoviesList> {
  
  // var future;
  // @override
  // void initState() {
  //   super.initState();
  //   future=ApiServices.getPopularMovies();
  //   print(future);
  // }
  @override
  Widget build(BuildContext context) {
    return FutureBuilder<PopularMoviesModel>(future: ApiServices.getPopularMovies(), builder: (context, snapshot) {
                
                 if (snapshot.connectionState == ConnectionState.waiting) {
                  return const CustomLoadingWidget();
                 }
                 else if (snapshot.hasError) {
                    return  CustomErrorWidget(errorMessage: snapshot.error.toString());
                  }
                else  if(snapshot.hasData){
               PopularMoviesModel? popularMoviesModel=snapshot.data;
               print('dddddd${snapshot.data}');
               List<Results>movies=popularMoviesModel?.results??[];
                    return MovieListVeiw(movie: movies) ;
                  }
                  return  Container();
                  
    }
  
    );
   
                  }
  }
