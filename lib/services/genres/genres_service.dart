

import 'package:movies/models/genres_model.dart';

abstract class GenresService {
  Future<List<GenresModel>> getGenres();
}