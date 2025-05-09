import 'package:get/get.dart';
import 'package:smp_app/app/routes/app_pages.dart';
import 'package:smp_app/app/utils/auth_utils.dart';

class SplashController extends GetxController {
  @override
  void onInit() {
    super.onInit();
  }

  @override
  void onReady() {
    super.onReady();
    Future.delayed(Duration(seconds: 3), () {
      AuthUtils.isAuth()
          ? Get.offAllNamed(Routes.HOME)
          : Get.offAllNamed(Routes.LOGIN);
    });
  }

  @override
  void onClose() {
    super.onClose();
  }
}
