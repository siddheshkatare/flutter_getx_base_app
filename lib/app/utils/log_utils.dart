import 'package:flutter/material.dart';
import 'package:smp_app/app/constants/string_constants.dart';

class LogUtils {
  static void print(dynamic message) {
    debugPrint('${StringConstants.appName} :: $message');
  }
}
