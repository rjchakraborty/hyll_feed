import 'package:get/get.dart';
import 'package:hyll/modules/home/home.dart';

class SplashController extends GetxController {
  static SplashController get to => Get.find();

  RxBool initialUriIsHandled = false.obs;
  RxBool isLoggedIn = false.obs;

  startApplication() async {
   Get.offAll(Home());
  }

  /// Handle the initial Uri - the one the app was started with
  ///
  /// **ATTENTION**: `getInitialLink`/`getInitialUri` should be handled
  /// ONLY ONCE in your app's lifetime, since it is not meant to change
  /// throughout your app's life.
  ///
  /// We handle all exceptions, since it is called from initState.
  Future<void> handleInitialUri(Uri? uri) async {
    // In this example app this is an almost useless guard, but it is here to
    // show we are not going to call getInitialUri multiple times, even if this
    // was a widget that will be disposed of (ex. a navigation route change).
    if (uri != null && !SplashController.to.initialUriIsHandled.value) {
      SplashController.to.initialUriIsHandled.value = true;
      startApplication();
    } else {
      startApplication();
    }
  }

}
