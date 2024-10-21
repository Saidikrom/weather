// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'weather_hive.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class WeatherHiveModelAdapter extends TypeAdapter<WeatherHiveModel> {
  @override
  final int typeId = 1;

  @override
  WeatherHiveModel read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return WeatherHiveModel(
      weatherData: fields[0] as String,
    );
  }

  @override
  void write(BinaryWriter writer, WeatherHiveModel obj) {
    writer
      ..writeByte(1)
      ..writeByte(0)
      ..write(obj.weatherData);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is WeatherHiveModelAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
