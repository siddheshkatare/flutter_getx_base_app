import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:smp_app/app/constants/app_constants.dart';
import 'package:smp_app/app/constants/color_constants.dart';
import 'package:smp_app/app/constants/string_constants.dart';
import 'package:smp_app/app/routes/app_pages.dart';
import 'package:smp_app/app/utils/extensions.dart';
import 'package:smp_app/app/widgets/custom_icon_button.dart';
import 'package:smp_app/app/widgets/custom_text_form_field.dart';

import '../controllers/login_controller.dart';

class LoginView extends GetView<LoginController> {
  const LoginView({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Expanded(
            child: SingleChildScrollView(
              padding: AppConstants.paddingExtraLargeSymentric,
              child: Obx(
                () => Form(
                  key: controller.formKey,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      (context.viewPadding.top + AppConstants.sizeExtraLarge).h,

                      Text(
                        StringConstants.login,
                        style: Theme.of(context).textTheme.titleLarge,
                      ),

                      AppConstants.sizeSmall.h,

                      Text(
                        StringConstants.loginWelcomeMessage,
                        style: Theme.of(context).textTheme.titleSmall,
                      ),

                      AppConstants.sizeExtraLarge.h,

                      /// Email
                      Text(
                        StringConstants.emailAddress,
                        style: Theme.of(context).textTheme.bodyLarge,
                      ),
                      AppConstants.sizeSmall.h,
                      CustomTextFormField(
                        textEditingController: controller.emailController,
                        prefixIcon: Icon(Icons.email_outlined),
                        hintText: StringConstants.emailAddress,
                        keyboardType: TextInputType.emailAddress,
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return StringConstants.validateEnterEmailAddress;
                          } else if (!GetUtils.isEmail(value)) {
                            return StringConstants
                                .validateEnterValidEmailAddress;
                          }
                          return null;
                        },
                      ),

                      AppConstants.sizeMedium.h,

                      /// Password
                      Text(
                        StringConstants.password,
                        style: Theme.of(context).textTheme.bodyLarge,
                      ),
                      AppConstants.sizeSmall.h,
                      CustomTextFormField(
                        textEditingController: controller.passwordController,
                        obscureText: !controller.showPassword.value,
                        prefixIcon: Icon(Icons.lock_outline),
                        suffixIcon: IconButton(
                          icon: Icon(
                            controller.showPassword.value
                                ? Icons.visibility_off_outlined
                                : Icons.visibility_outlined,
                          ),
                          onPressed:
                              () => controller.showPassword.toggle().refresh(),
                        ),
                        keyboardType: TextInputType.visiblePassword,
                        hintText: StringConstants.enterPassword,
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return StringConstants.validateEnterPassword;
                          } else if (value.length < 6) {
                            return StringConstants.validatePassword;
                          }
                          return null;
                        },
                      ),

                      AppConstants.sizeSmall.h,

                      /// Forget Password Button
                      Align(
                        alignment: Alignment.centerRight,
                        child: TextButton(
                          onPressed: () {
                            Get.toNamed(Routes.FORGET_PASSWORD);
                          },
                          child: Text(StringConstants.forgetPassword),
                        ),
                      ),

                      AppConstants.sizeLarge.h,

                      /// Login Button
                      Center(
                        child:
                            controller.isLoading.value
                                ? const CircularProgressIndicator()
                                : CustomButton(
                                  label: StringConstants.login,
                                  hasFullWidth: true,
                                  onPressed: () => controller.login(),
                                ),
                      ),
                      AppConstants.sizeLarge.h,

                      /// Register Button
                    ],
                  ),
                ),
              ),
            ),
          ),
          Padding(
            padding: AppConstants.paddingExtraLargeSymentric.copyWith(
              bottom: AppConstants.sizeExtraLarge + context.viewPadding.bottom,
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(StringConstants.dontHaveAccount),
                TextButton(
                  onPressed: () {
                    Get.toNamed(Routes.REGISTER);
                  },
                  child: Text(
                    StringConstants.register,
                    style: context.textThemeData.labelLarge?.copyWith(
                      color: ColorConstants.primaryColor,
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
