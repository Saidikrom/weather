import 'dart:typed_data';

import 'package:http/http.dart' as http;
import 'package:weather/core/constants/urls_const.dart';
import 'package:weather/models/Weather_model.dart';

class WeatherRepository {
  Future<WeatherModel> fetchWeather(String city) async {
    final url =
        '${UrlsConst.base_url}forecast.json?q=$city&days=7&key=${UrlsConst.apiKey}';
    final response = await http.get(Uri.parse(url));
    if (response.statusCode == 200) {
      return weatherModelFromJson(response.body);
    } else {
      throw Exception('Failed to load weather data');
    }
  }

  Future<List<Uint8List>> fetchImages(List<String> urls) async {
    List<Uint8List> imageList = [];
    for (var url in urls) {
      final fullUrl = 'https:$url';
      final response = await http.get(Uri.parse(fullUrl));
      if (response.statusCode == 200) {
        imageList.add(response.bodyBytes);
      }
    }
    return imageList;
  }
}
