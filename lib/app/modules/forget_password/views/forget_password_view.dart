import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:smp_app/app/constants/app_constants.dart';
import 'package:smp_app/app/constants/color_constants.dart';
import 'package:smp_app/app/constants/string_constants.dart';
import 'package:smp_app/app/routes/app_pages.dart';
import 'package:smp_app/app/utils/extensions.dart';
import 'package:smp_app/app/widgets/custom_icon_button.dart';
import 'package:smp_app/app/widgets/custom_text_form_field.dart';

import '../controllers/forget_password_controller.dart';

class ForgetPasswordView extends GetView<ForgetPasswordController> {
  const ForgetPasswordView({super.key});
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
                        StringConstants.forgetPassword,
                        style: Theme.of(context).textTheme.titleLarge,
                      ),

                      AppConstants.sizeSmall.h,

                      Text(
                        StringConstants.forgetPasswordWelcomeMessage,
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
                        enabled: !controller.isOtpSent.value,
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

                      if (controller.isOtpSent.value) ...[
                        AppConstants.sizeMedium.h,

                        /// OTP
                        Text(
                          StringConstants.otp,
                          style: Theme.of(context).textTheme.bodyLarge,
                        ),
                        AppConstants.sizeSmall.h,
                        CustomTextFormField(
                          textEditingController: controller.otpController,
                          prefixIcon: Icon(Icons.password),
                          hintText: StringConstants.enterOtp,
                          keyboardType: TextInputType.visiblePassword,
                          validator: (value) {
                            if (value == null || value.isEmpty) {
                              return StringConstants.validateEnterOtp;
                            } else if (value.length != 6) {
                              return StringConstants.validateEnterValidOtp;
                            }
                            return null;
                          },
                        ),
                      ],

                      AppConstants.sizeLarge.h,

                      /// Register Button
                      Center(
                        child:
                            controller.isLoading.value
                                ? CircularProgressIndicator()
                                : controller.isOtpSent.value
                                ? CustomButton(
                                  label: StringConstants.verifyOtp,
                                  hasFullWidth: true,
                                  onPressed: () => controller.verifyOtp(),
                                )
                                : CustomButton(
                                  label: StringConstants.requestOtp,
                                  hasFullWidth: true,
                                  onPressed: () => controller.requestOtp(),
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
                Text(StringConstants.rememberPassword),
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
