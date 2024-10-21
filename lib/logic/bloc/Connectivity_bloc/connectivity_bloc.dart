import 'dart:async';
import 'package:bloc/bloc.dart';
import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:equatable/equatable.dart';

part 'connectivity_event.dart';
part 'connectivity_state.dart';

class ConnectivityBloc extends Bloc<ConnectivityEvent, ConnectivityState> {
  final Connectivity _connectivity;
  StreamSubscription<List<ConnectivityResult>>? _connectivitySubscription;

  ConnectivityBloc(this._connectivity) : super(ConnectivityInitial()) {
    // Check initial connectivity status
    _connectivity.checkConnectivity().then((result) {
      add(UpdateConnectionStatus(
          result.isNotEmpty ? result[0] : ConnectivityResult.none));
    });

    // Subscribe to connectivity changes
    _connectivitySubscription =
        _connectivity.onConnectivityChanged.listen((results) {
      if (results.isNotEmpty) {
        add(UpdateConnectionStatus(results[0])); // Handle the first result
      } else {
        add(UpdateConnectionStatus(ConnectivityResult.none)); // No connectivity
      }
    });

    on<CheckConnection>((event, emit) async {
      final result = await _connectivity.checkConnectivity();
      add(UpdateConnectionStatus(
          result.isNotEmpty ? result[0] : ConnectivityResult.none));
    });

    on<UpdateConnectionStatus>((event, emit) {
      if (event.result == ConnectivityResult.none) {
        emit(ConnectivityDisconnected());
      } else {
        emit(ConnectivityConnected(event.result));
      }
    });
  }

  @override
  Future<void> close() {
    _connectivitySubscription?.cancel();
    return super.close();
  }
}
