import 'package:flutter/material.dart';
import '../../../../core/colors/colors.dart';

class Section3 extends StatelessWidget {
  const Section3({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SizedBox(
          width: 335,
          child: MaterialButton(
            color: buttoncolorblue,
            onPressed: () {},
            shape:
                RoundedRectangleBorder(borderRadius: BorderRadius.circular(5)),
            child: const Padding(
              padding: EdgeInsets.symmetric(vertical: 10),
              child: Text(
                'SetUp',
                style: TextStyle(
                    color: kwhite, fontSize: 17, fontWeight: FontWeight.bold),
              ),
            ),
          ),
        ),
        SizedBox(
          child: MaterialButton(
            color: buttoncolorwhite,
            onPressed: () {},
            shape:
                RoundedRectangleBorder(borderRadius: BorderRadius.circular(5)),
            child: const Text(
              'See what you can download',
              style: TextStyle(
                  color: kblack, fontSize: 17, fontWeight: FontWeight.bold),
            ),
          ),
        )
      ],
    );
  }
}
