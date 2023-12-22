import 'package:flutter/material.dart';
import 'package:netflix_clone/controller/upcoming/upcoming_service.dart';
import 'package:netflix_clone/models/upcaming/upcoming.dart';
import 'package:netflix_clone/presentation/search/widgets/card_result.dart';
import 'package:netflix_clone/presentation/search/widgets/title.dart';
import '../../../core/colors/constans.dart';

const imageUrl =
    'https://www.themoviedb.org/t/p/w600_and_h900_bestv2/qXChf7MFL36BgoLkiB3BzXiwW82.jpg';

class SearchResult extends StatefulWidget {
  const SearchResult({super.key});

  @override
  State<SearchResult> createState() => _SearchResultState();
}

class _SearchResultState extends State<SearchResult> {
  List<Upcoming> popular = [];
  Future getPopular() async {
    popular = await getAllUpcoming();
    setState(() {});
  }

  @override
  void initState() {
    getPopular();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const SearchTextTitle(
          title: 'Movies & TV',
        ),
        kheight,
        Expanded(
            child: GridView.count(
          shrinkWrap: true,
          crossAxisCount: 3,
          mainAxisSpacing: 10,
          crossAxisSpacing: 10,
          childAspectRatio: 2 / 3.1,
          children: List.generate(popular.length, (index) {
            return MainCardResult(url: popular[index].imagePath);
          }),
        ))
      ],
    );
  }
}
