import 'dart:async';
import 'dart:convert';
import 'dart:io';
import 'dart:math';

import 'package:cached_network_image/cached_network_image.dart';
import 'package:connectivity/connectivity.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:get/get.dart';
import 'package:hyll/controller/general_controller.dart';
import 'package:hyll/utils/HexColor.dart';
import 'package:hyll/utils/app_constants.dart';
import 'package:package_info_plus/package_info_plus.dart';
import 'package:path_provider/path_provider.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:uuid/uuid.dart';
import 'package:crypto/crypto.dart';


extension StringCasingExtension on String {
  String toCapitalized() =>
      length > 0 ? '${this[0].toUpperCase()}${substring(1).toLowerCase()}' : '';

  String toTitleCase() => replaceAll(RegExp(' +'), ' ')
      .split(' ')
      .map((str) => str.toCapitalized())
      .join(' ');
}

extension ListExtension on List {
  bool isNotNullOrEmpty() => this.isNotEmpty;

  bool isNullOrEmpty() => this.isEmpty;
}

class VersionCode {
  String code = 'Powered by Ancile';

  VersionCode(this.code);
}

class LocalTimeZone {
  String timezone = 'Australia/Sydney';

  LocalTimeZone(this.timezone);
}

class CommonUtils {
  static const int MIN_IMAGE_HEIGHT = 700;
  static const int MIN_IMAGE_WIDTH = 300;
  static const int IMAGE_QUALITY = 75;

  static Future<bool> checkInternet() async {
    var connectivityResult = await (Connectivity().checkConnectivity());
    GeneralController.to.isConnected.value =
        (connectivityResult == ConnectivityResult.mobile ||
            connectivityResult == ConnectivityResult.wifi);
    return GeneralController.to.isConnected.value;
  }

  static Widget getCircularNetworkImage(String? imageURL, double imageSize) {
    return CircleAvatar(
      radius: (imageSize / 2),
      child: ClipRRect(
        borderRadius: BorderRadius.circular((imageSize / 2)),
        child: CommonUtils.checkIfNotNull(imageURL)
            ? CachedNetworkImage(
                imageUrl: imageURL!,
                imageBuilder: (context, imageProvider) => Container(
                  height: imageSize,
                  width: imageSize,
                  decoration: BoxDecoration(
                      image: DecorationImage(
                        image: imageProvider,
                        fit: BoxFit.fill,
                      ),
                      borderRadius:
                          BorderRadius.all(Radius.circular((imageSize / 2)))),
                ),
                progressIndicatorBuilder: (context, url, progress) => Center(
                  child: CircularProgressIndicator(
                    value: progress.progress,
                  ),
                ),
                errorWidget: (context, url, error) {
                  debugPrint('Error : $error');
                  return Center(
                    child: Image.asset('assets/images/logo.png',
                        height: imageSize),
                  );
                },
              )
            : Container(
                height: imageSize,
                width: imageSize,
                decoration: BoxDecoration(
                    borderRadius:
                        BorderRadius.all(Radius.circular((imageSize / 2)))),
                child: Image.asset("assets/images/logo.png"),
              ),
      ),
    );
  }

  static String getImageName() {
    var uuid = const Uuid();
    return '${uuid.v1()}.png';
  }

  static setDataInTextEditingController(
      TextEditingController? controller, String? value) {
    if (controller != null && checkIfNotNull(value)) {
      controller.text = value!;
    }
  }

  static bool checkIfLatitude(String? value) {
    if (checkIfNotNull(value)) {
      double lat = getDouble(value);
      return lat != 0 && lat >= -90 && lat <= 90;
    }
    return false;
  }

  static bool checkIfLongitude(String? value) {
    if (checkIfNotNull(value)) {
      double lon = getDouble(value);
      return lon != 0 && lon >= -180 && lon <= 180;
    }
    return false;
  }

  static bool isValidEmail(String? email) {
    if (checkIfNotNull(email)) {
      RegExp regExp = RegExp(
        r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+",
        caseSensitive: false,
        multiLine: false,
      );
      if (regExp.hasMatch(email!)) {
        return true;
      } else {
        return false;
      }
    }
    return false;
  }

  /* Number should not starts with 0
  * Regex for Number starts with 0 r"^(?:[+0])?[0-9]{9,12}$"*/
  static bool isValidPhone(String? phone) {
    if (checkIfNotNull(phone)) {
      RegExp regExp = RegExp(
        r"^[1-9]\d{8,12}$",
        caseSensitive: false,
        multiLine: false,
      );
      if (regExp.hasMatch(phone!)) {
        return true;
      } else {
        return false;
      }
    }
    return false;
  }

