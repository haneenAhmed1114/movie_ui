import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movie_app/api/api_const.dart';
import 'package:movie_app/common/app_colors.dart';
import 'package:movie_app/common/widgets/custom_error_widget.dart';
import 'package:movie_app/common/widgets/custom_loading_widget.dart';
import 'package:movie_app/movies/veiw/tabs/search_tab/search_screen.dart';
import 'package:movie_app/movies/veiw/tabs/search_tab/search_state.dart';

class SearchScreenView extends SearchDelegate {
 @override
  TextStyle get searchFieldStyle => const TextStyle(
        color:Colors.white,
        fontWeight: FontWeight.w600,
        fontSize: 15,
        
      );
      
      @override
ThemeData appBarTheme(BuildContext context) {
  
return Theme.of(context).copyWith(
scaffoldBackgroundColor: Colors.black,
appBarTheme: const AppBarTheme(color: Colors.black),
inputDecorationTheme:  searchFieldDecorationTheme ??
        InputDecorationTheme(
          enabledBorder:OutlineInputBorder (borderSide:  const BorderSide(color: AppColors.goldenColor),
    borderRadius: BorderRadius.circular(20),
    ),
    focusedBorder: OutlineInputBorder (borderSide: const BorderSide(color: AppColors.goldenColor),
    borderRadius: BorderRadius.circular(20),
    ),
    border: OutlineInputBorder (borderSide: const BorderSide(color:  AppColors.goldenColor),
    borderRadius: BorderRadius.circular(20),
    ),
    disabledBorder: OutlineInputBorder (borderSide: const BorderSide(color: AppColors.goldenColor),
    borderRadius: BorderRadius.circular(20),
    ),
    hintStyle:const TextStyle(color: Colors.grey),
        ),


);
}
      
  



  static final SearchScreen viewModel = SearchScreen(SearhInitState());
  

  @override
  List<Widget>? buildActions(BuildContext context) {
    return [
      IconButton(
        onPressed: () {
          query = '';
        },
        icon: const Icon(Icons.close),
        color: AppColors.goldenColor,
        iconSize: 25,
      )
    ];
  }

  @override
  Widget? buildLeading(BuildContext context) {
    return IconButton(
      onPressed: () {
        Navigator.of(context).pop();
      },
      icon: const Icon(Icons.arrow_back),
      color: AppColors.goldenColor,
      iconSize: 25,
    );
  }

  @override
  Widget buildResults(BuildContext context) {
    return BlocProvider(
        create: (context) => viewModel..searchMovies(query),
        child:
            BlocBuilder<SearchScreen, SearchState>(builder: (context, state) {
          if (state is SearchLoading) {
            return const CustomLoadingWidget();
          } else if (state is SearchSuccess) {
            var movies = state.results;
            if (movies == null || movies.isEmpty) {
              return const Center(child: Text('No movies found.'));
            }
            return ListView.separated(
              padding: const EdgeInsets.all(16),
              itemCount: movies.length,
              itemBuilder: (context, index) {
                var movie = movies[index];
                return GestureDetector(
                  onTap: () {
                    
                  },
                  child: Container(
                    padding: const EdgeInsets.symmetric(vertical: 8.0),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(8),
                      color: Colors.black,
                    ),
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        ClipRRect(
                          borderRadius: BorderRadius.circular(8),
                          child: Image.network(
                           ApiConsts.imageUrl + movie.posterPath!,
                            height: 100,
                            width: 80,
                            fit: BoxFit.cover,
                          ),
                        ),
                        const SizedBox(width: 12),
                        Expanded(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                movie.title ?? 'No Title',
                                style: const TextStyle(
                                  color: Colors.white,
                                  fontSize: 16,
                                  fontWeight: FontWeight.bold,
                                ),
                                maxLines: 1,
                                overflow: TextOverflow.ellipsis,
                              ),
                              const SizedBox(height: 8),
                              Text(
                                movie.overview ?? 'No Description',
                                style: const TextStyle(
                                  color: Colors.white70,
                                  fontSize: 14,
                                ),
                                maxLines: 2,
                                overflow: TextOverflow.ellipsis,
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                );
             
              },
              separatorBuilder: (context, index) {
                return const Divider(
                  color: Colors.grey,
                );
              },
            );
          } else if (state is SearchError) {
            return CustomErrorWidget(errorMessage: state.error.toString());
          }
          return const Center(
              child: Text(
            'Some Tging Wrong',
          ));
        }));
  }

  @override
  Widget buildSuggestions(BuildContext context) {
    return Container();
  }
}
