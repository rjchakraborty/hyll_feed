import 'dart:async';
import 'dart:convert';
import 'dart:io';

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:hyll/controller/general_controller.dart';
import 'package:hyll/enums/method_type.dart';
import 'package:hyll/utils/app_constants.dart';
import 'package:hyll/utils/common_utils.dart';
import 'package:package_info_plus/package_info_plus.dart';

class CommonHttpClient {
  Map<String, String>? headers = <String, String>{};
  Map<String, dynamic>? body = <String, dynamic>{};
  String url = '';
  String versionCode = '0';
  String? encodedBody;
  String method = MethodType.POST;
  bool showLoading = false;

  CommonHttpClient(this.url, {this.body, this.encodedBody, this.method = MethodType.POST, this.showLoading = false});

  initHeaders({bool isMultipart = false}) async {
    PackageInfo packageInfo = await PackageInfo.fromPlatform();
    String versionName = packageInfo.version;
    versionCode = packageInfo.buildNumber;
    //String appName = packageInfo.appName;
    String packageName = packageInfo.packageName;

    headers = <String, String>{
      'app_type': Platform.operatingSystem,
      'app_version': versionName,
      'Content-Type': isMultipart ? 'application/octet-stream' : 'application/json; charset=UTF-8',
      'cache-control': 'no-cache',
      'User-Agent': '${Platform.operatingSystem}-$versionName/$versionCode/v$packageName'
    };

  }

  initBody() {
    body ??= <String, dynamic>{};

    if (!CommonUtils.checkIfNotNull(encodedBody)) {
      encodedBody = jsonEncode(body);
    }
  }


  Future<http.Response?> getDigestAuthResponse() async {
    http.Response? response;
    CommonUtils.checkInternet();
    CommonUtils.showProgressDialog(showLoading, url);
    if (CommonUtils.checkIfNotNull(url) && GeneralController.isConnected) {
      var isOngoingConnection = (AppConstants.ONGOING_ACTIONS[url] != null && AppConstants.ONGOING_ACTIONS[url] == true);
      if (!isOngoingConnection) {
        AppConstants.ONGOING_ACTIONS[url] = true;
        await initHeaders();
        initBody();
        if (headers != null && body != null) {
          switch (method) {
            case MethodType.GET:
              response = await http.get(Uri.parse(url), headers: headers).timeout(const Duration(seconds: API_REQUEST_TIMEOUT), onTimeout: () {
                return http.Response(API_TIMEOUT, 500);
              }).onError((error, stackTrace) {
                debugPrint('Error: ${error.toString()}');
                debugPrint('StackTrace: ${stackTrace.toString()}');
                return http.Response(API_ERROR, 500);
              });
              break;
            case MethodType.PUT:
              response = await http
                  .put(Uri.parse(url), headers: headers, body: encodedBody)
                  .timeout(const Duration(seconds: API_REQUEST_TIMEOUT), onTimeout: () {
                return http.Response(API_TIMEOUT, 500);
              }).onError((error, stackTrace) {
                debugPrint('Error: ${error.toString()}');
                debugPrint('StackTrace: ${stackTrace.toString()}');
                return http.Response(API_ERROR, 500);
              });
              break;
            case MethodType.DELETE:
              response = await http
                  .delete(Uri.parse(url), headers: headers, body: encodedBody)
                  .timeout(const Duration(seconds: API_REQUEST_TIMEOUT), onTimeout: () {
                return http.Response(API_TIMEOUT, 500);
              }).onError((error, stackTrace) {
                debugPrint('Error: ${error.toString()}');
                debugPrint('StackTrace: ${stackTrace.toString()}');
                return http.Response(API_ERROR, 500);
              });
              break;
            default:
              response = await http
                  .post(Uri.parse(url), headers: headers, body: encodedBody)
                  .timeout(const Duration(seconds: API_REQUEST_TIMEOUT), onTimeout: () {
                return http.Response(API_TIMEOUT, 500);
              }).onError((error, stackTrace) {
                debugPrint('Error: ${error.toString()}');
                debugPrint('StackTrace: ${stackTrace.toString()}');
                return http.Response(API_ERROR, 500);
              });
              break;
          }
          if (response.statusCode == 401) {
            //todo add auto logout
          }

          if (kDebugMode) {
            debugPrint('Headers: $headers');
            debugPrint('Body: $body');
            debugPrint('URL: $url');
            debugPrint('Response Code: ${response.statusCode}');
            if (CommonUtils.checkIfNotNull(response.body)) {
              debugPrint('Response: ${response.body}');
            }
          }
        }

        AppConstants.ONGOING_ACTIONS[url] = false;
      }
    }
    CommonUtils.hideProgressDialog(url);

    return response;
  }

 }

