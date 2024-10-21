import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:shimmer/shimmer.dart';
import '../../../core/constants/p_m_const.dart';
import '../../../core/constants/radius_const.dart';
import '../../../widgets/left_text.dart';

class CustomLoading extends StatelessWidget {
  const CustomLoading({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Padding(
          padding: PMConst.mediumPM,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              CustomShimmer(
                width: 250.w,
                height: 56.h,
              ),
              CustomShimmer(
                width: 100.w,
                height: 45.h,
              ),
            ],
          ),
        ),
        Container(
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
                    Shimmer.fromColors(
                      baseColor: Colors.black45,
                      highlightColor: Colors.white24,
                      child: Center(
                        child: SvgPicture.asset(
                          'assets/icons/saved_icon.svg',
                          color: Theme.of(context).textTheme.titleLarge!.color!,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              CustomShimmer(
                width: 100.w,
                height: 10.h,
              ),
              SizedBox(
                height: 10.h,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Shimmer.fromColors(
                    baseColor: Colors.black45,
                    highlightColor: Colors.white24,
                    child: Icon(Icons.location_on,
                        color: Theme.of(context).iconTheme.color),
                  ),
                  CustomShimmer(
                    width: 100.w,
                    height: 25.h,
                  ),
                ],
              ),
              SizedBox(
                width: 200.0,
                height: 200.0,
                child: Shimmer.fromColors(
                  baseColor: Colors.black45,
                  highlightColor: Colors.white24,
                  child: Image.asset("assets/image/cloudy.png"),
                ),
              ),
              CustomShimmer(
                width: 90.w,
                height: 25.h,
              ),
              CustomShimmer(
                width: 120.w,
                height: 10.h,
              ),
              CustomShimmer(
                width: 90.w,
                height: 40.h,
              ),
            ],
          ),
        ),
        LeftText(
          text: "weatherDetails".tr(),
        ),
        Container(
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
                    CustomShimmer(
                      width: 150.w,
                      height: 25.h,
                    ),
                    CustomShimmer(
                      width: 150.w,
                      height: 25.h,
                    ),
                    CustomShimmer(
                      width: 150.w,
                      height: 25.h,
                    ),
                  ],
                ),
                Column(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: [
                    CustomShimmer(
                      width: 150.w,
                      height: 25.h,
                    ),
                    CustomShimmer(
                      width: 150.w,
                      height: 25.h,
                    ),
                    CustomShimmer(
                      width: 150.w,
                      height: 25.h,
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
        LeftText(
          text: "nextDays".tr(),
        ),
        SizedBox(
          height: 175.h,
          child: ListView.builder(
              scrollDirection: Axis.horizontal,
              itemCount: 7,
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
                        CustomShimmer(
                          width: 50.w,
                          height: 15.h,
                        ),
                        CustomShimmer(
                          width: 70.w,
                          height: 10.h,
                        ),
                        SizedBox(
                          width: 69.w,
                          height: 69.h,
                          child: Shimmer.fromColors(
                            baseColor: Colors.black45,
                            highlightColor: Colors.white24,
                            child: Image.asset("assets/image/cloudy.png"),
                          ),
                        ),
                        CustomShimmer(
                          width: 50.w,
                          height: 15.h,
                        ),
                      ],
                    ),
                  ),
                );
              }),
        ),
      ],
    );
  }
}

class CustomShimmer extends StatelessWidget {
  final double width;
  final double height;
  const CustomShimmer({
    super.key,
    required this.width,
    required this.height,
  });

  @override
  Widget build(BuildContext context) {
    return Shimmer.fromColors(
      baseColor: Colors.black45,
      highlightColor: Colors.white24,
      child: Container(
        margin: PMConst.topPM,
        width: width,
        height: height,
        decoration: BoxDecoration(
          color: Colors.black,
          borderRadius: BorderRadius.circular(10),
        ),
      ),
    );
  }
}
