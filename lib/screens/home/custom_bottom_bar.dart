import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:weather/screens/Saved/saved_page.dart';
import 'package:weather/screens/setting/setting_page.dart';
import 'home_page.dart';

class CustomNavigationBar extends StatefulWidget {
  const CustomNavigationBar({super.key});

  @override
  State<CustomNavigationBar> createState() => _CustomNavigationBarState();
}

class _CustomNavigationBarState extends State<CustomNavigationBar> {
  int? index;
  final pages = [
    const HomePage(),
    const SavedPage(),
    const SettingPage(),
  ];
  @override
  void initState() {
    index = 0;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBody: true,
      body: Stack(
        alignment: Alignment.bottomCenter,
        children: [
          index == 0
              ? pages[0]
              : index == 1
                  ? pages[1]
                  : index == 2
                      ? pages[2]
                      : pages[0],
          Container(
            // margin: PMConst.largePMonly,
            height: 65.h,
            width: double.infinity,
            decoration: BoxDecoration(
              color: Theme.of(context).canvasColor,
              borderRadius: BorderRadius.circular(5.r),
              boxShadow: [
                BoxShadow(
                  color: Colors.grey.withOpacity(0.2),
                  spreadRadius: 1.r,
                  blurRadius: 15.r,
                  offset: const Offset(0, 0),
                ),
              ],
            ),
            child: Padding(
              padding: EdgeInsets.symmetric(horizontal: 15.w),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  GestureDetector(
                    onTap: () {
                      setState(() {
                        index = 0;
                      });
                    },
                    child: Container(
                      width: 50.w,
                      decoration: BoxDecoration(
                        color: index == 0
                            ? Theme.of(context).textTheme.titleLarge!.color!
                            : Theme.of(context).cardColor,
                        shape: BoxShape.circle,
                        border: Border.all(
                          color: Theme.of(context).textTheme.titleLarge!.color!,
                          width: index == 0 ? 1.w : 1.w,
                        ),
                      ),
                      child: Center(
                        child: SvgPicture.asset('assets/icons/main_icon.svg',
                            height: 20.h,
                            color: index == 0
                                ? Theme.of(context).cardColor
                                : Theme.of(context)
                                    .textTheme
                                    .titleLarge!
                                    .color!),
                      ),
                    ),
                  ),
                  GestureDetector(
                    onTap: () {
                      setState(() {
                        index = 1;
                      });
                    },
                    child: Container(
                      width: 50.w,
                      decoration: BoxDecoration(
                        color: index == 1
                            ? Theme.of(context).textTheme.titleLarge!.color!
                            : Theme.of(context).canvasColor,
                        shape: BoxShape.circle,
                        border: Border.all(
                          color: Theme.of(context).textTheme.titleLarge!.color!,
                          width: index == 1 ? 0.w : 1.w,
                        ),
                      ),
                      child: Center(
                        child: SvgPicture.asset(
                          'assets/icons/saved_icon.svg',
                          color: index == 1
                              ? Theme.of(context).cardColor
                              : Theme.of(context).textTheme.titleLarge!.color!,
                        ),
                      ),
                    ),
                  ),
                  GestureDetector(
                    onTap: () {
                      setState(() {
                        index = 2;
                      });
                    },
                    child: Container(
                      width: 50.w,
                      decoration: BoxDecoration(
                        color: index == 2
                            ? Theme.of(context).textTheme.titleLarge!.color!
                            : Theme.of(context).canvasColor,
                        shape: BoxShape.circle,
                        border: Border.all(
                          color: Theme.of(context).textTheme.titleLarge!.color!,
                          width: index == 2 ? 0.w : 1.w,
                        ),
                      ),
                      child: Center(
                        child: SvgPicture.asset(
                          'assets/icons/setting_icon.svg',
                          color: index == 2
                              ? Theme.of(context).cardColor
                              : Theme.of(context).textTheme.titleLarge!.color!,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}
