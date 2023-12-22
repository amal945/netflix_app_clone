import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:netflix_clone/core/colors/colors.dart';
import 'package:video_player/video_player.dart';

class VideoListItem extends StatefulWidget {
  final int index;
  final String videoUrl;
  const VideoListItem({super.key, required this.index, required this.videoUrl});

  @override
  State<VideoListItem> createState() => _VideoListItemState();
}

class _VideoListItemState extends State<VideoListItem> {
  late VideoPlayerController _videoPlayerController;
  bool isVolume = true;
  bool isPlay = true;

  @override
  void initState() {
    super.initState();
    videoController(videoPath: videoPathList[widget.index]);
  }

  void videoController({required String videoPath}) {
    // ignore: deprecated_member_use
    _videoPlayerController = VideoPlayerController.network(videoPath);
    _videoPlayerController.initialize().then((value) {
      setState(() {
        _videoPlayerController.play();
      });
    });
  }

  @override
  void dispose() {
    _videoPlayerController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return PageView(
      onPageChanged: (value) {
        setState(() {
          _videoPlayerController.dispose();
        });
        videoController(videoPath: videoPathList[value]);
      },
      scrollDirection: Axis.vertical,
      children: List.generate(videoPathList.length, (index) {
        return Stack(
          children: [
            SizedBox(
              height: double.infinity,
              width: double.infinity,
              child: _videoPlayerController.value.isInitialized
                  ? AspectRatio(
                      aspectRatio: _videoPlayerController.value.aspectRatio,
                      child: VideoPlayer(_videoPlayerController))
                  : const Center(child: CircularProgressIndicator()),
            ),
            Positioned(
              child: Padding(
                padding: const EdgeInsets.all(10),
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.end,
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    // Left side
                    CircleAvatar(
                      radius: 30,
                      backgroundColor: Colors.black.withOpacity(.8),
                      child: IconButton(
                          onPressed: () {
                            setState(() {
                              isVolume = !isVolume;
                            });
                            if (_videoPlayerController.value.volume == 0.0) {
                              _videoPlayerController.setVolume(1.0);
                            } else {
                              _videoPlayerController.setVolume(0.0);
                            }
                          },
                          icon: isVolume
                              ? const Icon(CupertinoIcons.volume_up)
                              : const Icon(CupertinoIcons.speaker_slash_fill)),
                    ),

                    // Right side
                    Column(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        CircleAvatar(
                          radius: 30,
                          backgroundImage: NetworkImage(imageUrl),
                        ),
                        const VideoActions(
                            icon: Icons.emoji_emotions, title: 'Lol'),
                        const VideoActions(icon: Icons.add, title: 'Add List'),
                        const VideoActions(icon: Icons.share, title: 'Share'),
                        VideoActions(
                            icon: !isPlay
                                ? CupertinoIcons.play_circle
                                : CupertinoIcons.pause_circle,
                            title: !isPlay ? 'Play' : 'Pause',
                            onPress: () {
                              setState(() {
                                isPlay = !isPlay;
                                _videoPlayerController.value.isPlaying
                                    ? _videoPlayerController.pause()
                                    : _videoPlayerController.play();
                              });
                            }),
                      ],
                    ),
                  ],
                ),
              ),
            )
          ],
        );
      }),
    );
  }
}

class VideoActions extends StatelessWidget {
  final IconData icon;
  final String title;
  final Function()? onPress;

  const VideoActions(
      {super.key, required this.icon, required this.title, this.onPress});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 12, horizontal: 12),
      child: Column(
        children: [
          Icon(
            icon,
            size: 30,
            color: kwhite,
          ),
          Text(
            title,
            style: const TextStyle(
                color: kwhite, fontWeight: FontWeight.bold, fontSize: 12),
          )
        ],
      ),
    );
  }
}

List<String> videoPathList = [
  'https://commondatastorage.googleapis.com/gtv-videos-bucket/sample/BigBuckBunny.mp4',
  "https://commondatastorage.googleapis.com/gtv-videos-bucket/sample/ElephantsDream.mp4",
  "https://commondatastorage.googleapis.com/gtv-videos-bucket/sample/ForBiggerFun.mp4",
  "https://commondatastorage.googleapis.com/gtv-videos-bucket/sample/ForBiggerJoyrides.mp4",
  "https://commondatastorage.googleapis.com/gtv-videos-bucket/sample/ForBiggerMeltdowns.mp4",
  "https://commondatastorage.googleapis.com/gtv-videos-bucket/sample/Sintel.mp4",
  "https://commondatastorage.googleapis.com/gtv-videos-bucket/sample/SubaruOutbackOnStreetAndDirt.mp4",
  "https://commondatastorage.googleapis.com/gtv-videos-bucket/sample/TearsOfSteel.mp4",
  "https://commondatastorage.googleapis.com/gtv-videos-bucket/sample/VolkswagenGTIReview.mp4",
  "https://commondatastorage.googleapis.com/gtv-videos-bucket/sample/WeAreGoingOnBullrun.mp4",
  "https://commondatastorage.googleapis.com/gtv-videos-bucket/sample/WhatCarCanYouGetForAGrand.mp4",
  "https://commondatastorage.googleapis.com/gtv-videos-bucket/sample/ForBiggerEscapes.mp4",
];

String imageUrl =
    'https://www.themoviedb.org/t/p/w600_and_h900_bestv2/yNySAgpAnWmPpYinim9E0tUzJWG.jpg';

void main() {
  runApp(MaterialApp(
    home: Scaffold(
      body: VideoListItem(index: 0, videoUrl: videoPathList[0]),
    ),
  ));
}
