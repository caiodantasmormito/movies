

import 'package:movies/models/movies_model.dart';

import '../../models/movies_detail_model.dart';

abstract class MoviesRepository {
  Future<List<MoviesModel>> getPopularMovies();
  Future<List<MoviesModel>> getTopRated();
  Future<MovieDetailModel?> getDetail(int id);
  Future<void> addOrRemoveFavorite(String userId, MoviesModel movie);
  Future<List<MoviesModel>> getFavoritiesMovies(String userId);
}