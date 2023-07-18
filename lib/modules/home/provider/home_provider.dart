import 'dart:convert';

import 'package:hyll/api_manager/common_http_client.dart';
import 'package:hyll/entities/slider_entity.dart';
import 'package:hyll/enums/method_type.dart';
import 'package:hyll/modules/home/provider/home_controller.dart';
import 'package:hyll/utils/app_constants.dart';
import 'package:hyll/utils/common_utils.dart';

class HomeProvider {
  fetchHomeSliderAPI({
    required Function(List<SliderEntity>) onSuccess,
  }) async {
    final response = await CommonHttpClient(adventures_login_api,
        body: <String, String>{}, method: MethodType.GET)
        .getDigestAuthResponse();

    if (response != null) {
      if (CommonUtils.checkIfNotNull(response.body)) {
        Map<String, dynamic>? resMap = jsonDecode(response.body);
        if (resMap != null) {
          HomeController.to.count.value = (resMap['count'] as int?) ?? 0;
          HomeController.to.nextLink.value = (resMap['next'] as String?) ?? '';
          HomeController.to.prevLink.value =
              (resMap['previous'] as String?) ?? '';
          if (resMap['data'] != null) {
            var list = resMap['data'] as List?;
            if (list != null && list.isNotEmpty) {
              List<SliderEntity> sList = [];
              try {
                sList = await list.map((i) => SliderEntity.fromJson(i)).toList();
              } catch (e) {
                sList = [];
              } finally {
                onSuccess(sList);
              }
            }
          }
        }
      }
    }
  }
}
