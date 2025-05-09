import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:smp_app/app/constants/app_constants.dart';
import 'package:smp_app/app/constants/color_constants.dart';
import 'package:smp_app/app/constants/string_constants.dart';
import 'package:smp_app/app/routes/app_pages.dart';
import 'package:smp_app/app/utils/extensions.dart';
import 'package:smp_app/app/widgets/custom_icon_button.dart';
import 'package:smp_app/app/widgets/custom_text_form_field.dart';

import '../controllers/register_controller.dart';

class RegisterView extends GetView<RegisterController> {
  const RegisterView({super.key});
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
                        StringConstants.register,
                        style: Theme.of(context).textTheme.titleLarge,
                      ),

                      AppConstants.sizeSmall.h,

                      Text(
                        StringConstants.registerWelcomeMessage,
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

                      AppConstants.sizeMedium.h,

                      /// Confirm Password
                      Text(
                        StringConstants.confirmPassword,
                        style: Theme.of(context).textTheme.bodyLarge,
                      ),
                      AppConstants.sizeSmall.h,
                      CustomTextFormField(
                        textEditingController:
                            controller.confirmPasswordController,
                        obscureText: !controller.showConfirmPassword.value,
                        prefixIcon: Icon(Icons.lock_outline),
                        suffixIcon: IconButton(
                          icon: Icon(
                            controller.showConfirmPassword.value
                                ? Icons.visibility_off_outlined
                                : Icons.visibility_outlined,
                          ),
                          onPressed:
                              () =>
                                  controller.showConfirmPassword
                                      .toggle()
                                      .refresh(),
                        ),
                        hintText: StringConstants.enterConfirmPassword,
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return StringConstants.validateEnterPassword;
                          } else if (value !=
                              controller.passwordController.text.trim()) {
                            return StringConstants
                                .validateEnterValidConfirmPassword;
                          }
                          return null;
                        },
                      ),

                      AppConstants.sizeLarge.h,

                      /// Register Button
                      Center(
                        child:
                            controller.isLoading.value
                                ? const CircularProgressIndicator()
                                : CustomButton(
                                  label: StringConstants.register,
                                  hasFullWidth: true,
                                  onPressed: () => controller.register(),
                                ),
                      ),
                      AppConstants.sizeLarge.h,
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
                Text(StringConstants.alreadyHaveAccount),
                TextButton(
                  onPressed: () {
                    Get.offNamedUntil(Routes.LOGIN, (route) => false);
                  },
                  child: Text(
                    StringConstants.login,
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
