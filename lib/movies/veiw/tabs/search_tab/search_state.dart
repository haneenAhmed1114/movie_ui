import 'package:movie_app/movies/model_view/movies_model.dart';

abstract class SearchState{}

class SearhInitState extends SearchState{}

class SearchLoading extends SearchState {}

class SearchSuccess extends SearchState {
  final List<Results>? results;

  SearchSuccess({this.results});
}

class SearchError extends SearchState {
  final String? error;

  SearchError({this.error});
}