import 'package:flutter/material.dart';
import 'package:smp_app/app/constants/app_constants.dart';
import 'package:smp_app/app/constants/color_constants.dart';

class CustomTextFormField extends StatelessWidget {
  const CustomTextFormField({
    super.key,
    this.validator,
    this.suffixIcon,
    this.prefixIcon,
    this.textEditingController,
    this.enabled = true,
    this.obscureText = false,
    this.labelText,
    this.hintText,
    this.textInputAction,
    this.keyboardType,
  });

  final String? Function(String?)? validator;
  final Widget? suffixIcon;
  final Widget? prefixIcon;
  final TextEditingController? textEditingController;
  final bool enabled;
  final bool obscureText;
  final String? labelText;
  final String? hintText;
  final TextInputAction? textInputAction;
  final TextInputType? keyboardType;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: textEditingController,
      obscureText: obscureText,
      decoration: InputDecoration(
        enabled: enabled,
        filled: true,
        fillColor: ColorConstants.inputFieldColor,
        labelText: labelText,
        hintText: hintText,
        hintStyle: Theme.of(context).textTheme.bodyMedium,
        errorStyle: Theme.of(
          context,
        ).textTheme.bodySmall?.copyWith(color: ColorConstants.errorColor),

        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(AppConstants.sizeSmall),
          borderSide: BorderSide(color: ColorConstants.borderColor, width: 1),
        ),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(AppConstants.sizeSmall),
          borderSide: BorderSide(color: ColorConstants.borderColor, width: 1),
        ),
        suffixIcon: suffixIcon,
        prefixIcon: prefixIcon,
      ),
      style: Theme.of(context).textTheme.bodyMedium,
      textInputAction: textInputAction,
      keyboardType: keyboardType,
      onEditingComplete: () {
        FocusScope.of(context).unfocus();
      },
      validator: validator,
    );
  }
}
