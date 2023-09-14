import 'package:flutter/material.dart';
import 'app_colors.dart';

class MyFontStyle {
  static const double _defaultFontSize = 15;

  static TextStyle bold(
      {double fontSize = _defaultFontSize,
      Color color = AppColors.primaryTextColor,
      bool enabledUnderline = false,
      bool enabledLineThrough = false,
      double letterSpacing = 0.0}) {
    return TextStyle(
      color: color,
      fontWeight: FontWeight.w700,
      fontSize: fontSize,
      decoration: TextDecoration.combine([
        enabledUnderline ? TextDecoration.underline : TextDecoration.none,
        enabledLineThrough ? TextDecoration.lineThrough : TextDecoration.none
      ]),
      letterSpacing: letterSpacing,
    );
  }

  static TextStyle regular(
      {double fontSize = _defaultFontSize,
      Color color = AppColors.primaryTextColor,
      bool enabledUnderline = false,
      bool enabledLineThrough = false}) {
    return TextStyle(
      color: color,
      fontWeight: FontWeight.w500,
      fontSize: fontSize,
      decoration: TextDecoration.combine([
        enabledUnderline ? TextDecoration.underline : TextDecoration.none,
        enabledLineThrough ? TextDecoration.lineThrough : TextDecoration.none
      ]),
    );
  }
}
