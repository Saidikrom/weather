part of 'connectivity_bloc.dart';

sealed class ConnectivityEvent extends Equatable {
  const ConnectivityEvent();

  @override
  List<Object?> get props => [];
}

class CheckConnection extends ConnectivityEvent {}

class UpdateConnectionStatus extends ConnectivityEvent {
  final ConnectivityResult result; // Accept a single result

  UpdateConnectionStatus(this.result);

  @override
  List<Object?> get props => [result];
}
