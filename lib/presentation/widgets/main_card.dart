import 'package:flutter/material.dart';
import '../../core/colors/constans.dart';

// ignore: must_be_immutable
class MainCard extends StatelessWidget {
  MainCard({
    super.key,
    required this.image,
  });

  String imageBase = 'https://image.tmdb.org/t/p/w355_and_h200_multi_faces/';
  String image;

  @override
  Widget build(BuildContext context) {
    image = imageBase + image;
    return Container(
      width: 116,
      height: 250,
      decoration: BoxDecoration(
          borderRadius: kRadius10,
          image: DecorationImage(
              image: NetworkImage(image),
              filterQuality: FilterQuality.high,
              fit: BoxFit.cover)),
    );
  }
}
