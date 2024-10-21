import 'package:flutter/material.dart';
import 'package:weather/screens/Saved/saved_page.dart';
import 'package:weather/screens/home/custom_bottom_bar.dart';
import 'package:weather/screens/setting/setting_page.dart';
import 'package:weather/screens/weather/weather_page.dart';

import '../screens/home/home_page.dart';

class Routes {
  Route? onGenerateRoute(RouteSettings settings) {
    var args = settings.arguments;
    switch (settings.name) {
      case '/':
        return MaterialPageRoute(builder: (_) =>const CustomNavigationBar());
      case '/home':
        return MaterialPageRoute(builder: (_) =>const HomePage());
      case '/saved':
        return MaterialPageRoute(builder: (_) =>const SavedPage());
      case '/setting':
        return MaterialPageRoute(builder: (_) =>const SettingPage());
      case '/weather':
        return MaterialPageRoute(builder: (_) => WeatherPage(city: args as String));
      default:
        return null;
    }
  }
}
