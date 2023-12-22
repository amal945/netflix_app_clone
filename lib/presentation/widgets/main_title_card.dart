import 'package:flutter/material.dart';
import 'package:netflix_clone/presentation/widgets/main_card.dart';
import 'package:netflix_clone/presentation/widgets/main_title.dart';
import '../../core/colors/constans.dart';

class MainTitleCard extends StatelessWidget {
  const MainTitleCard({
    super.key,
    required this.titletext,
    required this.movies,
  });

  final String titletext;
  final List movies;

  @override
  Widget build(BuildContext context) {
    return Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
      kheight,
      MainTitle(title: titletext),
      kheight10,
      LimitedBox(
        maxHeight: 200,
        child: ListView(
          scrollDirection: Axis.horizontal,
          children: List.generate(
              movies.length,
              (index) => Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 5),
                    child: MainCard(image: imageBase + movies[index].imagePath),
                  )),
        ),
      ),
    ]);
  }
}
