import 'package:flutter/material.dart';
import 'package:netflix_clone/presentation/downloads/widgets/widgets/image_widget.dart';
import '../../../../controller/top_rated/top_rated_services.dart';
import '../../../../core/colors/colors.dart';
import '../../../../core/colors/constans.dart';
import '../../../../models/top_rated/top_rated.dart';

class Section2 extends StatefulWidget {
  const Section2({super.key});

  @override
  State<Section2> createState() => _Section2State();
}

class _Section2State extends State<Section2> {
  List<TopRated> downloadImages = [];
  Future getAllMovies() async {
    downloadImages = await getTopRatedMovies();
    setState(() {});
  }

  final List imageList = [
    'https://www.themoviedb.org/t/p/w300_and_h450_bestv2/rpzFxv78UvYG5yQba2soO5mMl4T.jpg',
    'https://www.themoviedb.org/t/p/w220_and_h330_face/A4LTXT8MMZIr4aIwhE4qbGFivBo.jpg',
    'https://www.themoviedb.org/t/p/w600_and_h900_bestv2/qVKirUdmoex8SdfUk8WDDWwrcCh.jpg',
  ];

  @override
  void initState() {
    getAllMovies();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.of(context).size;

    return Column(
      children: [
        const Text(
          'Introducing Downloads for you',
          textAlign: TextAlign.center,
          style: TextStyle(
              color: kwhite, fontSize: 23, fontWeight: FontWeight.bold),
        ),
        kheight,
        const Text(
          'We will download a personalised selection of\n movies and shows for you so there is always something to watch on your\n device ',
          textAlign: TextAlign.center,
          style: TextStyle(
            fontSize: 15,
            color: Colors.grey,
          ),
        ),
        SizedBox(
          width: size.width,
          height: size.width,
          child: Stack(alignment: Alignment.center, children: [
            CircleAvatar(
              backgroundColor: Colors.grey.withOpacity(0.5),
              radius: size.width * 0.38,
            ),
            DownloadsImageWidget(
              imageList: imageList[0],
              margin: const EdgeInsets.only(left: 150, bottom: 40),
              angle: 20,
              size: Size(size.width * 0.40, size.width * 0.51),
            ),
            DownloadsImageWidget(
                imageList: imageList[2],
                margin: const EdgeInsets.only(right: 150, bottom: 40),
                angle: -20,
                size: Size(size.width * 0.40, size.width * 0.51)),
            DownloadsImageWidget(
              imageList: imageList[1],
              margin: const EdgeInsets.only(
                left: 0,
              ),
              size: Size(size.width * 0.43, size.width * 0.59),
              radius: 10,
            )
          ]),
        ),
      ],
    );
  }
}
