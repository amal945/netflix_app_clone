import 'package:flutter/material.dart';
import 'package:netflix_clone/presentation/fast_laugh/widgets/video_list_item.dart';

class ScreenFastLaugh extends StatefulWidget {
  const ScreenFastLaugh({super.key});

  @override
  State<ScreenFastLaugh> createState() => _ScreenFastLaughState();
}

class _ScreenFastLaughState extends State<ScreenFastLaugh> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
          child: PageView(
        scrollDirection: Axis.vertical,
        children: List.generate(videoPathList.length, (index) {
          return VideoListItem(index: index, videoUrl: videoPathList[index]);
        }),
      )),
    );
  }
}
