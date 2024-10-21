import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:hive_flutter/hive_flutter.dart';

import '../../../models/saved_cities.dart';

part 'save_unsave_event.dart';
part 'save_unsave_state.dart';

class SaveUnsaveBloc extends Bloc<SaveUnsaveEvent, SaveUnsaveState> {
  final Box<SavedCities> saveCities;

  SaveUnsaveBloc(this.saveCities) : super(SaveUnsaveInitial()) {
    // Load initial cities
    on<LoadCity>((event, emit) {
      final location = saveCities.values.toList();
      emit(SaveUnsaveLoaded(location));
    });

    // Save a new city
    on<SaveCity>((event, emit) async {
      final newLocation = SavedCities(city: event.city);
      await saveCities.add(newLocation); // Add city to Hive
      final location = saveCities.values.toList();
      emit(SaveUnsaveLoaded(location)); // Emit updated state
    });

    // Unsave a specific city based on index or key
   on<UnsaveCity>((event, emit) async {
      // Find the saved city by its name and delete it using Hive's key
      final keyToDelete = saveCities.keys.firstWhere(
        (key) => saveCities.get(key)?.city == event.city,
        orElse: () => null,
      );

      if (keyToDelete != null) {
        await saveCities.delete(keyToDelete); // Delete by key
      }

      final location =
          saveCities.values.toList(); // Fetch updated list of cities
      emit(SaveUnsaveLoaded(location)); // Emit updated state
    });
  }
}
