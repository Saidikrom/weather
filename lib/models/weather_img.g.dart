// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'weather_img.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class WeatherImgAdapter extends TypeAdapter<WeatherImg> {
  @override
  final int typeId = 2;

  @override
  WeatherImg read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return WeatherImg(
      imgUrls: (fields[0] as List).cast<Uint8List>(),
    );
  }

  @override
  void write(BinaryWriter writer, WeatherImg obj) {
    writer
      ..writeByte(1)
      ..writeByte(0)
      ..write(obj.imgUrls);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is WeatherImgAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
