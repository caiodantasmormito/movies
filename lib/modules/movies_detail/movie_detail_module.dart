import 'package:get/get.dart';

import '../../application/modules/module.dart';
import 'movie_detail_bindings.dart';
import 'movie_detail_page.dart';

class MovieDetailModule extends Module {
  @override
  List<GetPage> routers = [
    GetPage(
      name: '/movie/detail',
      page: () => const MovieDetailPage(),
      binding: MovieDetailBindings()
    )
  ];
}