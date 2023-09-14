import 'package:flutter/material.dart';

extension WidgetExtension on Widget {
  Widget expand({int flex = 1}) => Expanded(flex: flex, child: this);
  Widget get left => Container(alignment: Alignment.centerLeft, child: this);
  Widget get right => Container(alignment: Alignment.bottomRight, child: this);
}

extension IntExtension on double {
  Widget get height => SizedBox(height: this);
  Widget get width => SizedBox(width: this);
}

extension DoubleExtension on int {
  Widget get height => SizedBox(height: toDouble());
  Widget get width => SizedBox(width: toDouble());
}

extension StringExtensions on String {
  String capitalize() {
    return "${this[0].toUpperCase()}${substring(1)}";
  }

  String captilzeString() {
    return split(' ').map((word) => word.capitalize()).join(' ');
  }
}
