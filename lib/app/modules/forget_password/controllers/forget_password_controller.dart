import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:smp_app/app/routes/app_pages.dart';

class ForgetPasswordController extends GetxController {
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();

  final TextEditingController emailController = TextEditingController();
  final TextEditingController otpController = TextEditingController();

  final RxBool isLoading = false.obs;
  final RxBool isOtpSent = false.obs;

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

  void requestOtp() {
    if (!formKey.currentState!.validate()) return;

    String email = emailController.text.trim();

    isLoading.value = true;
    // TODO: implement verify email and send otp
    Future.delayed(const Duration(seconds: 2), () {
      isLoading.value = false;
      isOtpSent.value = true;
    });
  }

  Future<void> verifyOtp() async {
    if (!formKey.currentState!.validate()) return;

    String email = emailController.text.trim();
    String otp = otpController.text.trim();

    isLoading.value = true;
    await Future.delayed(const Duration(seconds: 2), () {
      isLoading.value = false;
    });
    // TODO: implement verify otp
    Get.offNamed(Routes.CHANGE_PASSWORD);
  }
}
