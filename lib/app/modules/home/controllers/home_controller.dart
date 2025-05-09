import 'package:get/get.dart';
import 'package:smp_app/app/routes/app_pages.dart';
import 'package:smp_app/app/utils/auth_utils.dart';
import 'package:smp_app/app/utils/log_utils.dart';

class HomeController extends GetxController {
  final RxBool isLoading = false.obs;

  final RxString emailAddress = ''.obs;
  @override
  void onInit() {
    super.onInit();
  }

  @override
  void onReady() {
    try {
      emailAddress.value = AuthUtils.getAuthData()['email'];
    } catch (e) {
      LogUtils.print(e);
    }
    super.onReady();
  }

  @override
  void onClose() {
    super.onClose();
  }

  Future<void> logout() async {
    isLoading.value = true;
    // TODO: implement login
    await Future.delayed(const Duration(seconds: 2), () {
      isLoading.value = false;
    });
    AuthUtils.logout();
    Get.offAllNamed(Routes.LOGIN);
  }
}
