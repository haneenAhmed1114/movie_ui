import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movie_app/api/api_servcies.dart';
import 'package:movie_app/movies/model_view/movies_model.dart';
import 'package:movie_app/movies/veiw/tabs/search_tab/search_state.dart';

class SearchScreen extends Cubit<SearchState>{
  SearchScreen(SearchState initialState) : super(initialState);

  void searchMovies(String query) async{
    if(query.isEmpty){
      emit(SearhInitState());
      return;
    }
    emit(SearchLoading());
     try{ MoviesModel moviesModel= await ApiServices.getMoviesSearch(query);
    emit(SearchSuccess(results:moviesModel.results ));}
    catch(e){
      emit(SearchError(error: e.toString()));
    }
  } 


  }
