// ignore_for_file: deprecated_member_use

import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

import 'app_colors.dart';

void removeFocus(BuildContext context) {
  FocusScope.of(context).unfocus();
}

void setFocus(BuildContext context, FocusNode node) {
  FocusScope.of(context).requestFocus(node);
}

OutlineInputBorder textFieldBorder(
    {Color color = AppColors.primaryBorderColor,
    double width = 1.0,
    double radius = 10}) {
  return OutlineInputBorder(
    borderSide: BorderSide(color: color, width: width),
    borderRadius: BorderRadius.all(Radius.circular(radius)),
  );
}

OutlineInputBorder textFieldRadius({double radius = 10}) {
  return OutlineInputBorder(
    borderSide: BorderSide.none,
    borderRadius: BorderRadius.all(Radius.circular(radius)),
  );
}

UnderlineInputBorder textFieldUnderLine({
  Color color = AppColors.primaryColor,
  double width = 1.0,
}) {
  return UnderlineInputBorder(
    borderSide: BorderSide(color: color, width: width),
  );
}

bool isValidEmail(String email) {
  return RegExp(
          r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+")
      .hasMatch(email);
}

String formatDate(String date,
    {String inputFormat = "yyyy-MM-dd'T'HH:mm:ss.SSS'Z'",
    String outputFormat = 'dd-MM-yyyy'}) {
  return DateFormat(outputFormat).format(DateFormat(inputFormat).parse(date));
}

String getDayOfMonthSuffix(int dayNum) {
  if (!(dayNum >= 1 && dayNum <= 31)) {
    throw Exception('Invalid day of month');
  }

  if (dayNum >= 11 && dayNum <= 13) {
    return 'th';
  }

  switch (dayNum % 10) {
    case 1:
      return 'st';
    case 2:
      return 'nd';
    case 3:
      return 'rd';
    default:
      return 'th';
  }
}

String getDeviceType() {
  final data = MediaQueryData.fromView(WidgetsBinding.instance.window);
  return data.size.shortestSide < 600 ? 'phone' : 'tablet';
}
