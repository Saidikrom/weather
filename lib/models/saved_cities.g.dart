// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'saved_cities.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class SavedCitiesAdapter extends TypeAdapter<SavedCities> {
  @override
  final int typeId = 3;

  @override
  SavedCities read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return SavedCities(
      city: fields[0] as String,
    );
  }

  @override
  void write(BinaryWriter writer, SavedCities obj) {
    writer
      ..writeByte(1)
      ..writeByte(0)
      ..write(obj.city);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is SavedCitiesAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
