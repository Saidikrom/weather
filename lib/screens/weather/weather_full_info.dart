import 'dart:async';

import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'package:weather/screens/home/widgets/today_weather.dart';
import 'package:weather/screens/weather/widgets/hourly_info.dart';
import 'package:weather/services/boxes/box.dart';
import '../../logic/bloc/weather_bloc/weather_bloc.dart';
import '../../logic/bloc/weather_bloc/weather_event.dart';
import '../../logic/bloc/weather_bloc/weather_state.dart';
import '../../widgets/left_text.dart';
import '../home/widgets/custom_loading.dart';
import '../home/widgets/day_details.dart';
import '../home/widgets/next_days.dart';

class WeatherFullInfo extends StatefulWidget {
  final String city;
  final bool hasInternet;
  const WeatherFullInfo({
    super.key,
    required this.city,
    required this.hasInternet,
  });

  @override
  State<WeatherFullInfo> createState() => _WeatherFullInfoState();
}

class _WeatherFullInfoState extends State<WeatherFullInfo> {
  Timer? timer;
  @override
  void initState() {
    super.initState();
    onRefresh();
    timer = Timer.periodic(const Duration(minutes: 30), (Timer t) {
      onRefresh();
      weatherBox.clear();
      imgBox.clear();
    });
  }

  Future onRefresh() async {
    context.read<WeatherBloc>().add(FetchWeather(widget.city));
  }

  @override
  void dispose() {
    timer!.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text(
          widget.city,
          style:
              TextStyle(color: Theme.of(context).textTheme.titleLarge!.color),
        ),
      ),
      body: SafeArea(
        child: RefreshIndicator(
          onRefresh: onRefresh,
          child: SingleChildScrollView(
            child: BlocBuilder<WeatherBloc, WeatherState>(
              builder: (context, state) {
                if (state is WeatherInitial) {
                  return CustomLoading();
                } else if (state is WeatherLoading) {
                  return const CustomLoading();
                } else if (state is WeatherLoaded) {
                  return Column(
                    children: [
                      widget.hasInternet
                          ? const SizedBox()
                          : Container(
                              height: 50.h,
                              width: MediaQuery.of(context).size.width,
                              decoration:
                                  const BoxDecoration(color: Colors.red),
                              child: Center(
                                child: Text(
                                  "noInternet".tr(),
                                  style: const TextStyle(color: Colors.white),
                                ),
                              ),
                            ),
                      TodayMainWeather(
                        data: state.weather,
                        hasInternet: widget.hasInternet,
                      ),
                      // CustomLoading(),
                      LeftText(
                        text: "weatherDetails".tr(),
                      ),
                      DayDetails(
                        data: state.weather,
                      ),
                      LeftText(
                        text: "hourlyInfo".tr(),
                      ),
                      HourlyInfo(
                          data: state.weather, hasInternet: widget.hasInternet),
                      LeftText(
                        text: "nextDays".tr(),
                      ),
                      NextDays(
                        data: state.weather,
                        hasInternet: widget.hasInternet,
                      ),
                      SizedBox(
                        height: 100.h,
                      )
                    ],
                  );
                } else if (state is WeatherError) {
                  print(state.message);
                  return Center(child: Text("Error: ${state.message}"));
                } else {
                  return const SizedBox();
                }
              },
            ),
          ),
        ),
      ),
    );
  }
}
