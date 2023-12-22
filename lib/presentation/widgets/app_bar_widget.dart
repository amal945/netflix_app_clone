import 'package:flutter/material.dart';
import '../../core/colors/constans.dart';

class AppBarWidget extends StatelessWidget {
  const AppBarWidget({required this.title, super.key});
  final String title;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const Row(
          children: [
            SizedBox(
              width: 100,
              height: 30,
            )
          ],
        ),
        Row(
          children: [
            kwidth,
            Text(title,
                style:
                    const TextStyle(fontSize: 26, fontWeight: FontWeight.bold)),
            const Spacer(),
            const Icon(
              Icons.cast,
              color: Colors.white,
              size: 25,
            ),
            kwidth,
          ],
        ),
      ],
    );
  }
}