  static launchURL(Uri? uri) async {
    if (uri != null && CommonUtils.checkIfNotNull(uri.toString())) {
      await launchUrl(uri);
    } else {
      Get.defaultDialog(
        title: SUPPORTED_APP_TITLE,
        middleText: SUPPORTED_APP_BODY,
        textCancel: "OK",
        onCancel: () {},
        backgroundColor: HexColor.getColor(DARK_GREY_COLOR_HEX),
        titleStyle: const TextStyle(
            fontFamily: FONT_REGULAR, fontSize: 16, color: Colors.white),
        middleTextStyle: const TextStyle(
            fontFamily: FONT_REGULAR, fontSize: 15, color: Colors.white),
        buttonColor: HexColor.getColor(PRIMARY_DARK_COLOR_HEX),
        confirmTextColor: Colors.white,
        cancelTextColor: Colors.white,
        titlePadding: EdgeInsets.all(15),
        contentPadding: EdgeInsets.all(15),
      );
    }
  }

  static bool checkIfNotNull(String? value) {
    return value != null &&
        value.trim().isNotEmpty &&
        value.trim() != NULL &&
        value.trim() != "";
  }

  static bool checkIfRxNotNull(RxString? value) {
    return value != null &&
        value.value.trim().isNotEmpty &&
        value.value.trim() != NULL &&
        value.value.trim() != "";
  }

  static String replaceIfNull(String? value) {
    return checkIfNotNull(value) ? value! : '';
  }

  static String replaceWithUnknown(String? value) {
    return checkIfNotNull(value) ? value! : 'Unknown';
  }

  static bool checkIfBlank(String? value) {
    return value != null && value.isNotEmpty && value.trim() != "";
  }

  static String replaceToSmallCase(String? value) {
    if (checkIfNotNull(value)) {
      return value!.toLowerCase().trim();
    }
    return '';
  }

  static int getInt(String? value) {
    if (CommonUtils.checkIfNotNull(value)) {
      try {
        var intVal = int.parse(value!);
        return intVal;
      } catch (Exception) {
        return 0;
      }
    }
    return 0;
  }

  static Color getColorPerStatus(String? status) {
    if (CommonUtils.checkIfNotNull(status)) {
      if (status!.trim().toLowerCase().contains('applied') ||
          status.trim().toLowerCase().contains('new') ||
          status.trim().toLowerCase().contains('interested')) {
        return HexColor.getColor('F4591B');
      } else if (status.trim().toLowerCase().contains('eligible')) {
        return HexColor.getColor('2C4F47');
      } else if (status.trim().toLowerCase().contains('progress')) {
        return HexColor.getColor('CB9E1D');
      } else if (status.trim().toLowerCase().contains('offer') ||
          status.trim().toLowerCase().contains('sent') ||
          status.trim().toLowerCase().contains('completed') ||
          status.trim().toLowerCase().contains('completed')) {
        return HexColor.getColor('A240A9');
      } else if (status.trim().toLowerCase().contains('existing') ||
          status.trim().toLowerCase().contains('fedex') ||
          status.trim().toLowerCase().contains('hire') ||
          status.trim().toLowerCase().contains('hired') ||
          status.trim().toLowerCase().contains('driver')) {
        return HexColor.getColor('8EBB74');
      } else if (status.trim().toLowerCase().contains('drug') ||
          status.trim().toLowerCase().contains('screening')) {
        return HexColor.getColor('F22A2A');
      }
    }
    return HexColor.getColor('CB9E1D');
  }

  static Color getColorPerTest(String? status) {
    if (CommonUtils.checkIfNotNull(status)) {
      if (status!.trim().toLowerCase().contains('drug')) {
        return HexColor.getColor('b9a178');
      } else if (status.trim().toLowerCase().contains('road')) {
        return HexColor.getColor('5bafad');
      } else if (status.trim().toLowerCase().contains('background') ||
          status.trim().toLowerCase().contains('green') ||
          status.trim().toLowerCase().contains('mvr')) {
        return HexColor.getColor('15995A');
      } else if (status.trim().toLowerCase().contains('dot') ||
          status.trim().toLowerCase().contains('training')) {
        return HexColor.getColor('BD8392');
      }
    }
    return HexColor.getColor('EDA4B7');
  }

  static Future<VersionCode> getAppVersion() async {
    PackageInfo packageInfo = await PackageInfo.fromPlatform();
    String versionName = packageInfo.version;
    var code = 'Powered by Ancile v' + versionName;
    return VersionCode(code);
  }

