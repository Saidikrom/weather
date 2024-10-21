import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:intl/intl.dart';
import 'package:weather/models/Weather_model.dart';

import '../../../core/constants/font_const.dart';
import '../../../core/constants/p_m_const.dart';
import '../../../core/constants/radius_const.dart';

class HourlyInfo extends StatelessWidget {
  final WeatherModel data;
  final bool hasInternet;
  const HourlyInfo({super.key, required this.data, required this.hasInternet});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 175.h,
      child: ListView.builder(
          scrollDirection: Axis.horizontal,
          itemCount: data.forecast!.forecastday[0].hour.length,
          itemBuilder: (ctx, i) {
            return Padding(
              padding: PMConst.smallPM,
              child: Container(
                height: 175.h,
                width: 150.h,
                decoration: BoxDecoration(
                  borderRadius:
                      BorderRadius.circular(RadiusConst.regularRadius),
                  color: Theme.of(context).cardColor,
                ),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Text(
                      data.forecast!.forecastday[0].hour[i].condition!.text
                          .toString(),
                      style: TextStyle(
                        color: Theme.of(context).textTheme.titleLarge?.color,
                        fontSize: FontConst.lightFont,
                      ),
                    ),
                    Text(
                      DateFormat('h:mm a')
                          .format(DateTime.parse(data
                              .forecast!.forecastday[0].hour[i].time
                              .toString()))
                          .toString(),
                      style: TextStyle(
                        color: Theme.of(context).textTheme.titleLarge?.color,
                        fontSize: FontConst.smallFont,
                      ),
                    ),
                    // hasInternet
                        // ? Image.network(
                        //     "https:${data.forecast!.forecastday[0].hour[i].condition!.icon}",
                        //     scale: .5,
                        //     height: 69.h,
                        //     width: 69.w,
                        //   )
                        // : Image.memory(
                        //     imgBox.get(data.forecast!.forecastday[0].hour[i]
                        //         .condition!.icon!)[i],
                        //     scale: .5,
                        //     height: 69.h,
                        //     width: 69.w,
                        //   ),
                    Text(
                      "${data.forecast!.forecastday[0].hour[i].tempC.toString()} °C",
                      style: TextStyle(
                        color: Theme.of(context).textTheme.titleLarge?.color,
                        fontSize: FontConst.lightFont,
                      ),
                    ),
                  ],
                ),
              ),
            );
          }),
    );
  }
}
