import 'package:flutter/material.dart';
import 'package:netflix_clone/presentation/home/widgets/number_card.dart';
import '../../../core/colors/constans.dart';
import '../../../models/upcaming/upcoming.dart';
import '../../widgets/main_title.dart';

// ignore: must_be_immutable
class NumberTitleCard extends StatelessWidget {
  NumberTitleCard({super.key, required this.upcoming});

  List<Upcoming> upcoming;

  @override
  Widget build(BuildContext context) {
    return Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
      kheight,
      const MainTitle(
        title: 'Top 10 TV Shows in india Today',
      ),
      kheight10,
      LimitedBox(
        maxHeight: 200,
        child: ListView(
          scrollDirection: Axis.horizontal,
          children: List.generate(
              10,
              (index) => Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 1),
                    child: NumberCard(
                      index: index,
                      image: upcoming[index].imagePath,
                    ),
                  )),
        ),
      ),
    ]);
  }
}
