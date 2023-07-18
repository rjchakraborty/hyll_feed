import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:get/get.dart';
import 'package:hyll/controller/general_controller.dart';
import 'package:hyll/modules/home/provider/home_controller.dart';
import 'package:hyll/theme_manager/adaptive_theme/adaptive_theme.dart';
import 'package:hyll/utils/HexColor.dart';
import 'package:hyll/utils/app_constants.dart';

class Home extends StatefulWidget {
  static const String routeName = "/home";

  Home({Key? key}) : super(key: key);

  @override
  HomeState createState() => HomeState();
}

class HomeState extends State<Home> {
  @override
  void initState() {
    super.initState();
    SchedulerBinding.instance.addPostFrameCallback((timeStamp) async {
      if(mounted){
        GeneralController.to.loadedUrls.add(adventures_login_api);
        await HomeController.to.callHomeAPI();
      }
    });

  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
          alignment: Alignment.center,
          color: AdaptiveTheme.getCurrentMainColor(),
          child: Obx(() => HomeController.to.sliderList.isNotEmpty
              ? HomeController.to.getListView()
              : GeneralController.to.isConnected.value
                  ? GeneralController.to.loadedUrls.contains(adventures_login_api)
                      ? HomeController.to.getShimmerView()
                      : HomeController.to.getNoContentDisplay()
                  : HomeController.to.getNoContentDisplay())),
    );
  }
}
