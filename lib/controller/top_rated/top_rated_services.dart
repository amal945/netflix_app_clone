import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:netflix_clone/Api_key/key_file.dart';
import 'package:netflix_clone/models/top_rated/top_rated.dart';
String getUrl =
    'https://api.themoviedb.org/3/movie/top_rated?api_key=${ApiKey.apikey}';

Future<List<TopRated>> getTopRatedMovies() async {
  final _response = await http.get(Uri.parse(getUrl));
  final _bodyAsJson = jsonDecode(_response.body) as Map<String, dynamic>;
  final _data = TopRatedList.fromJson(_bodyAsJson['results']);
  print(_data.topRatedList[1].title);
  return _data.topRatedList;
}