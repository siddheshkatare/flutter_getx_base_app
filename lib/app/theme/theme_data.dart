import 'package:flutter/material.dart';
import 'package:smp_app/app/constants/app_constants.dart';
import 'package:smp_app/app/constants/color_constants.dart';
import 'package:smp_app/gen/fonts.gen.dart';

final ThemeData appTheme = ThemeData(
  primaryColor: ColorConstants.primaryColor,
  colorScheme: ColorScheme.fromSwatch().copyWith(
    primary: ColorConstants.primaryColor,
    secondary: ColorConstants.secondaryColor,
  ),
  dividerTheme: const DividerThemeData(color: ColorConstants.borderColor),
  scaffoldBackgroundColor: ColorConstants.backgroundColor,
  appBarTheme: const AppBarTheme(
    titleTextStyle: TextStyle(
      fontSize: 24,
      fontWeight: FontWeight.bold,
      color: ColorConstants.primaryTextColor,
      fontFamily: FontFamily.nexaBold,
    ),
  ),
  fontFamily: FontFamily.nexaRegular,
  textTheme: const TextTheme(
    titleLarge: TextStyle(
      fontSize: 28,
      fontWeight: FontWeight.bold,
      color: ColorConstants.primaryTextColor,
      fontFamily: FontFamily.nexaBold,
    ),
    titleMedium: TextStyle(
      fontSize: 24,
      fontWeight: FontWeight.bold,
      color: ColorConstants.primaryTextColor,
      fontFamily: FontFamily.nexaBold,
    ),
    titleSmall: TextStyle(
      fontSize: 18,
      fontWeight: FontWeight.bold,
      color: ColorConstants.primaryTextColor,
      fontFamily: FontFamily.nexaBold,
    ),
    labelLarge: TextStyle(
      fontSize: 16,
      color: ColorConstants.primaryTextColor,
      fontWeight: FontWeight.w500,
      fontFamily: FontFamily.nexaBold,
    ),
    labelMedium: TextStyle(
      fontSize: 14,
      color: ColorConstants.primaryTextColor,
      fontFamily: FontFamily.nexaBold,
      fontWeight: FontWeight.w500,
    ),
    labelSmall: TextStyle(
      fontSize: 12,
      color: ColorConstants.primaryTextColor,
      fontFamily: FontFamily.nexaBold,
      fontWeight: FontWeight.w500,
    ),
    bodyLarge: TextStyle(fontSize: 16, color: ColorConstants.primaryTextColor),
    bodyMedium: TextStyle(fontSize: 14, color: ColorConstants.primaryTextColor),
    bodySmall: TextStyle(fontSize: 12, color: ColorConstants.primaryTextColor),
  ),
  elevatedButtonTheme: ElevatedButtonThemeData(
    style: ElevatedButton.styleFrom(
      backgroundColor: ColorConstants.buttonColor,
      foregroundColor: Colors.white,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(AppConstants.sizeLarge),
      ),
      padding: AppConstants.buttonPadding,
      textStyle: const TextStyle(
        fontSize: 14,
        fontFamily: FontFamily.poppins,
        fontWeight: FontWeight.w500,
      ),
    ),
  ),
  buttonTheme: ButtonThemeData(
    colorScheme: ColorScheme.fromSwatch().copyWith(
      primary: ColorConstants.buttonColor,
      onPrimary: Colors.white,
    ),
    padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 16),
    buttonColor: ColorConstants.buttonColor, // Default button color
    textTheme: ButtonTextTheme.primary,
    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
  ),
  chipTheme: ChipThemeData(
    backgroundColor: ColorConstants.white,
    labelStyle: const TextStyle(
      fontSize: 14,
      fontFamily: FontFamily.poppins,
      fontWeight: FontWeight.w500,
      color: ColorConstants.primaryTextColor,
    ),
    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
  ),
  iconTheme: const IconThemeData(color: ColorConstants.primaryTextColor),
);
