import 'package:flutter/material.dart';
import '../../core/colors/colors.dart';
import '../../core/colors/constans.dart';
import '../../models/upcaming/upcoming.dart';
import '../home/widgets/custom_button_widget.dart';

// ignore: must_be_immutable
class EveryonesWatching extends StatelessWidget {
   EveryonesWatching({
    super.key,
    required this.upcoming,
  });

  Upcoming upcoming;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Column(crossAxisAlignment: CrossAxisAlignment.start,
        children: [
        
          Align(
            alignment: Alignment.topLeft,
            child:Text(
               upcoming.title,
              style:const TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
            ),
          ),
        kheight10,
           Text(
            upcoming.overview,
            style:const TextStyle(color: Colors.grey),
          ),
          kheight,
          Stack(
            children: [
               SizedBox(
                width: double.infinity,
                height: 200,
                child: Image.network(
                  imageBase + upcoming.imagePath,
                  fit: BoxFit.cover,
                ),
              ),
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
         const  Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              Row(
                children: [
                  CustomButtonWidget(
                    customicon: Icons.send,
                    text: 'Share',
                    iconSize: 28,
                    textSize: 11,
                  ),
                  kwidth,
                  CustomButtonWidget(
                    customicon: Icons.add,
                    text: 'My List',
                    iconSize: 30,
                    textSize: 11,
                  ),
                  kwidth,
                  CustomButtonWidget(
                    customicon: Icons.play_arrow,
                    text: 'play',
                    iconSize: 32,
                    textSize:11,
                  ),
                  kwidth10
                ],
              )
            ],
          ),
        ],
      ),
    );
  }
}
