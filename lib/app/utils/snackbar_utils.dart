import 'package:flutter/material.dart';
import 'package:smp_app/app/constants/app_constants.dart';
import 'package:smp_app/app/constants/color_constants.dart';
import 'package:smp_app/app/constants/string_constants.dart';
import 'package:smp_app/app/theme/theme_data.dart';

enum SnackbarTypes { success, failed, warning, info }

class SnackbarUtils {
  static void showSnackbar({
    // required BuildContext context,
    BuildContext? context,
    required String message,
    SnackbarTypes? type,
    void Function()? onPressed,
    String? actionLabel,
    Duration duration = const Duration(seconds: 4),
  }) {
    // ScaffoldMessenger.of(context).showSnackBar(
    AppConstants.snackbarKey.currentState?.showSnackBar(
      SnackBar(
        backgroundColor: _getSnackbarColor(type),
        content: Text(
          message,
          style: appTheme.textTheme.bodyMedium?.copyWith(
            color: ColorConstants.white,
          ),
        ),
        action:
            onPressed == null
                ? null
                : SnackBarAction(
                  label: actionLabel ?? StringConstants.view,
                  textColor: ColorConstants.white,
                  onPressed: onPressed,
                ),
        duration: duration,
        behavior: SnackBarBehavior.floating,
        showCloseIcon: true,
      ),
    );
  }

  static Color? _getSnackbarColor(SnackbarTypes? type) {
    switch (type) {
      case SnackbarTypes.success:
        return ColorConstants.successColor;

      case SnackbarTypes.failed:
        return ColorConstants.errorColor;

      case SnackbarTypes.warning:
        return ColorConstants.warningColor;

      case SnackbarTypes.info:
        return ColorConstants.infoColor;

      default:
        return null;
    }
  }
}
