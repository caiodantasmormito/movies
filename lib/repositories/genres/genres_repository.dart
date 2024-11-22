
import 'package:movies/models/genres_model.dart';

abstract class GenresRepository {
  Future<List<GenresModel>> getGenres();

}