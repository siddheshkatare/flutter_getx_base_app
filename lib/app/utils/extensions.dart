import 'package:flutter/material.dart';

extension SizeBoxExtension on double {
  SizedBox get h => SizedBox(height: this);
  SizedBox get w => SizedBox(width: this);
}

extension PaddingExtension on double {
  EdgeInsets get p => EdgeInsets.all(this);
  EdgeInsets get horizontal => EdgeInsets.symmetric(horizontal: this);
  EdgeInsets get vertical => EdgeInsets.symmetric(vertical: this);
  EdgeInsets get left => EdgeInsets.only(left: this);
  EdgeInsets get right => EdgeInsets.only(right: this);
  EdgeInsets get top => EdgeInsets.only(top: this);
  EdgeInsets get bottom => EdgeInsets.only(bottom: this);
}

extension PaddingWidgetExtension on Widget {
  Widget paddingAll(double padding) => Padding(padding: padding.p, child: this);
  Widget paddingSymmetric({double? horizontal, double? vertical}) => Padding(
    padding: EdgeInsets.symmetric(
      horizontal: horizontal ?? 0,
      vertical: vertical ?? 0,
    ),
    child: this,
  );
  Widget paddingOnly({
    double? left,
    double? right,
    double? top,
    double? bottom,
  }) => Padding(
    padding: EdgeInsets.only(
      left: left ?? 0,
      right: right ?? 0,
      top: top ?? 0,
      bottom: bottom ?? 0,
    ),
    child: this,
  );
}

extension BuildContextExtensions on BuildContext {
  ThemeData get theme => Theme.of(this);
  TextTheme get textTheme => theme.textTheme;
  ColorScheme get colorScheme => theme.colorScheme;
  MediaQueryData get mediaQuery => MediaQuery.of(this);
  Size get size => mediaQuery.size;
  double get screenHeight => size.height;
  double get screenWidth => size.width;
  EdgeInsets get viewPadding => mediaQuery.viewPadding;
  EdgeInsets get padding => mediaQuery.padding;
}

extension ContextExtension on BuildContext {
  TextTheme get textThemeData => Theme.of(this).textTheme;

  double get height => MediaQuery.of(this).size.height;
  double get width => MediaQuery.of(this).size.width;
}
