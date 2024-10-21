part of 'save_unsave_bloc.dart';

sealed class SaveUnsaveState extends Equatable {
  const SaveUnsaveState();
  
  @override
  List<Object> get props => [];
}

final class SaveUnsaveInitial extends SaveUnsaveState {}

class SaveUnsaveLoaded extends SaveUnsaveState {
  final List<SavedCities> cities;

  const SaveUnsaveLoaded(this.cities);

  @override
  List<Object> get props => [cities];
}
