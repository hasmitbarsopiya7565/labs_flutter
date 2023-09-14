import 'package:flutter/material.dart';

class Seperator extends StatelessWidget {
  final double height;
  final double width;
  final Color color;
  const Seperator({
    super.key,
    required this.height,
    required this.width,
    required this.color,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      height: height,
      width: width,
      color: color,
    );
  }
}
