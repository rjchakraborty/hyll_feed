import 'dart:async';

import 'package:hyll/utils/common_utils.dart';

mixin Validators {
  var nameValidator = StreamTransformer<String, String>.fromHandlers(handleData: (name, sink) {
    if (CommonUtils.checkIfNotNull(name)) {
      sink.add(name);
    } else {
      sink.addError("Please enter your name!");
    }
  });

  var workaspaceValidator = StreamTransformer<String, String>.fromHandlers(handleData: (workspace, sink) {
    if (workspace.isNotEmpty) {
      sink.add(workspace.trim().toLowerCase().replaceAll(new RegExp(r"\s+"), ""));
    } else {
      sink.addError("Please enter Company Handle!");
    }
  });

  var emailValidator = StreamTransformer<String, String>.fromHandlers(handleData: (email, sink) {
    RegExp regExp = new RegExp(
      r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+",
      caseSensitive: false,
      multiLine: false,
    );
    if (regExp.hasMatch(email)) {
      sink.add(email);
    } else {
      sink.addError("Please enter a valid email!");
    }
  });

  var passwordExistValidator = StreamTransformer<String, String>.fromHandlers(handleData: (name, sink) {
    if (CommonUtils.checkIfNotNull(name)) {
      sink.add(name);
    } else {
      sink.addError("Please enter login password!");
    }
  });
}
