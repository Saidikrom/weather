import 'dart:async';

import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:weather/screens/home/widgets/next_days.dart';
import 'package:weather/widgets/left_text.dart';

import '../../../core/constants/p_m_const.dart';
import '../../../logic/bloc/weather_bloc/weather_bloc.dart';
import '../../../logic/bloc/weather_bloc/weather_event.dart';
import '../../../logic/bloc/weather_bloc/weather_state.dart';
import '../../../services/boxes/box.dart';
import '../../../widgets/custom_button.dart';
import 'custom_loading.dart';
import 'day_details.dart';
import 'search_city.dart';
import 'today_weather.dart';

class MainPageWidget extends StatefulWidget {
  final bool hasInternet;
  const MainPageWidget({
    super.key,
    required this.hasInternet,
  });

  @override
  State<MainPageWidget> createState() => _MainPageWidgetState();
}

class _MainPageWidgetState extends State<MainPageWidget> {
  TextEditingController searchController = TextEditingController();
  Timer? timer;
  @override
  void initState() {
    super.initState();
    onRefresh();
    timer = Timer.periodic(const Duration(minutes: 30), (Timer t) {
      onRefresh();
    });
  }

  Future onRefresh() async {
    if (searchController.text.isEmpty) {
      if (widget.hasInternet) {
        // weatherBox.delete("Tashkent");
        // imgBox.delete("Tashkent");
      }
      context.read<WeatherBloc>().add(FetchWeather("Tashkent"));
    } else {
      if (widget.hasInternet) {
        // weatherBox.delete(searchController.text);
        // imgBox.delete(searchController.text);
      }
      context.read<WeatherBloc>().add(FetchWeather(searchController.text));
    }
  }

  @override
  void dispose() {
    timer!.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return RefreshIndicator(
      onRefresh: onRefresh,
      child: SingleChildScrollView(
        child: BlocBuilder<WeatherBloc, WeatherState>(
          builder: (context, state) {
            if (state is WeatherInitial) {
              return const CustomLoading();
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
                          decoration: const BoxDecoration(color: Colors.red),
                          child: Center(
                            child: Text(
                              "noInternet".tr(),
                              style: const TextStyle(color: Colors.white),
                            ),
                          ),
                        ),
                  widget.hasInternet
                      ? Padding(
                          padding: PMConst.mediumPM,
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Container(
                                margin:
                                    EdgeInsets.only(top: 15.h, bottom: 15.h),
                                width: 250.w,
                                height: 56.h,
                                child: Center(
                                  child: SearchCity(
                                      searchController: searchController),
                                ),
                              ),
                              CustomButton(
                                onTapFunction: onRefresh,
                                text: "search".tr(),
                              )
                            ],
                          ),
                        )
                      : const SizedBox(),
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
                  Padding(
                    padding: PMConst.topPM,
                    child: CustomButton(
                        onTapFunction: () => Navigator.pushNamed(
                            context, '/weather',
                            arguments: state.weather.location!.name),
                        text: "More"),
                  ),
                  LeftText(
                    text: "nextDays".tr(),
                  ),
                  NextDays(
                      data: state.weather, hasInternet: widget.hasInternet),
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
    );
  }
}