  static Future<int> getWeekStartDay() async {
    /* AppDatabase? database = await CommonUtils.getFloorDatabase();
    UserDao userDao = database.userDao;
    ClientDao clientDao = database.clientDao;

    if (userDao != null && clientDao != null) {
      List<User> userList = await userDao.findAllUser();
      if (userList != null && userList.isNotEmpty) {
        User mUser = userList[0];
        if (mUser != null && CommonUtils.checkIfNotNull(mUser.user_token) && CommonUtils.checkIfNotNull(mUser.login_status)) {
          Client? mClient = await clientDao.findClientById(mUser.client_id!);
          if (mClient != null && mClient.client_start_week != null && mClient.client_start_week! > 0) {
            return mClient.client_start_week! - 1;
          }
        }
      }
    }*/
    return 0;
  }

  static String format(double n) {
    return n.toStringAsFixed(n.truncateToDouble() == n ? 0 : 2);
  }

  static String humanReadableByteCount(int bytes) {
    int unit = 1024;
    if (bytes < unit) return bytes.toString() + " B";
    int exp = log(bytes) ~/ log(unit);
    String pre = ("KMGTPE")[exp - 1] + "";
    double value = bytes / pow(unit, exp);
    String finalValue = format(value);
    return finalValue + ' ' + pre + 'B';
  }

  static String removeLastCharacter(String? str) {
    String result = '';
    if (checkIfNotNull(str)) {
      result = str!.substring(0, str.length - 1);
    }

    return result;
  }

  static bool getJSONBool(Map<String, dynamic> json, String key) {
    if (CommonUtils.checkIfNotNull(key) && json[key] != null) {
      if (json[key] is bool) {
        return json[key] as bool;
      } else if (json[key] is String &&
          CommonUtils.checkIfNotNull(json[key] as String?)) {
        return (((json[key] as String).trim().toLowerCase() == "yes") ||
            ((json[key] as String).trim().toLowerCase() == "true"));
      }
    }
    return false;
  }

  static String getJSONString(Map<String, dynamic> json, String key) {
    if (CommonUtils.checkIfNotNull(key) && json[key] != null) {
      if (json[key] is String) {
        return json[key] as String;
      } else if (json[key] is int) {
        return CommonUtils.getIntToString(json[key] as int);
      } else if (json[key] is String &&
          CommonUtils.checkIfNotNull(json[key] as String?)) {
        return ((((json[key] as String).trim().toLowerCase() == "yes") ||
                ((json[key] as String).trim().toLowerCase() == "true"))
            ? "True"
            : "False");
      }
    }
    return "";
  }

  static int getJSONInt(Map<String, dynamic> json, String key) {
    if (CommonUtils.checkIfNotNull(key) && json[key] != null) {
      if (json[key] is String) {
        return getStringToInt((json[key] as String));
      } else if (json[key] is int) {
        return json[key] as int;
      } else if (json[key] is String &&
          CommonUtils.checkIfNotNull(json[key] as String?)) {
        return ((((json[key] as String).trim().toLowerCase() == "yes") ||
                ((json[key] as String).trim().toLowerCase() == "true"))
            ? 1
            : 0);
      }
    }
    return -1;
  }

  static double getDouble(String? value) {
    if (CommonUtils.checkIfNotNull(value)) {
      try {
        var doubleVal = double.parse(value!);
        return doubleVal;
      } catch (Exception) {
        return 0;
      }
    }
    return 0;
  }

  static String getFormattedValue(String? value) {
    if (checkIfNotNull(value)) {
      var doubleVl = double.parse(value!);
      return doubleVl.toStringAsFixed(2);
    }
    return '0.0';
  }

  static String getStringFormattedValue(double? value) {
    if (value != null) {
      try {
        var stringVal = value.toStringAsFixed(2);
        return stringVal;
      } catch (Exception) {
        return '0.0';
      }
    }
    return '0.0';
  }

  static String getDoubleToString(double? value) {
    try {
      var stringVal = value.toString();
      return stringVal;
    } catch (Exception) {
      return '';
    }
    return '';
  }

  static String getIntToString(int? value) {
    try {
      var stringVal = value.toString();
      return stringVal;
    } catch (Exception) {
      return '';
    }
    return '';
  }

  static int getStringToInt(String? value) {
    try {
      if (CommonUtils.checkIfNotNull(value)) {
        var intVal = int.parse(value!);
        return intVal;
      }
    } catch (Exception) {
      return -1;
    }
    return -1;
  }

  static bool contains(String? value1, String? value2,
      {bool ignoreCase = false}) {
    if (checkIfNotNull(value1) && checkIfNotNull(value2)) {
      if (ignoreCase) {
        return value1
            .toString()
            .toLowerCase()
            .trim()
            .contains(value2.toString().toLowerCase().trim());
      } else {
        return value1.toString().trim().contains(value2.toString().trim());
      }
    }
    return false;
  }

