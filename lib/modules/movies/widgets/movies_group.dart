// ignore_for_file: public_member_api_docs, sort_constructors_first

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:movies/application/ui/widgets/movies_card.dart';
import 'package:movies/modules/movies/widgets/movies_controller.dart';

import '../../../models/movies_model.dart';

class MoviesGroup extends GetView<MoviesController> {
  final String title;
  final List<MoviesModel> movies;
  const MoviesGroup({
    Key? key,
    required this.title,
    required this.movies

  }) : super(key: key); 

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const SizedBox(
            height: 20,
          ),
          Text(
            title,
            style: const TextStyle(
              fontSize: 24,
              fontWeight: FontWeight.bold,
            ),
          ),
          SizedBox(height: 280,
            child: Obx(() { 
                    return ListView.builder(
                          scrollDirection: Axis.horizontal,
                          shrinkWrap: true,
                          itemCount: movies.length,
                          itemBuilder: (context, index) {
                            var movie = movies[index];
                            return  MoviesCard(
                              movie: movies[index], 
                              favoriteCallback: () => controller.favoriteMovie(movie),
                            );
                          },
                        );
                }
              )
          )
        ],
      ),
    );
  }
}
