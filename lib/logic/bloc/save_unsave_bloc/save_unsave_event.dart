part of 'save_unsave_bloc.dart';

sealed class SaveUnsaveEvent extends Equatable {
  const SaveUnsaveEvent();

  @override
  List<Object> get props => [];
}
class LoadCity extends SaveUnsaveEvent {}

class SaveCity extends SaveUnsaveEvent {
  final String city;

  SaveCity({required this.city});

  @override
  List<Object> get props => [city];
}

class UnsaveCity extends SaveUnsaveEvent {
 final String city;

  UnsaveCity({required this.city});

  @override
  List<Object> get props => [city];
}

