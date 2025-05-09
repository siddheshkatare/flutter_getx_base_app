import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:get/get.dart';
import 'package:smp_app/app/constants/string_constants.dart';
import 'package:smp_app/app/routes/app_pages.dart';
import 'package:smp_app/app/utils/snackbar_utils.dart';

class ChangePasswordController extends GetxController {
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  final TextEditingController confirmPasswordController =
      TextEditingController();

  final RxBool isLoading = false.obs;
  final RxBool showPassword = false.obs;
  final RxBool showConfirmPassword = false.obs;

  @override
  void onInit() {
    super.onInit();
  }

  @override
  void onReady() {
    super.onReady();
  }

  @override
  void onClose() {
    super.onClose();
  }

  Future<void> changePassword() async {
    if (!formKey.currentState!.validate()) return;

    String email = emailController.text.trim();
    String password = passwordController.text.trim();
    String confirmPassword = confirmPasswordController.text.trim();
    // TODO: implement change password}

    isLoading.value = true;
    await Future.delayed(const Duration(seconds: 2), () {
      isLoading.value = false;
    });

    SnackbarUtils.showSnackbar(
      message: StringConstants.passwordChangeSuccess,
      type: SnackbarTypes.success,
    );

    Get.offAllNamed(Routes.LOGIN);
  }
}
