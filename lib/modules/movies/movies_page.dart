


import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:movies/modules/movies/widgets/movies_controller.dart';
import 'package:movies/modules/movies/widgets/movies_group.dart';
import 'widgets/movies_filter.dart';
import 'widgets/movies_header.dart';

class MoviesPage extends GetView<MoviesController> {

  const MoviesPage({ super.key });

   @override
   Widget build(BuildContext context) {
       return SizedBox(width: Get.width,
       child: ListView(children:  [
        const MoviesHeader(),
        const MoviesFilter(),
        MoviesGroup(title: 'Mais Populares', movies: controller.popularMovies),
        MoviesGroup(title: 'Top Filmes', movies: controller.topRatedMovies),

       ]),
       );
  }
}