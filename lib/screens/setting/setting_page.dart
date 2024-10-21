import 'package:adaptive_theme/adaptive_theme.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:weather/core/constants/font_const.dart';

class SettingPage extends StatelessWidget {
  const SettingPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text(
          'settings'.tr(),
          style: TextStyle(
            color: Theme.of(context).textTheme.titleLarge!.color,
          ),
        ),
      ),
      body: SafeArea(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                Text(
                  'themeMode'.tr(),
                  style: TextStyle(
                    fontSize: FontConst.mediumFont,
                    color: Theme.of(context).textTheme.titleLarge?.color,
                  ),
                ),
                Switch(
                  value: AdaptiveTheme.of(context).mode.isDark,
                  onChanged: (value) {
                    if (value) {
                      AdaptiveTheme.of(context).setDark();
                    } else {
                      AdaptiveTheme.of(context).setLight();
                    }
                  },
                ),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                Text(
                  'language'.tr(),
                  style: TextStyle(
                    fontSize: FontConst.mediumFont,
                    color: Theme.of(context).textTheme.titleLarge?.color,
                  ),
                ),
                DropdownButton<Locale>(
                  value: context.locale,
                  onChanged: (Locale? locale) {
                    context.setLocale(locale!);
                  },
                  items: [
                    DropdownMenuItem(
                      value: const Locale('en', 'US'),
                      child: Text(
                        'english'.tr(),
                        style: TextStyle(
                            color:
                                Theme.of(context).textTheme.titleLarge!.color),
                      ),
                    ),
                    DropdownMenuItem(
                      value: const Locale('ru', 'RU'),
                      child: Text(
                        'russian'.tr(),
                        style: TextStyle(
                            color:
                                Theme.of(context).textTheme.titleLarge!.color),
                      ),
                    ),
                  ],
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}
