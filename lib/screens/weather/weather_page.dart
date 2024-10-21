import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:weather/screens/weather/weather_full_info.dart';

import '../../logic/bloc/Connectivity_bloc/connectivity_bloc.dart';

class WeatherPage extends StatelessWidget {
  final String city;
  const WeatherPage({
    super.key,
    required this.city,
  });


  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ConnectivityBloc, ConnectivityState>(
      builder: (context, connectivity) {
        if (connectivity is ConnectivityInitial) {
          return const Center(child: Text('Checking connectivity...'));
        } else if (connectivity is ConnectivityConnected) {
          return  WeatherFullInfo(city: city, hasInternet: true);
        } else if (connectivity is ConnectivityDisconnected) {
          return WeatherFullInfo(city: city, hasInternet: false);
        }
        return const Center(child: Text('Unknown State'));
      },
    );
  }
}

