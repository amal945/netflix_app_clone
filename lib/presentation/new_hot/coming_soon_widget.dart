import 'package:flutter/material.dart';
import 'package:netflix_clone/presentation/new_hot/coming_soon.dart';
import '../../models/top_rated/top_rated.dart';

// ignore: must_be_immutable
class ComingSoonWidget extends StatelessWidget {
   ComingSoonWidget({
    super.key, required this.comingMovies
  });
List<TopRated> comingMovies = [];

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
        itemCount: comingMovies.length,
        itemBuilder: ( context, index) {
          return  ComingSoon(  topRated: comingMovies[index]);
        });
  }
}