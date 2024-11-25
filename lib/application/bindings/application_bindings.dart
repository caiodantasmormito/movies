import 'package:get/get.dart';
import 'package:movies/application/auth/auth_service.dart';
import 'package:movies/application/rest_client/rest_client.dart';
import 'package:movies/repositories/login/login_repository.dart';
import 'package:movies/repositories/login/login_repository_imp.dart';
import 'package:movies/repositories/movies/movies_repository.dart';
import 'package:movies/repositories/movies/movies_repository_impl.dart';
import 'package:movies/services/login/login_service.dart';
import 'package:movies/services/login/login_service_imp.dart';
import 'package:movies/services/movies/movies_service.impl.dart';

import '../../services/movies/movies_service.dart';

class ApplicationBindings implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => RestClient(), fenix: true);
    Get.lazyPut<LoginRepository>(
      () => LoginRepositoryImpl(),
      fenix: true,
    );
    Get.lazyPut<LoginService>(
        () => LoginServiceImpl(loginRepository: Get.find()),
        fenix: true);
    Get.put(AuthService()).init();
    Get.lazyPut<MoviesRepository>(
        () => MoviesRepositoryImpl(restClient: Get.find()),
        fenix: true);
    Get.lazyPut<MoviesService>(
        () => MoviesServiceImpl(moviesRepository: Get.find()),
        fenix: true);
  }
}