  static BuildContext? getBuildContext(
      GlobalKey<ScaffoldState>? _scaffoldKey, BuildContext? context) {
    if (_scaffoldKey != null && _scaffoldKey.currentState != null) {
      if (_scaffoldKey.currentState!.context != null) {
        return _scaffoldKey.currentState!.context;
      } else if (_scaffoldKey.currentContext != null) {
        return _scaffoldKey.currentContext;
      }
    } else if (context != null) {
      return context;
    }
    return null;
  }

  static makePhoneCall(String? phoneNumber) async {
    if (CommonUtils.checkIfNotNull(phoneNumber)) {
      Uri phoneUrl = Uri.parse('tel://$phoneNumber');
      await launchUrl(phoneUrl);
    }
  }

  static composeSMS(String? phoneNumber) async {
    if (CommonUtils.checkIfNotNull(phoneNumber)) {
      Uri phoneUrl = Uri.parse('sms:$phoneNumber');
      await launchUrl(phoneUrl);
    }
  }

  static composeMail(String? email) async {
    if (CommonUtils.checkIfNotNull(email)) {
      Uri phoneUrl = Uri.parse('mailto:$email');
      await launchUrl(phoneUrl);
    }
  }

  static downloadFile(String? resumeLink, String windowTitle) async {
    if (CommonUtils.checkIfNotNull(resumeLink)) {
      Uri resumeUrl = Uri.parse(resumeLink!);
      await launchUrl(resumeUrl,
          mode: LaunchMode.externalApplication, webOnlyWindowName: windowTitle);
    }
  }

  static Widget getLoaderWidget() {
    return Container(
      margin: const EdgeInsets.fromLTRB(20, 100, 20, 20),
      //decoration: BoxDecoration(color: HexColor.getColor('#00000').withOpacity(0.2), borderRadius: const BorderRadius.all(Radius.circular(50))),
      child: SpinKitFadingCube(
        color: HexColor.getColor(PRIMARY_LIGHT_COLOR_HEX),
        size: 100,
      ),
    );
  }

  static showCommonDialog(String? title, String? message) {
    if (CommonUtils.checkIfNotNull(title) &&
        CommonUtils.checkIfNotNull(message)) {
      Get.defaultDialog(
        title: title ?? 'Info',
        middleText: message ?? "",
        textCancel: "OK",
        onCancel: () {},
        backgroundColor: HexColor.getColor(DARK_GREY_COLOR_HEX),
        titleStyle: const TextStyle(
            fontFamily: FONT_REGULAR, fontSize: 16, color: Colors.white),
        middleTextStyle: const TextStyle(
            fontFamily: FONT_REGULAR, fontSize: 15, color: Colors.white),
        buttonColor: HexColor.getColor(PRIMARY_DARK_COLOR_HEX),
        confirmTextColor: Colors.white,
        cancelTextColor: Colors.white,
        titlePadding: EdgeInsets.all(15),
        contentPadding: EdgeInsets.all(15),
      );
    }
  }

  static showCommonFunDialog(String? title, String? message,
      {String textOk = "Ok",
      String textCancel = "Cancel",
      Function()? onConfirm,
      Function()? onCancel}) {
    if (CommonUtils.checkIfNotNull(title) &&
        CommonUtils.checkIfNotNull(message)) {
      Get.defaultDialog(
        title: title ?? 'Info',
        middleText: message ?? "",
        textConfirm: (onConfirm != null) ? textOk : null,
        onConfirm: (onConfirm != null)
            ? () {
                Get.back();
                onConfirm();
              }
            : null,
        textCancel: (onCancel != null) ? textCancel : null,
        onCancel: (onCancel != null)
            ? () {
                Get.back();
                onCancel();
              }
            : null,
        backgroundColor: HexColor.getColor(DARK_GREY_COLOR_HEX),
        titleStyle: const TextStyle(
            fontFamily: FONT_REGULAR, fontSize: 16, color: Colors.white),
        middleTextStyle: const TextStyle(
            fontFamily: FONT_REGULAR, fontSize: 15, color: Colors.white),
        buttonColor: HexColor.getColor(PRIMARY_DARK_COLOR_HEX),
        confirmTextColor: Colors.white,
        cancelTextColor: Colors.white,
        titlePadding: EdgeInsets.all(15),
        contentPadding: EdgeInsets.all(15),
      );
    }
  }

