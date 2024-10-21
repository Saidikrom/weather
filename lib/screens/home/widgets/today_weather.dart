import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:weather/core/constants/p_m_const.dart';
import 'package:weather/logic/bloc/save_unsave_bloc/save_unsave_bloc.dart';

import '../../../core/constants/font_const.dart';
import '../../../core/constants/radius_const.dart';
import '../../../models/Weather_model.dart';
import '../../../services/boxes/box.dart';

class TodayMainWeather extends StatelessWidget {
  final WeatherModel data;
  final bool hasInternet;
  const TodayMainWeather(
      {super.key, required this.data, required this.hasInternet});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: PMConst.topPM,
      height: 410.h,
      width: MediaQuery.of(context).size.width.w - 50,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(RadiusConst.largeRadius),
        color: Theme.of(context).cardColor,
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Padding(
            padding: PMConst.mediumPM,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                BlocBuilder<SaveUnsaveBloc, SaveUnsaveState>(
                    builder: (context, state) {
                  if (state is SaveUnsaveLoaded) {
                    final isSaved = state.cities.any(
                        (location) => location.city == data.location!.name);
                    return GestureDetector(
                      onTap: () {
                        isSaved
                            ? context.read<SaveUnsaveBloc>().add(UnsaveCity(
                                city: data.location!.name.toString()))
                            : context.read<SaveUnsaveBloc>().add(
                                SaveCity(city: data.location!.name.toString()));
                        // isSaved
                        //     ? weatherBox.add(data)
                        //     : weatherBox.delete(data.location!.name);
                      },
                      child: Center(
                        child: SvgPicture.asset(
                          isSaved
                              ? 'assets/icons/saved_fill_icon.svg'
                              : 'assets/icons/saved_icon.svg',
                          color: Theme.of(context).textTheme.titleLarge!.color!,
                        ),
                      ),
                    );
                  } else {
                    return const Center(child: CircularProgressIndicator());
                  }
                }),
              ],
            ),
          ),
          Text(
            DateFormat('EEE dd.MM.yyyy')
                .format(DateTime.parse(data.location!.localtime!))
                .toString(),
            style: TextStyle(
                color: Theme.of(context).textTheme.titleLarge?.color,
                fontSize: FontConst.regularFont),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Icon(Icons.location_on, color: Theme.of(context).iconTheme.color),
              Text(
                data.location!.name.toString(),
                style: TextStyle(
                    color: Theme.of(context).textTheme.titleLarge?.color,
                    fontSize: FontConst.boldFont),
              ),
            ],
          ),
          hasInternet
              ? Image.network(
                  "https:${data.current!.condition!.icon}",
                  scale: .1,
                  height: 200.h,
                  width: 200.w,
                )
              : Image.memory(
                  imgBox.get(data.location!.name)![0],
                  scale: .1,
                  height: 200.h,
                  width: 200.w,
                ),
          Text(
            "${data.current!.tempC}°C",
            style: TextStyle(
                color: Theme.of(context).textTheme.titleLarge?.color,
                fontSize: FontConst.boldFont),
          ),
          Text(
            "${"update".tr()} ${DateFormat('h:mm a').format(DateTime.parse(data.current!.lastUpdated!))}",
            style: TextStyle(
                color: Theme.of(context).textTheme.titleLarge?.color,
                fontSize: FontConst.regularFont),
          ),
          Text(
            data.current!.condition!.text.toString(),
            style: TextStyle(
                color: Theme.of(context).textTheme.titleLarge?.color,
                fontSize: FontConst.semiBoldFont),
          ),
        ],
      ),
    );
  }
}
