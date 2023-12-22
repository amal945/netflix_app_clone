import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:netflix_clone/Api_key/key_file.dart';
import 'package:netflix_clone/models/popular/popular.dart';
String getUrl =
    'https://api.themoviedb.org/3/movie/now_playing?api_key=${ApiKey.apikey}';

Future<List<Popular>> getAllPopular() async {
  final _response = await http.get(Uri.parse(getUrl));
  final _bodyAsJson = jsonDecode(_response.body) as Map<String, dynamic>;
  final _data = PopularList.fromJson(_bodyAsJson['results']);
  print(_data.popularList[0].overview);
  return _data.popularList;
}