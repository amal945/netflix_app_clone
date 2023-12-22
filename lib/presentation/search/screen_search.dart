import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:netflix_clone/presentation/search/widgets/search_result.dart';
import '../../controller/popular/popular.dart';
import '../../core/colors/colors.dart';
import '../../core/colors/constans.dart';
import '../../models/popular/popular.dart';
import 'widgets/search_idle.dart';

class ScreenSearch extends StatefulWidget {
  const ScreenSearch({super.key});

  @override
  State<ScreenSearch> createState() => _ScreenSearchState();
}

class _ScreenSearchState extends State<ScreenSearch> {
  final _controller = TextEditingController();
  List<Popular> popular = [];
  bool isTaped = true;
  Future getPopular() async {
    popular = await getAllPopular();
    setState(() {});
  }

  @override
  void initState() {
    getPopular();
    _controller.text = '';
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
          child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            CupertinoSearchTextField(
              backgroundColor: Colors.grey.withOpacity(0.3),
              prefixIcon: const Icon(
                CupertinoIcons.search,
                color: Colors.grey,
              ),
              suffixIcon: const Icon(
                CupertinoIcons.xmark_circle_fill,
                color: Colors.grey,
              ),
              style: const TextStyle(color: kwhite),
              onChanged: (value) {
                setState(() {
                  value.isEmpty ? isTaped = true : isTaped = false;
                });
              },
            ),
            kheight,
            _isEmpty(_controller.text),
          ],
        ),
      )),
    );
  }

  Widget _isEmpty(String value) {
    return isTaped
        ? Expanded(child: ScreenIdleWidget(popular: popular))
        : const Expanded(child: SearchResult());
  }
}
