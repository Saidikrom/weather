import 'dart:typed_data';

import 'package:hive_flutter/hive_flutter.dart';
import 'package:weather/models/saved_cities.dart';

import '../../models/Weather_model.dart';

class HiveService {
  static final HiveService _instance = HiveService._init();
  static HiveService get instance => _instance;
  static Box? weatherBox;
  static Box? imgBox;
  static Box? savedCitiesBox;
  HiveService._init();

  Future<void> init() async {
    await Hive.initFlutter();
    weatherBox = await Hive.openBox('weatherBox');
    imgBox = await Hive.openBox('img');
    savedCitiesBox = await Hive.openBox('savedCities');
  }

  Future<void> saveWeather({required WeatherModel weatherData}) async {
    await weatherBox?.put('weather_data', weatherData);
  }

  Future<WeatherModel?> getWeather() async {
    WeatherModel data = weatherBox?.get('weather_data');
    return data;
  }

  Future<void> deleteWeatherJson() async {
    await weatherBox?.delete('weather_data');
  }

  // Store images
  Future<void> saveCityImages(
      {required String city, required List<Uint8List> images}) async {
    await imgBox?.put(city, images);
  }

  Future<List<Uint8List>?> getCityImages(String city) async {
    final images = imgBox?.get(city);
    return images != null ? List<Uint8List>.from(images) : <Uint8List>[];
  }

  Future<void> deleteCityImages(String city) async {
    await imgBox?.delete(city);
  }

  // saved cities

  Future<Box<SavedCities>> getSavedWeatherBox() async {
    if (!Hive.isAdapterRegistered(SavedCitiesAdapter().typeId)) {
      Hive.registerAdapter(SavedCitiesAdapter());
    }

    return await Hive.openBox<SavedCities>("savedCities");
  }

  Future<void> saveWeatherLocation(SavedCities location) async {
    final box = await getSavedWeatherBox();
    await box.add(location);
  }

  Future<void> unsaveWeatherLocation(SavedCities location) async {
    final box = await getSavedWeatherBox();
    await box.delete(location.city);
  }
}
