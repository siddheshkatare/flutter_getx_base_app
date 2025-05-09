import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:smp_app/app/constants/app_constants.dart';
import 'package:smp_app/app/constants/string_constants.dart';
import 'package:smp_app/app/utils/extensions.dart';
import 'package:smp_app/app/widgets/custom_icon_button.dart';

import '../controllers/home_controller.dart';

class HomeView extends GetView<HomeController> {
  const HomeView({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Obx(
        () => Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text('Welcome Back!', style: context.textThemeData.titleLarge),
              AppConstants.sizeMedium.h,
              Text(
                controller.emailAddress.value,
                style: context.textThemeData.bodyLarge,
              ),
              AppConstants.sizeLarge.h,
              CustomButton(
                label: StringConstants.logout,
                onPressed: () => controller.logout(),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
