import 'package:bordered_text/bordered_text.dart';
import 'package:flutter/material.dart';
import '../../../core/colors/colors.dart';
import '../../../core/colors/constans.dart';

class NumberCard extends StatelessWidget {
  const NumberCard({super.key, required this.index, required this.image});

  final int index;
  final String image;

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Row(
          children: [
            const SizedBox(
              width: 40,
              height: 150,
            ),
            Container(
              width: 116,
              height: 260,
              decoration: BoxDecoration(
                  borderRadius: kRadius10,
                  image: DecorationImage(
                      image: NetworkImage(imageBase + image),
                      fit: BoxFit.cover)),
            ),
          ],
        ),
        Positioned(
            left: 10,
            bottom: 0,
            top: 80,
            child: BorderedText(
                strokeWidth: 5.0,
                strokeColor: Colors.white,
                child: Text(
                  "${index + 1}",
                  style: const TextStyle(
                      fontSize: 110,
                      fontWeight: FontWeight.bold,
                      fontFamily: 'YourDesiredFont',
                      decoration: TextDecoration.none,
                      color: kblack),
                )))
      ],
    );
  }
}
