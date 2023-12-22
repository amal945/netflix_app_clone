import 'package:flutter/material.dart ';
import 'package:netflix_clone/presentation/new_hot/everyones_watching.dart';

import '../../models/upcaming/upcoming.dart';

// ignore: must_be_immutable
class EveryonesWatchingWidget extends StatelessWidget {
  EveryonesWatchingWidget({super.key, required this.everyone});

  List<Upcoming> everyone;

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
        itemCount: 30,
        itemBuilder: (BuildContext context, index) {
          return EveryonesWatching(upcoming: everyone[index]);
        });
  }
}
