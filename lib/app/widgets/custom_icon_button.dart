import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:smp_app/app/constants/app_constants.dart';
import 'package:smp_app/app/constants/color_constants.dart';
import 'package:smp_app/app/utils/extensions.dart';

class CustomButton extends StatelessWidget {
  final GestureTapCallback? onPressed;
  final Widget? icon;
  final String label;
  final Color? backgroundColor;
  final Color? foregroundColor;
  final WidgetStateProperty<Size?>? fixedSize;
  final bool isEnabled;
  final EdgeInsetsGeometry? padding;
  final TextStyle? textStyle;
  final bool hasFullWidth;

  const CustomButton({
    super.key,
    this.onPressed,
    this.icon,
    required this.label,
    this.backgroundColor,
    this.foregroundColor,
    this.fixedSize,
    this.textStyle,
    this.isEnabled = true,
    this.padding,
    this.hasFullWidth = false,
  });

  @override
  Widget build(BuildContext context) {
    return hasFullWidth
        ? SizedBox(width: double.infinity, child: _button(context))
        : _button(context);
  }

  Widget _button(BuildContext context) => ElevatedButton.icon(
    onPressed: onPressed,
    icon: icon,
    style: ButtonStyle(
      textStyle: WidgetStateProperty.all(
        textStyle ?? context.textTheme.labelMedium,
      ),
      backgroundColor: WidgetStateProperty.all(
        !isEnabled
            ? ColorConstants.disabledBackgroundColor
            : backgroundColor ?? ColorConstants.buttonTBackgroundColor,
      ),
      foregroundColor: WidgetStateProperty.all(
        !isEnabled
            ? ColorConstants.disabledTextColor
            : foregroundColor ?? ColorConstants.buttonTextColor,
      ),
      iconColor: WidgetStateProperty.all(
        foregroundColor ?? ColorConstants.buttonTextColor,
      ),
      fixedSize: fixedSize,
      shape: WidgetStateProperty.all(
        RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(AppConstants.sizeSmall),
          side: BorderSide(
            color: (!isEnabled
                    ? ColorConstants.disabledTextColor
                    : foregroundColor ?? ColorConstants.buttonTextColor)
                .withValues(alpha: 0.2),
          ),
        ),
      ),
      elevation: WidgetStateProperty.all(0),
      padding: WidgetStateProperty.all(padding ?? _defaultPadding),
    ),
    label: Text(label),
  );

  EdgeInsets get _defaultPadding =>
      kIsWeb
          ? const EdgeInsets.symmetric(horizontal: 24, vertical: 20)
          : const EdgeInsets.symmetric(horizontal: 16, vertical: 12);
}
