import 'dart:typed_data';

import '../../../models/Weather_model.dart';

abstract class WeatherState {}

class WeatherInitial extends WeatherState {}

class WeatherLoading extends WeatherState {}

class WeatherLoaded extends WeatherState {
  final WeatherModel weather;
  final List<Uint8List>? images;

  WeatherLoaded({required this.weather, this.images});
}

class WeatherError extends WeatherState {
  final String message;

  WeatherError(this.message);
}



