import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:netflix_clone/Api_key/key_file.dart';
import 'package:netflix_clone/models/now_playing/now_playing.dart';
String getUrl =
    'https://api.themoviedb.org/3/movie/now_playing?api_key=${ApiKey.apikey}';

Future<List<NowPlaying>> getAllNowPlaying() async {
  final _response = await http.get(Uri.parse(getUrl));
  final _bodyAsJson = jsonDecode(_response.body) as Map<String, dynamic>;
  final _data = NowplayingList.fromJson(_bodyAsJson['results']);
  print(_data.nowplayingList[0].overview);
  return _data.nowplayingList;
}