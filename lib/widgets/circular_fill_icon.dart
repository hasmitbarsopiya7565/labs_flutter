import 'package:flutter/material.dart';
import '../utils/app_colors.dart';

class CircularFillIcon extends StatelessWidget {
  final Color? backgroundColor;
  final Color? svgIconColor;
  final double height;
  final double width;
  final EdgeInsets? padding;
  final List<BoxShadow>? boxShadow;
  final bool isShowShadow;
  final VoidCallback? onTap;
  final Widget child;
  const CircularFillIcon({
    super.key,
    required this.height,
    required this.width,
    this.svgIconColor,
    this.backgroundColor,
    this.padding,
    this.boxShadow,
    this.isShowShadow = true,
    this.onTap,
    required this.child,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
          height: height,
          width: width,
          padding: padding ?? const EdgeInsets.all(5),
          decoration: BoxDecoration(
              shape: BoxShape.circle,
              color: backgroundColor ?? AppColors.white,
              boxShadow: isShowShadow
                  ? boxShadow ??
                      [
                        BoxShadow(
                          color: AppColors.primaryColor.withOpacity(0.2),
                          spreadRadius: 2,
                          blurRadius: 5,
                          offset:
                              const Offset(0, 3), // changes position of shadow
                        ),
                      ]
                  : null),
          child: child),
    );
  }
}
