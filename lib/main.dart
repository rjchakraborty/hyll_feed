import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:hyll/binding/app_binding.dart';
import 'package:hyll/modules/splash/splashscreen.dart';
import 'package:hyll/theme_manager/theme_data.dart';
import 'package:hyll/utils/CustomRouter.dart';
import 'package:hyll/utils/HexColor.dart';
import 'package:hyll/utils/app_constants.dart';
import 'package:hyll/utils/common_utils.dart';
import 'package:provider/provider.dart';

import 'theme_manager/adaptive_theme/adaptive_theme.dart';

String initialRoute = SplashScreen.routeName;
final getPreferences = GetStorage();

processInitialRoute(String? pageType) {
  if (CommonUtils.checkIfNotNull(pageType)) {
    switch (pageType) {
      default:
        initialRoute = SplashScreen.routeName;
        break;
    }
  }
}

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
      builder: (theme, darkTheme) => GetMaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Hyll',
        initialBinding: AppBinding(),
        theme: theme,
        darkTheme: kDarkTheme,
        home: SplashScreen(),
      ),
    );
  }
}

