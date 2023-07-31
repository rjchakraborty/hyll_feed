import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:hyll/presentation/pages/feed/feed_page.dart';
import 'package:hyll/theme_manager/theme_data.dart';
import 'package:hyll/utils/common_utils.dart';

import 'theme_manager/adaptive_theme/adaptive_theme.dart';

final getPreferences = GetStorage();



Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  runApp(AppView());
}

class AppView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return AdaptiveTheme(
      light: kLightTheme,
      dark: kDarkTheme,
      initial: AdaptiveTheme.getThemeMode(),
      builder: (theme, darkTheme) => MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Hyll',
        theme: theme,
        darkTheme: kDarkTheme,
        home: FeedPage(),
      ),
    );
  }
}