  static showCommonToast(String? title, String? message,
      {SnackPosition? position, Duration? duration}) {
    if (CommonUtils.checkIfNotNull(title) &&
        CommonUtils.checkIfNotNull(message)) {
      Get.showSnackbar(GetSnackBar(
        title: title ?? 'Info',
        message: message ?? "",
        snackPosition: position ?? SnackPosition.BOTTOM,
        duration: duration ?? Duration(seconds: 2),
      ));
    }
  }

  static showProgressDialog(bool showLoading, String url) {
    if (!GeneralController.to.loadedUrls.contains(url))
      GeneralController.to.loadedUrls.add(url);
    if (showLoading && !(Get.isDialogOpen ?? false)) {
      Get.dialog(
        CommonUtils.getLoaderWidget(),
        barrierColor: Colors.transparent,
        barrierDismissible: false,
      );
    }
  }

  static hideProgressDialog(String url) {
    if (GeneralController.to.loadedUrls.contains(url))
      GeneralController.to.loadedUrls.remove(url);
    if (Get.isDialogOpen != null && Get.isDialogOpen!) {
      Get.close(1);
    }
  }

  static Future<bool?> showNoInternetDialog(BuildContext _context) async {
    return await showDialog<bool>(
      context: _context,
      builder: (BuildContext context) => AlertDialog(
        content: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Container(
              height: 80,
              width: 80,
              padding: const EdgeInsets.all(15),
              alignment: Alignment.center,
              decoration: const BoxDecoration(
                  image: DecorationImage(
                      image: AssetImage('assets/images/logo.png'),
                      fit: BoxFit.fitHeight)),
            ),
            const SizedBox(height: 10),
            const Text(
              'No Internet Connection',
              style: TextStyle(
                  fontSize: 18,
                  color: Colors.black,
                  fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 5),
            const Text(
              'Try these steps to get back online:',
              style: TextStyle(
                  fontSize: 15,
                  color: Colors.black,
                  fontWeight: FontWeight.normal),
            ),
            const SizedBox(height: 10),
            const Padding(
              padding: EdgeInsets.all(8.0),
              child: Text(
                '1. Check your modem and router\n2. Reconnect to Wi-Fi',
                style: TextStyle(
                    fontSize: 15,
                    color: Colors.black,
                    fontWeight: FontWeight.normal),
              ),
            ),
          ],
        ),
        actions: <Widget>[
          Container(
            alignment: Alignment.center,
            child: ElevatedButton(
              onPressed: () => {Navigator.of(context).pop(true)},
              style: ElevatedButton.styleFrom(
                foregroundColor: Colors.white,
                backgroundColor: HexColor.getColor(PRIMARY_COLOR_HEX),
                minimumSize: Size(150, 45),
                textStyle: TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                    fontSize: 18,
                    fontFamily: 'MontserratMedium'),
                padding: EdgeInsets.fromLTRB(20, 10, 20, 10),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(40.0),
                ),
              ),
              child: const Text(
                'Reload',
                textAlign: TextAlign.center,
                style: TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                    fontSize: 18,
                    fontFamily: 'MontserratMedium'),
              ),
            ),
          )
        ],
      ),
    );
    return null;
  }

  static Future<File?> writeToFile(ByteData? data, String name) async {
    if (data != null && checkIfNotNull(name)) {
      final buffer = data.buffer;
      Directory tempDir = await getTemporaryDirectory();
      String tempPath = tempDir.path;
      var filePath = tempPath + '/' + name;
      return File(filePath).writeAsBytes(
          buffer.asUint8List(data.offsetInBytes, data.lengthInBytes));
    }
    return null;
  }

  static Future<String> get _localPath async {
    final directory = await getApplicationDocumentsDirectory();

    return directory.path;
  }

  static printLog(String? log) {
    if (checkIfNotNull(log) && kDebugMode) {
      final logMsg = 'DEBUG_LOG: $log';
      int maxLogSize = 1000;
      for (int i = 0; i <= logMsg.length / maxLogSize; i++) {
        int start = i * maxLogSize;
        int end = (i + 1) * maxLogSize;
        end = end > logMsg.length ? logMsg.length : end;

        debugPrintThrottled(logMsg.substring(start, end));
      }
    }
  }

  static String getHashedString(String? value) {
    if (checkIfNotNull(value)) {
      return sha256.convert(utf8.encode(value!)).toString() ?? '';
    }
    return '';
  }

  static bool equalsIgnoreCase(String? string1, String? string2) {
    if (CommonUtils.checkIfNotNull(string1) &&
        CommonUtils.checkIfNotNull(string2)) {
      return string1!.toLowerCase() == string2!.toLowerCase();
    }
    return false;
  }
}
