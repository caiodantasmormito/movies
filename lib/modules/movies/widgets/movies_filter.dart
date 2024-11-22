

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:movies/modules/movies/widgets/filter_tag.dart';

import 'movies_controller.dart';

class MoviesFilter extends GetView<MoviesController> {
  const MoviesFilter({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 12),
      child: SingleChildScrollView(
          scrollDirection: Axis.horizontal,
          child: Obx(() {
            return Row(
                children: controller.genres
                    .map(
                      (g) =>  FilterTag(
                        model: g,
                        onPressed: () => controller.filterMoviesByGenre(g),
                        selected: controller.genreSelected.value?.id == g.id,
                      ),
                    )
                    .toList());
          })),
    );
  }
}
