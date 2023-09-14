import 'package:flutter/material.dart';
import '../utils/app_colors.dart';
import '../utils/my_font_style.dart';

class RadiusContainer extends StatelessWidget {
  final Color? color;
  final Color? borderColor;
  final double? height;
  final double? width;
  final String value;
  final TextStyle? style;
  final double radius;
  final bool isFill;
  final EdgeInsets? padding;
  final VoidCallback? onTap;
  const RadiusContainer(
      {super.key,
      this.color,
      this.borderColor,
      this.style,
      this.radius = 10,
      required this.value,
      this.height,
      this.width,
      this.isFill = true,
      this.padding,
      this.onTap});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        padding:
            padding ?? const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
        height: height,
        width: width,
        decoration: BoxDecoration(
            color: isFill ? color ?? AppColors.white : AppColors.transparent,
            borderRadius: BorderRadius.circular(radius),
            border: borderColor != null
                ? Border.all(color: borderColor!, width: 1)
                : null),
        child: Center(
          child: Text(
            value,
            style: style ?? MyFontStyle.regular(color: AppColors.white),
          ),
        ),
      ),
    );
  }
}
