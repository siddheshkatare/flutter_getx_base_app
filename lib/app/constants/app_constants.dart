import 'package:flutter/material.dart';

class AppConstants {
  static final GlobalKey<ScaffoldMessengerState> snackbarKey =
      GlobalKey<ScaffoldMessengerState>();

  static EdgeInsets bottomSheetPadding = EdgeInsets.only(
    left: 16,
    right: 16,
    top: 12,
    bottom:
        12 +
        MediaQueryData.fromView(
          WidgetsBinding.instance.platformDispatcher.views.single,
        ).viewPadding.bottom,
  );

  static const EdgeInsets buttonPadding = EdgeInsets.symmetric(
    horizontal: 18,
    vertical: 12,
  );

  static const EdgeInsets paddingExtraLargeSymentric = EdgeInsets.symmetric(
    horizontal: 16,
    vertical: 12,
  );

  static const EdgeInsets paddingLargeSymentric = EdgeInsets.symmetric(
    horizontal: 12,
    vertical: 8,
  );

  static const EdgeInsets paddingMediumSymentric = EdgeInsets.symmetric(
    horizontal: 8,
    vertical: 4,
  );

  static const EdgeInsets paddingSmallSymentric = EdgeInsets.symmetric(
    horizontal: 6,
    vertical: 4,
  );

  static const EdgeInsets paddingExtraSmallSymentric = EdgeInsets.symmetric(
    horizontal: 4,
    vertical: 2,
  );

  static const double sizeHuge = 20.0;
  static const double sizeExtraLarge = 18.0;
  static const double sizeLarge = 16.0;
  static const double sizeMedium = 12.0;
  static const double sizeSmall = 8.0;
  static const double sizeExtraSmall = 4.0;
}
