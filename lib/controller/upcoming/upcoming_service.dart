import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:netflix_clone/Api_key/key_file.dart';
import 'package:netflix_clone/models/upcaming/upcoming.dart';
const url =
    'https://api.themoviedb.org/3/movie/upcoming?api_key=${ApiKey.apikey}';
Future<List<Upcoming>> getAllUpcoming() async {
  final response = await http.get(Uri.parse(url));
  final bodyAsResponse = jsonDecode(response.body) as Map;
  final result = UpcomingList.fromJson(bodyAsResponse['results']);
  print(result.upcomingList[0].imagePath);
  return result.upcomingList;
}