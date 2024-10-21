// ignore_for_file: deprecated_member_use

import 'package:adaptive_theme/adaptive_theme.dart';
import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:weather/core/components/theme_comp.dart';
import 'package:weather/logic/bloc/Connectivity_bloc/connectivity_bloc.dart';
import 'package:weather/logic/bloc/weather_bloc/weather_bloc.dart';
import 'package:weather/models/saved_cities.dart';
import 'package:weather/models/weather_hive.dart';
import 'package:weather/models/weather_img.dart';
import 'package:weather/screens/home/custom_bottom_bar.dart';
import 'logic/bloc/save_unsave_bloc/save_unsave_bloc.dart';
import 'logic/repositories/weather_repository.dart';
import 'routes/routes.dart';
import 'services/boxes/box.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await EasyLocalization.ensureInitialized();
  final savedThemeMode = await AdaptiveTheme.getThemeMode();
  Hive.registerAdapter(WeatherHiveModelAdapter());
  Hive.registerAdapter(WeatherImgAdapter());
  Hive.registerAdapter(SavedCitiesAdapter());
  await Hive.initFlutter();
  weatherBox = await Hive.openBox('weatherBox');
  imgBox = await Hive.openBox('img');
  imgHourBox = await Hive.openBox('imgHour');
  saveCitiesBox = await Hive.openBox('savedCities');
  runApp(
    MultiBlocProvider(
      providers: [
        BlocProvider(create: (context) => WeatherBloc(WeatherRepository())),
        BlocProvider(create: (context) => ConnectivityBloc(Connectivity())),
        
        BlocProvider<SaveUnsaveBloc>(
            create: (context) => SaveUnsaveBloc(saveCitiesBox)..add(LoadCity()))
            
      ],
      child: EasyLocalization(
          supportedLocales: const [Locale('en', 'US'), Locale('ru', 'RU')],
          path: 'assets/translations',
          fallbackLocale: const Locale('en', 'US'),
          child: MyApp(savedThemeMode: savedThemeMode)),
    ),
  );
}

class MyApp extends StatelessWidget {
  final AdaptiveThemeMode? savedThemeMode;

  MyApp({super.key, this.savedThemeMode});
  final Routes _routes = Routes();

  @override
  Widget build(BuildContext context) {
    final queryData = MediaQueryData.fromView(WidgetsBinding.instance.window);
    final height = queryData.size.height;
    final width = queryData.size.width;
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      supportedLocales: context.supportedLocales,
      localizationsDelegates: context.localizationDelegates,
      locale: context.locale,
      home: AdaptiveTheme(
        light: lightTheme,
        dark: darkTheme,
        initial: savedThemeMode ?? AdaptiveThemeMode.light,
        builder: (theme, darkTheme) => MaterialApp(
          title: 'Weather',
          theme: theme,
          onGenerateRoute: _routes.onGenerateRoute,
          debugShowCheckedModeBanner: false,
          initialRoute: '/',
          darkTheme: darkTheme,
          home: ScreenUtilInit(
              designSize: Size(width, height),
              minTextAdapt: true,
              splitScreenMode: true,
              builder: (ctx, context) {
                return const CustomNavigationBar();
              }),
        ),
      ),
    );
  }
}
