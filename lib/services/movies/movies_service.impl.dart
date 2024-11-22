

import 'package:movies/models/movies_model.dart';
import 'package:movies/repositories/movies/movies_repository.dart';
import 'package:movies/services/movies/movies_service.dart';

import '../../models/movies_detail_model.dart';

class MoviesServiceImpl implements MoviesService {
  final MoviesRepository _moviesRepository;

  MoviesServiceImpl({
    required MoviesRepository moviesRepository,
  }) : _moviesRepository = moviesRepository;

  @override
  Future<List<MoviesModel>> getPopularMovies() =>
      _moviesRepository.getPopularMovies();

  @override
  Future<List<MoviesModel>> getTopRated() => _moviesRepository.getTopRated();

  @override
  Future<MovieDetailModel?> getDetail(int id) =>
      _moviesRepository.getDetail(id);

  @override
  Future<void> addOrRemoveFavorite(String userId, MoviesModel movie) =>
      _moviesRepository.addOrRemoveFavorite(userId, movie);

  @override
  Future<List<MoviesModel>> getFavoritiesMovies(String userId) =>
      _moviesRepository.getFavoritiesMovies(userId);
}
