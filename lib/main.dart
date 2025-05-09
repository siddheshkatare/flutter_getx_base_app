import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:smp_app/app/constants/app_constants.dart';
import 'package:smp_app/app/constants/string_constants.dart';
import 'package:smp_app/app/theme/theme_data.dart';

import 'app/routes/app_pages.dart';

void main() {
  runMainApp();
}

// created different runMainApp to avoid async error
Future<void> runMainApp() async {
  // Initialize plugins here.
  await GetStorage.init();

  // End of initialize plugins
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: StringConstants.appName,
      initialRoute: AppPages.INITIAL,
      getPages: AppPages.routes,
      theme: appTheme,
      scaffoldMessengerKey: AppConstants.snackbarKey,
    );
  }
}
