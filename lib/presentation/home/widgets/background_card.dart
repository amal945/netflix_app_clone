import 'package:flutter/material.dart';
import 'package:netflix_clone/presentation/home/widgets/custom_button_widget.dart';
import '../../../core/colors/colors.dart';
import '../../../core/colors/constans.dart';

class Backgroundcard extends StatelessWidget {
  const Backgroundcard({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Container(
          width: double.infinity,
          height: 730,
          decoration: const BoxDecoration(
              image: DecorationImage(image: NetworkImage(mainImg))),
        ),
        Positioned(
          bottom: 0,
          left: 0,
          right: 0,
          child: Padding(
            padding: const EdgeInsets.only(bottom: 10),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                const CustomButtonWidget(
                    text: 'My List', customicon: Icons.add),
                _playButton(),
                const CustomButtonWidget(
                    text: 'info', customicon: Icons.info_outline_rounded),
              ],
            ),
          ),
        )
      ],
    );
  }

  TextButton _playButton() {
    return TextButton.icon(
        style: const ButtonStyle(
            backgroundColor: MaterialStatePropertyAll(kwhite)),
        onPressed: () {},
        icon: const Icon(
          Icons.play_arrow,
          color: kblack,
          size: 25,
        ),
        label: const Padding(
          padding: EdgeInsets.only(right: 10),
          child: Text(
            'Play',
            style: TextStyle(color: kblack, fontWeight: FontWeight.bold),
          ),
        ));
  }
}
