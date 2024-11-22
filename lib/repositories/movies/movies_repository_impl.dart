import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_remote_config/firebase_remote_config.dart';
import 'package:movies/application/rest_client/rest_client.dart';
import 'package:movies/models/movies_model.dart';

import '../../models/movies_detail_model.dart';
import 'movies_repository.dart';

class MoviesRepositoryImpl implements MoviesRepository {
  final RestClient _restClient;

  MoviesRepositoryImpl({
    required RestClient restClient,
  }) : _restClient = restClient;

  @override
  Future<List<MoviesModel>> getPopularMovies() async {
    final result = await _restClient.get<List<MoviesModel>>(
      '/movie/now_playing?language=en-US&page=1',
      headers: {
        'Authorization':
            'Bearer ${TokenDB().token}'
      },
      query: {
        'api_key': FirebaseRemoteConfig.instance.getString('api_token'),
        'language': 'pt-br',
      },
      decoder: (data) {
        final results = data['results'];
        if (results != null) {
          return results
              .map<MoviesModel>((v) => MoviesModel.fromMap(v))
              .toList();
        }

        return <MoviesModel>[];
      },
    );

    if (result.hasError) {
      print('Erro ao buscar popular movies [${result.statusText}]');
      throw Exception('Erro ao buscar filmes popular');
    }
    return result.body ?? <MoviesModel>[];
  }

  @override
  Future<List<MoviesModel>> getTopRated() async {
    final result = await _restClient.get<List<MoviesModel>>(
      '/movie/top_rated',
      headers: {
        'Authorization':
            'Bearer ${TokenDB().token}'
      },
      query: {
        'api_key': FirebaseRemoteConfig.instance.getString('api_token'),
        'language': 'pt-br',
        'page': '1'
      },
      decoder: (data) {
        final results = data['results'];
        if (results != null) {
          return results
              .map<MoviesModel>((v) => MoviesModel.fromMap(v))
              .toList();
        }

        return <MoviesModel>[];
      },
    );

    if (result.hasError) {
      print('Erro ao buscar popular movies [${result.statusText}]');
      throw Exception('Erro ao buscar filmes popular');
    }
    return result.body ?? <MoviesModel>[];
  }

  @override
  Future<MovieDetailModel?> getDetail(int id) async {
    final result =
        await _restClient.get<MovieDetailModel?>('/movie/$id', headers: {
      'Authorization':
          'Bearer ${TokenDB().token}'
    }, query: {
      'api_key': FirebaseRemoteConfig.instance.getString('api_token'),
      'language': 'pt-br',
      'append_to_response': 'images,credits',
      'include_image_language': 'en,pt-br'
    }, decoder: (data) {
      return MovieDetailModel.fromMap(data);
    });

    if (result.hasError) {
      print('Erro ao buscar detalhes do filme [${result.statusText}]');
      throw Exception('Erro ao buscar detalhes do filme');
    }

    return result.body;
  }

  @override
  Future<void> addOrRemoveFavorite(String userId, MoviesModel movie) async {
    try {
      var favoriteCollection = FirebaseFirestore.instance
          .collection('favorities')
          .doc(userId)
          .collection('movies');

      if (movie.favorite) {
        favoriteCollection.add(movie.toMap());
      } else {
        var favoriteData = await favoriteCollection
            .where('id', isEqualTo: movie.id)
            .limit(1)
            .get();
        favoriteData.docs.first.reference.delete();
      }
    } catch (e) {
      print('Erro ao favoritar um filme');
      rethrow;
    }
  }

  @override
  Future<List<MoviesModel>> getFavoritiesMovies(String userId) async {
    var favoritesMovies = await FirebaseFirestore.instance
        .collection('favorities')
        .doc(userId)
        .collection('movies')
        .get();
    final listFavorites = <MoviesModel>[];
    for (var movie in favoritesMovies.docs) {
      listFavorites.add(MoviesModel.fromMap(movie.data()));
    }
    return listFavorites;
  }
}
