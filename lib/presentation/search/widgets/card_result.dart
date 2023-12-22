import 'package:flutter/material.dart';
import 'package:netflix_clone/core/colors/constans.dart';

class MainCardResult extends StatelessWidget {
  const MainCardResult({super.key, required this.url});

  final String url;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(8),
          image: DecorationImage(
              image: NetworkImage(imageBase + url), fit: BoxFit.cover)),
    );
  }
}
