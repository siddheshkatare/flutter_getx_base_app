import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:smp_app/app/constants/string_constants.dart';
import 'package:smp_app/app/routes/app_pages.dart';
import 'package:smp_app/app/utils/auth_utils.dart';
import 'package:smp_app/app/utils/snackbar_utils.dart';

class LoginController extends GetxController {
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();

  final RxBool isLoading = false.obs;
  final RxBool showPassword = false.obs;

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

  Future<void> login() async {
    if (!formKey.currentState!.validate()) return;

    String email = emailController.text.trim();
    String password = passwordController.text.trim();

    isLoading.value = true;
    // TODO: implement login
    await Future.delayed(const Duration(seconds: 2), () {
      isLoading.value = false;
    });

    SnackbarUtils.showSnackbar(
      message: StringConstants.loginSuccess,
      type: SnackbarTypes.success,
    );

    AuthUtils.login({'email': email}, 'accessToken', 'refreshToken');

    Get.offAllNamed(Routes.HOME);
  }
}
