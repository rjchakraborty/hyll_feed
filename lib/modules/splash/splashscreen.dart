import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hyll/modules/home/home.dart';
import 'package:hyll/modules/splash/provider/splash_controller.dart';
import 'package:hyll/utils/HexColor.dart';
import 'package:hyll/utils/app_constants.dart';
import 'package:uni_links/uni_links.dart';

class SplashScreen extends StatefulWidget {
  static const String routeName = '/splash';

  @override
  State<StatefulWidget> createState() => StartState();
}

class StartState extends State<SplashScreen> {
  handleURI() async {
    final uri = await getInitialUri();
    SplashController.to.handleInitialUri(uri);
  }

  @override
  void initState() {
    handleURI();
    super.initState();
  }

  initScreen(BuildContext context) {
    return Scaffold(
        body: Container(
          width: double.maxFinite,
          height: double.maxFinite,
          child: Image.asset(
            'assets/images/logo.png',
            fit: BoxFit.fitWidth,
            height: double.maxFinite,
            width: double.maxFinite,
            alignment: Alignment.topCenter,
          ),
        ),);
  }

  @override
  Widget build(BuildContext context) {
    return initScreen(context);
  }
}
