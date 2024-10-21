import 'dart:async';
import 'dart:convert';
import 'dart:io';
import 'dart:typed_data';
import 'package:bloc/bloc.dart';
import 'package:weather/models/Weather_model.dart';
import '../../../services/boxes/box.dart';
import '../../repositories/weather_repository.dart';
import 'weather_event.dart';
import 'weather_state.dart';

class WeatherBloc extends Bloc<WeatherEvent, WeatherState> {
  final WeatherRepository weatherRepository;

  WeatherBloc(this.weatherRepository) : super(WeatherInitial()) {
    on<FetchWeather>(onFetchWeather);
    // on<SaveLocation>(onSaveLocation);
    // on<UnsaveLocation>(onUnsaveLocation);
  }

  Future<void> onFetchWeather(
      FetchWeather event, Emitter<WeatherState> emit) async {
    emit(WeatherLoading());
    try {
      final cachedWeather = weatherBox.get(event.city);

      if (cachedWeather != null) {
        final weather = WeatherModel.fromJson(jsonDecode(cachedWeather));
        print("Hive is working");

        emit(WeatherLoaded(weather: weather));
        return;
      }

      final weather = await weatherRepository.fetchWeather(event.city);
      weatherBox.put(event.city, jsonEncode(weather.toJson()));

      final List<String> iconUrls = weather.forecast!.forecastday
          .map((day) => day.day!.condition!.icon!)
          .toList();

      final List<Uint8List> imageBytesList =
          await weatherRepository.fetchImages(iconUrls);

      // final List<String> iconHourUrls = weather.forecast!.forecastday
      //     .expand((day) => day.hour.map((hour) => hour.condition!.icon!))
      //     .toList();

      // final List<Uint8List> imageHourBytesList = await weatherRepository
      //     .fetchImages(iconHourUrls.map((e) => 'https:$e').toList());

      // print("1-${iconHourUrls.length}");
      imgBox.put(event.city, imageBytesList);
      // imgHourBox.put("hourly", imageHourBytesList);

      emit(WeatherLoaded(weather: weather));
    } catch (error) {
      if (error is SocketException) {
        final cachedWeather = weatherBox.get(event.city);
      
        if (cachedWeather != null) {
          emit(WeatherLoaded(weather: cachedWeather));
        } else {
          emit(WeatherError(
              'No internet connection and no cached data available.'));
        }
      } else {
        emit(WeatherError('Failed to load weather data: ${error.toString()}'));
      }
    }
  }
}
