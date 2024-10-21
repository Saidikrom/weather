import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:weather/screens/home/widgets/main_page_widget.dart';
import '../../logic/bloc/Connectivity_bloc/connectivity_bloc.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: BlocBuilder<ConnectivityBloc, ConnectivityState>(
          builder: (context, connectivity) {
            if (connectivity is ConnectivityInitial) {
              return const Center(child: Text('Checking connectivity...'));
            } else if (connectivity is ConnectivityConnected) {
              return const MainPageWidget(hasInternet: true);
            } else if (connectivity is ConnectivityDisconnected) {
              return const MainPageWidget(
                hasInternet: false,
              );
            }
            return const Center(child: Text('Unknown State'));
          },
        ),
      ),
    );
  }
}
