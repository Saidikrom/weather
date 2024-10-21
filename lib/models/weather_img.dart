// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/services.dart';
import 'package:hive/hive.dart';

part 'weather_img.g.dart';

@HiveType(typeId: 2)
class WeatherImg {
  @HiveField(0)
  List<Uint8List> imgUrls;
  WeatherImg({
    required this.imgUrls,
  });
}
