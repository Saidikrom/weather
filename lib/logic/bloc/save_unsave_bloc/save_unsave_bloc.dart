import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:hive_flutter/hive_flutter.dart';

import '../../../models/saved_cities.dart';

part 'save_unsave_event.dart';
part 'save_unsave_state.dart';

class SaveUnsaveBloc extends Bloc<SaveUnsaveEvent, SaveUnsaveState> {
  final Box<SavedCities> saveCities;

  SaveUnsaveBloc(this.saveCities) : super(SaveUnsaveInitial()) {
    on<LoadCity>((event, emit) {
      final location = saveCities.values.toList();
      emit(SaveUnsaveLoaded(location));
    });

    on<SaveCity>((event, emit) async {
      final newLocation = SavedCities(city: event.city);
      await saveCities.add(newLocation); 
      final location = saveCities.values.toList();
      emit(SaveUnsaveLoaded(location)); 
    });

   on<UnsaveCity>((event, emit) async {

      final keyToDelete = saveCities.keys.firstWhere(
        (key) => saveCities.get(key)?.city == event.city,
        orElse: () => null,
      );

      if (keyToDelete != null) {
        await saveCities.delete(keyToDelete);
      }

      final location =
          saveCities.values.toList(); 
      emit(SaveUnsaveLoaded(location));
    });
  }
}
