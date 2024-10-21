// import 'dart:convert';

// import 'package:weatherapp/logic/services/exceptions/exception.dart';

// import '../../../data/constatnce/url.dart';
// import '../../../data/models/weather.dart';
// import 'package:http/http.dart' as http;

// class WeatherApi {
//   Future<Weather> getWeather(String city) async {
//     final url = Uri.parse(
//         "$baseUrl?q=${city.toLowerCase()}&units=metric&appid=$apiKey");

//     try {
//       final response = await http.get(url);
//       if (response.statusCode >= 400) {
//         throw Exception(response.reasonPhrase);
//       }
//       final jsonResponse = jsonDecode(response.body);
//       if (response == null) {
//         throw WeatherExceptions("Cannot get weather for $city");
//       }

//       final data = jsonResponse as Map<String, dynamic>;
//       final weatherData = data["weather"][0];
//       final mainData = data["main"];

//       final Weather weather = Weather(
//         id: weatherData["id"].toString(),
//         main: weatherData["main"],
//         desc: weatherData["description"],
//         icon: weatherData["icon"],
//         temperature: double.parse(mainData["temp"].toString()),
//         city: city,
//       );
//       return weather;
//     } catch (e) {
//       rethrow;
//     }
//   }
// }
