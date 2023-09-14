import 'package:flutter/material.dart';

import '../utils/app_colors.dart';

class ThemeButton extends StatelessWidget {
  const ThemeButton({
    Key? key,
    required this.height,
    required this.onClick,
    required this.radius,
    this.width,
    this.text,
    this.textStyle,
    this.color = AppColors.primaryColor,
    this.borderColor,
    this.widget,
  }) : super(key: key);
  final String? text;
  final VoidCallback onClick;
  final TextStyle? textStyle;
  final double? radius;
  final Color color;
  final Color? borderColor;
  final Widget? widget;
  final double? height;
  final double? width;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: width,
      height: height,
      child: ElevatedButton(
        onPressed: () => onClick(),
        style: ButtonStyle(
          elevation: MaterialStateProperty.all<double>(0),
          backgroundColor: MaterialStateProperty.all(
              borderColor == null ? color : AppColors.transparent),
          shape: MaterialStateProperty.all(
            RoundedRectangleBorder(
              side: borderColor == null
                  ? BorderSide.none
                  : BorderSide(
                      width: 1,
                      color: borderColor!,
                    ),
              borderRadius: BorderRadius.all(
                Radius.circular(radius ?? 15),
              ),
            ),
          ),
        ),
        child: widget ??
            Text(
              text ?? "",
              style: textStyle,
            ),
      ),
    );
  }
}
