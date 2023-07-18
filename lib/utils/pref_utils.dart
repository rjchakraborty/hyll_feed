

import 'package:hyll/main.dart';
import 'package:hyll/utils/common_utils.dart';

dynamic getPrefValue(String key) {
  return getPreferences.read(key);
}

setPrefValue(String? key, dynamic value) {
  if (CommonUtils.checkIfNotNull(key)) {
    getPreferences.write(key!, value);
  }
}
