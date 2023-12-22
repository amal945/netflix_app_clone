import 'package:flutter/material.dart';
import '../../../core/colors/colors.dart';

class CustomButtonWidget extends StatelessWidget {
  final IconData customicon;
  final String text;
  final double iconSize;
  final double textSize;

  const CustomButtonWidget({
    super.key,
    required this.customicon,
    required this.text,
    this.iconSize = 27,
    this.textSize = 13,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Icon(
          customicon,
          color: kwhite,
          size: iconSize,
        ),
        const SizedBox(
          height: 5,
        ),
        Text(
          text,
          style: TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: textSize,
              color: Colors.white70),
        )
      ],
    );
  }
}
