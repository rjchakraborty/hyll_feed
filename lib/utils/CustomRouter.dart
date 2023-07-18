import 'package:flutter/material.dart';
import 'package:hyll/modules/splash/splashscreen.dart';
import 'package:hyll/utils/common_utils.dart';

class CustomRouter {
  static getRoutes() {
    return <String, WidgetBuilder>{
      SplashScreen.routeName: (_) => SplashScreen(),
    };
  }

  static Route<dynamic> generateRoute(RouteSettings settings) {
    return getMaterialRoute(settings.name);
  }

  static MaterialPageRoute<dynamic> getMaterialRoute(String? routeName) {
    if (CommonUtils.checkIfNotNull(routeName)) {
      switch (routeName) {
        case SplashScreen.routeName:
          return MaterialPageRoute(builder: (_) => SplashScreen());
        default:
          return MaterialPageRoute(
              builder: (_) => Scaffold(
                    body: Center(child: Text('No route defined for ${routeName}')),
                  ));
      }
    } else {
      return MaterialPageRoute(
          builder: (_) => Scaffold(
                body: Center(child: Text('No route defined for ${routeName}')),
              ));
    }
  }
}
