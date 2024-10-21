import 'dart:convert';
import 'package:hive/hive.dart';
import 'package:weather/models/Weather_model.dart';

part 'weather_hive.g.dart';

@HiveType(typeId: 1)
class WeatherHiveModel {
  @HiveField(0)
  String weatherData; // Store WeatherModel as JSON string

  WeatherHiveModel({
    required this.weatherData,
  });

  // Helper to convert from WeatherModel to WeatherHiveModel
  factory WeatherHiveModel.fromWeatherModel(WeatherModel weatherModel) {
    return WeatherHiveModel(weatherData: jsonEncode(weatherModel.toJson()));
  }

  // Helper to convert from WeatherHiveModel back to WeatherModel
  WeatherModel toWeatherModel() {
    return WeatherModel.fromJson(jsonDecode(weatherData));
  }
}
