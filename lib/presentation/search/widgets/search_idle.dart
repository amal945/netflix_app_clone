import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:netflix_clone/presentation/search/widgets/title.dart';
import 'package:netflix_clone/presentation/search/widgets/top_searches.dart';
import '../../../core/colors/constans.dart';
import '../../../models/popular/popular.dart';

const imageURL =
    'https://www.themoviedb.org/t/p/w500_and_h282_face/2bpJtl7GzjeceQJz6YnfMLOhlIU.jpg';

// ignore: must_be_immutable
class ScreenIdleWidget extends StatelessWidget {
  ScreenIdleWidget({super.key, required this.popular});

  List<Popular> popular;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const SearchTextTitle(
          title: 'Top Searches',
        ),
        kheight,
        Expanded(
          child: ListView.separated(
              shrinkWrap: true,
              itemBuilder: (ctx, index) => TopSearchIthemTile(
                  url: popular[index].imagePath,
                  movieName: popular[index].title),
              separatorBuilder: (ctx, index) => kheight,
              itemCount: popular.length),
        )
      ],
    );
  }
}
