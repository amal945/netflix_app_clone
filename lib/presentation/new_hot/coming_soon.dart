import 'package:flutter/material.dart';
import 'package:netflix_clone/presentation/home/widgets/custom_button_widget.dart';
import '../../core/colors/colors.dart';
import '../../core/colors/constans.dart';
import '../../models/top_rated/top_rated.dart';

class ComingSoon extends StatelessWidget {
  const ComingSoon({
    super.key,
    required this.topRated,
  });

  final TopRated topRated;

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Expanded(
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 15),
        child: Row(
          children: [
            const SizedBox(
              width: 50,
              height: 435,
              child:
                  Column(mainAxisAlignment: MainAxisAlignment.start, children: [
                Text(
                  'FEB',
                  style: TextStyle(color: Colors.white60),
                ),
                Text(
                  '17',
                  style: TextStyle(fontSize: 40, fontWeight: FontWeight.bold),
                )
              ]),
            ),
            SizedBox(
              width: size.width - 50,
              height: 440,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Stack(
                    children: [
                      SizedBox(
                          width: double.infinity,
                          height: 200,
                          child: Image.network(imageBase + topRated.imagePath,
                              fit: BoxFit.cover)),
                      Positioned(
                          bottom: 10,
                          right: 10,
                          child: CircleAvatar(
                            backgroundColor: Colors.black54,
                            radius: 20,
                            child: IconButton(
                                onPressed: () {},
                                icon: const Icon(
                                  Icons.volume_off,
                                  color: kwhite,
                                  size: 20,
                                )),
                          ))
                    ],
                  ),
                  kheight,
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Flexible(
                        child: Text(
                          topRated.title.toUpperCase(),
                          style: const TextStyle(
                              fontSize: 28,
                              fontWeight: FontWeight.bold,
                              letterSpacing: -3.5),
                        ),
                      ),
                      const Row(
                        children: [
                          CustomButtonWidget(
                            customicon: Icons.notifications,
                            text: 'Remind me',
                            iconSize: 25,
                            textSize: 10,
                          ),
                          kwidth,
                          CustomButtonWidget(
                            customicon: Icons.info_outline,
                            text: 'Info',
                            iconSize: 25,
                            textSize: 9,
                          ),
                          kwidth,
                        ],
                      )
                    ],
                  ),
                  kheight,
                  Text(
                    topRated.title,
                    style: const TextStyle(
                        fontWeight: FontWeight.bold, fontSize: 17),
                  ),
                  Flexible(
                    child: Text(
                      topRated.overview,
                      style: const TextStyle(color: Colors.grey),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
