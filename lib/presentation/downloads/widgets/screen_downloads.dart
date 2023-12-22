import 'package:flutter/material.dart';
import 'package:netflix_clone/presentation/downloads/widgets/widgets/section_2.dart';
import 'package:netflix_clone/presentation/downloads/widgets/widgets/section_3.dart';
import 'package:netflix_clone/presentation/widgets/app_bar_widget.dart';
import '../../../core/colors/colors.dart';
import '../../../core/colors/constans.dart';

class ScreenDownload extends StatelessWidget {
  ScreenDownload({super.key});

  final _widgetList = [
    const _SmartDownloads(),
    const Section2(),
    const Section3()
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: const PreferredSize(
            preferredSize: Size.fromHeight(50),
            child: Center(
                child: AppBarWidget(
              title: "Downloads",
            ))),
        body: ListView.separated(
            padding: const EdgeInsets.all(10),
            itemBuilder: (ctx, index) => _widgetList[index],
            separatorBuilder: (ctx, index) => const SizedBox(
                  height: 20,
                ),
            itemCount: _widgetList.length));
  }
}

class _SmartDownloads extends StatelessWidget {
  const _SmartDownloads({
    // ignore: unused_element
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return const Row(
      children: [
        Icon(
          Icons.settings,
          color: kwhite,
        ),
        kwidth10,
        Text(
          'Smart Downloads',
          style: TextStyle(fontWeight: FontWeight.bold),
        )
      ],
    );
  }
}
