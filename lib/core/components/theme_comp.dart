import 'package:flutter/material.dart';
import 'package:weather/core/constants/color_const.dart';

ThemeData lightTheme = ThemeData.light().copyWith(
  primaryColor: Colors.blue,
  textTheme: TextTheme(
    titleLarge: TextStyle(color: ColorConst.textColorLight),
  ),
  cardColor: ColorConst.primaryColor,
  iconTheme: IconThemeData(
    color: ColorConst.textColorLight,
  ),
  scaffoldBackgroundColor: ColorConst.backgroundColorLight,
);

ThemeData darkTheme = ThemeData.dark().copyWith(
  primaryColor: Colors.purple,
  cardColor: ColorConst.primaryColorDark,
  scaffoldBackgroundColor: ColorConst.backgroundColorDark,
  textTheme: TextTheme(
    titleLarge: TextStyle(color: ColorConst.primaryColor),
  ),
);
