import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:hyll/utils/CustomRouter.dart';

class NavigationService {
  final GlobalKey<NavigatorState> navigatorKey = new GlobalKey<NavigatorState>();

  Future<dynamic> navigatePushNamed(String routeName) {
    return navigatorKey.currentState!.pushNamed(routeName);
  }

  Future<dynamic> navigatePush(String routeName) {
    return navigatorKey.currentState!.push(CustomRouter.getMaterialRoute(routeName));
  }

  goBack() {
    return navigatorKey.currentState!.pop();
  }
}
