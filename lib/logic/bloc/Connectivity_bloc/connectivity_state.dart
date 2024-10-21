part of 'connectivity_bloc.dart';

abstract class ConnectivityState extends Equatable {
  @override
  List<Object?> get props => [];
}

class ConnectivityInitial extends ConnectivityState {}

class ConnectivityConnected extends ConnectivityState {
  final ConnectivityResult result;

  ConnectivityConnected(this.result);

  @override
  List<Object?> get props => [result];
}

class ConnectivityDisconnected extends ConnectivityState {}
