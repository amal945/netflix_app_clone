import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:netflix_clone/controller/now_playing/now_playing.dart';
import 'package:netflix_clone/models/now_playing/now_playing.dart';
import 'package:netflix_clone/presentation/home/widgets/background_card.dart';
import 'package:netflix_clone/presentation/home/widgets/number_title_card.dart';
import '../../controller/popular/popular.dart';
import '../../controller/top_rated/top_rated_services.dart';
import '../../controller/upcoming/upcoming_service.dart';
import '../../core/colors/constans.dart';
import '../../models/popular/popular.dart';
import '../../models/top_rated/top_rated.dart';
import '../../models/upcaming/upcoming.dart';
import '../widgets/main_title_card.dart';

ValueNotifier<bool> scrolNotifier = ValueNotifier(true);

class ScreenHome extends StatefulWidget {
  const ScreenHome({super.key});

  @override
  State<ScreenHome> createState() => _ScreenHomeState();
}

class _ScreenHomeState extends State<ScreenHome> {
  List<TopRated> topRated = [];
  List<Popular> popular = [];
  List<Upcoming> upcoming = [];
  List<NowPlaying> newplaying = [];
  Future getAllMovies() async {
    topRated = await getTopRatedMovies();
    popular = await getAllPopular();
    upcoming = await getAllUpcoming();
    newplaying = await getAllNowPlaying();
    // ignore: avoid_print
    print(upcoming.length);
    setState(() {});
  }

  @override
  void initState() {
    getAllMovies();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: ValueListenableBuilder(
      valueListenable: scrolNotifier,
      builder: (BuildContext context, index, _) {
        return NotificationListener<UserScrollNotification>(
          onNotification: (notification) {
            final ScrollDirection direction = notification.direction;
            if (direction == ScrollDirection.reverse) {
              scrolNotifier.value = false;
            } else {
              scrolNotifier.value = true;
            }
            return true;
          },
          child: Stack(
            children: [
              ListView(
                children: [
                  const Backgroundcard(),
                  MainTitleCard(
                    movies: upcoming,
                    titletext: 'Released in the past year',
                  ),
                  MainTitleCard(
                    movies: popular,
                    titletext: 'Trending Now',
                  ),
                  NumberTitleCard(
                    upcoming: upcoming,
                  ),
                  MainTitleCard(
                    movies: topRated,
                    titletext: 'Tense Dreams',
                  ),
                  MainTitleCard(
                    movies: popular,
                    titletext: 'South Indian Cinema',
                  ),
                ],
              ),
              scrolNotifier.value == true
                  ? AnimatedContainer(
                      duration: const Duration(microseconds: 1000),
                      width: double.infinity,
                      height: 135,
                      color: Colors.black.withOpacity(0.1),
                      child: Padding(
                        padding:
                            const EdgeInsets.only(left: 10, right: 10, top: 30),
                        child: Column(children: [
                          Row(
                            children: [
                              Image.network(
                                netflix,
                                width: 50,
                                height: 50,
                              ),
                              const Spacer(),
                              const Icon(
                                Icons.cast,
                                color: Colors.white,
                                size: 25,
                              ),
                              kwidth,
                            ],
                          ),
                          const Row(
                            children: [
                              SizedBox(
                                height: 27,
                              )
                            ],
                          ),
                          const Row(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: [
                              Text(
                                'TV Shows',
                                style: TextStyle(fontWeight: FontWeight.bold),
                              ),
                              Text(
                                'Movies',
                                style: TextStyle(fontWeight: FontWeight.bold),
                              ),
                              Text(
                                'Categores',
                                style: TextStyle(fontWeight: FontWeight.bold),
                              )
                            ],
                          )
                        ]),
                      ),
                    )
                  : kheight
            ],
          ),
        );
      },
    ));
  }
}
