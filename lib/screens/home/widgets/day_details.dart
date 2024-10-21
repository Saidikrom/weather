import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:weather/main.dart';

import '../../../core/constants/font_const.dart';
import '../../../core/constants/p_m_const.dart';
import '../../../core/constants/radius_const.dart';
import '../../../models/Weather_model.dart';

class DayDetails extends StatelessWidget {
  final WeatherModel data;
  const DayDetails({
    super.key,
    required this.data,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: PMConst.topPM,
      height: 130.h,
      width: MediaQuery.of(context).size.width.w - 50.w,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(RadiusConst.regularRadius),
        color: Theme.of(context).cardColor,
      ),
      child: Padding(
        padding: PMConst.mediumPM,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Column(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "${data.current!.feelslikeC}°C ${"feelslike".tr()}",
                  style: TextStyle(
                      color: Theme.of(context).textTheme.titleLarge?.color,
                      fontSize: FontConst.lightFont),
                ),
                Text(
                  "${data.current!.visKm} KM ${"visKm".tr()}",
                  style: TextStyle(
                      color: Theme.of(context).textTheme.titleLarge?.color,
                      fontSize: FontConst.lightFont),
                ),
                Text(
                  "${data.current!.dewpointC}°C ${"dewpointC".tr()}",
                  style: TextStyle(
                      color: Theme.of(context).textTheme.titleLarge?.color,
                      fontSize: FontConst.lightFont),
                ),
              ],
            ),
            Column(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                Text(
                  "${data.current!.humidity}% ${"humidity".tr()}",
                  style: TextStyle(
                      color: Theme.of(context).textTheme.titleLarge?.color,
                      fontSize: FontConst.lightFont),
                ),
                Text(
                  "${data.current!.windKph} KM/h ${"wind".tr()}",
                  style: TextStyle(
                      color: Theme.of(context).textTheme.titleLarge?.color,
                      fontSize: FontConst.lightFont),
                ),
                Text(
                  "↑ ${data.forecast!.forecastday[0].day!.maxtempC}°C ↓ ${data.forecast!.forecastday[0].day!.mintempC}°C",
                  style: TextStyle(
                      color: Theme.of(context).textTheme.titleLarge?.color,
                      fontSize: FontConst.lightFont),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
