import 'package:flutter/material.dart';
import 'package:netflix_clone/controller/upcoming/upcoming_service.dart';
import 'package:netflix_clone/models/top_rated/top_rated.dart';
import 'package:netflix_clone/presentation/new_hot/coming_soon_widget.dart';
import 'package:netflix_clone/presentation/new_hot/everyones_watching_widget.dart';
import '../../controller/top_rated/top_rated_services.dart';
import '../../core/colors/colors.dart';
import '../../core/colors/constans.dart';
import '../../models/upcaming/upcoming.dart';

class ScreenNewHot extends StatefulWidget {
  const ScreenNewHot({super.key});

  @override
  State<ScreenNewHot> createState() => _ScreenNewHotState();
}

class _ScreenNewHotState extends State<ScreenNewHot> {
  List<TopRated> comingMovies = [];
  List<Upcoming> everyOne = [];

  Future getAllMovies() async {
    comingMovies = await getTopRatedMovies();
    everyOne = await getAllUpcoming();
    setState(() {});
  }

  @override
  void initState() {
    getAllMovies();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      child: Scaffold(
        appBar: PreferredSize(
            preferredSize: const Size.fromHeight(120),
            child: AppBar(
              backgroundColor: kblack,
              title: const Text('New & Hot',
                  style: TextStyle(fontSize: 26, fontWeight: FontWeight.bold)),
              actions: const [
                Icon(
                  Icons.cast,
                  color: Colors.white,
                  size: 25,
                ),
                kwidth
              ],
              bottom: TabBar(
                labelColor: kblack,
                unselectedLabelColor: kwhite,
                isScrollable: true,
                labelStyle:
                    const TextStyle(fontSize: 15, fontWeight: FontWeight.bold),
                indicator: BoxDecoration(
                  color: kwhite,
                  borderRadius: BorderRadius.circular(40),
                ),
                tabs: const [
                  Tab(
                    text: '🍿Coming Soon',
                  ),
                  Tab(text: "👀 Everyone's Watching"),
                ],
              ),
            )),
        body: TabBarView(children: [
          ComingSoonWidget(comingMovies: comingMovies),
          EveryonesWatchingWidget(everyone: everyOne),
        ]),
      ),
    );
  }
}
