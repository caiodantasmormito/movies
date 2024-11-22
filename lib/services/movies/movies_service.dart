import '../../models/movies_detail_model.dart';
import '../../models/movies_model.dart';

abstract class MoviesService {
Future<List<MoviesModel>> getPopularMovies();
Future<List<MoviesModel>> getTopRated();
Future<MovieDetailModel?> getDetail(int id);
  Future<void> addOrRemoveFavorite(String userId, MoviesModel movie);
  Future<List<MoviesModel>> getFavoritiesMovies(String userId);
}