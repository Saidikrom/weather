import 'package:hive/hive.dart';

part 'saved_cities.g.dart';

@HiveType(typeId: 3)
class SavedCities {
  @HiveField(0)
  final String city;

  SavedCities({required this.city});
}
