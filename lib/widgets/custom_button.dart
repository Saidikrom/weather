import 'package:flutter/widgets.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../core/constants/radius_const.dart';

class CustomButton extends StatelessWidget {
  const CustomButton({
    super.key,
    required this.onTapFunction,
    required this.text,
  });

  final VoidCallback onTapFunction;
  final String text;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTapFunction,
      child: Container(
        height: 45.h,
        width: 100.w,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(RadiusConst.regularRadius),
          color: const Color(0xff5D60EF),
        ),
        child: Center(
            child: Text(
          text,
        )),
      ),
    );
  }
}
