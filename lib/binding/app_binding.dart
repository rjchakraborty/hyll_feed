import 'package:get/get.dart';
import 'package:hyll/controller/general_controller.dart';
import 'package:hyll/modules/home/provider/home_controller.dart';
import 'package:hyll/modules/splash/provider/splash_controller.dart';

class AppBinding extends Bindings {
  @override
  Future<void> dependencies() async {
    Get.put<GeneralController>(GeneralController(), permanent: true);
    Get.put<HomeController>(HomeController(), permanent: true);
    Get.put<SplashController>(SplashController(), permanent: false);
  }
}
