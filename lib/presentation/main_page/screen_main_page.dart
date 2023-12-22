import 'package:flutter/material.dart';
import 'package:netflix_clone/presentation/downloads/widgets/screen_downloads.dart';
import 'package:netflix_clone/presentation/fast_laugh/screen_fast_and_laugh.dart';
import 'package:netflix_clone/presentation/home/screen_home.dart';
import 'package:netflix_clone/presentation/main_page/widgets/bottom_nav.dart';
import 'package:netflix_clone/presentation/new_hot/screen_new_and_hot.dart';
import 'package:netflix_clone/presentation/search/screen_search.dart';

import '../../core/colors/colors.dart';

class ScreenMainPage extends StatelessWidget {
  ScreenMainPage({super.key});

  final _pages = [
    const ScreenHome(),
    const ScreenNewHot(),
    const ScreenFastLaugh(),
    const ScreenSearch(),
    ScreenDownload()
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: backgroundcolor,
      body: ValueListenableBuilder(
          valueListenable: indexChangeNotifier,
          builder: (context, index, _) {
            return _pages[index];
          }),
      bottomNavigationBar: BottomNavigationWidget(),
    );
  }
}
