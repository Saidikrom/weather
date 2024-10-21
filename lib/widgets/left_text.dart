import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../core/constants/font_const.dart';
import '../core/constants/p_m_const.dart';

class LeftText extends StatelessWidget {
  final String text;
  const LeftText({
    super.key,
    required this.text,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: PMConst.topPM,
      height: 56.h,
      width: MediaQuery.of(context).size.width.w,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: PMConst.mediumPM,
            child: Text(
              text,
              style: TextStyle(
                color: Theme.of(context).textTheme.titleLarge?.color,
                fontSize: FontConst.boldFont,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
