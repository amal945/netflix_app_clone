import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import '../../../core/colors/colors.dart';
import '../../../core/colors/constans.dart';

class TopSearchIthemTile extends StatelessWidget {
  const TopSearchIthemTile(
      {super.key, required this.url, required this.movieName});

  final String url;
  final String movieName;

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    return Row(
      children: [
        Container(
          width: screenWidth * 0.35,
          height: 75,
          decoration: BoxDecoration(
              image: DecorationImage(
                  fit: BoxFit.cover, image: NetworkImage(imageBase + url))),
        ),
        kwidth10,
        Expanded(
            child: Text(
          movieName,
          style: TextStyle(fontWeight: FontWeight.bold),
        )),
        const Padding(
          padding: EdgeInsets.all(8.0),
          child: CircleAvatar(
            backgroundColor: kwhite,
            radius: 15,
            child: CircleAvatar(
              backgroundColor: kblack,
              radius: 13,
              child: Icon(
                CupertinoIcons.play_fill,
                color: kwhite,
                size: 15,
              ),
            ),
          ),
        )
      ],
    );
  }
}
