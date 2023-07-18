

import 'package:get/get.dart';
import 'package:hyll/modules/home/home.dart';

class GeneralController extends GetxController {
  static GeneralController get to => Get.find(); // add this

  RxList<String> loadedUrls = RxList();
  RxBool isConnected = true.obs;


}
