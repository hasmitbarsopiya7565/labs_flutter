import 'package:flutter/material.dart';
import 'package:labs/extensions/common_extensions.dart';
import '../utils/app_colors.dart';
import '../utils/my_font_style.dart';

class IconWithText extends StatelessWidget {
  final Icon icon;
  final double? svgHeight;
  final double? svgWidth;
  final String value;
  final String? lable;
  final TextStyle? textStyle;
  final TextStyle? labelStyle;
  final bool isExpanded;
  final MainAxisAlignment? mainAxisAlignment;
  const IconWithText({
    super.key,
    required this.icon,
    required this.value,
    this.lable,
    this.svgHeight,
    this.svgWidth,
    this.textStyle,
    this.isExpanded = true,
    this.mainAxisAlignment,
    this.labelStyle,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: mainAxisAlignment ?? MainAxisAlignment.center,
      // mainAxisSize: MainAxisSize.min,
      children: [
        icon,
        4.width,
        isExpanded
            ? Flexible(
                child: RichText(
                    softWrap: false,
                    overflow: TextOverflow.ellipsis,
                    text: TextSpan(
                        text: value,
                        style: textStyle ??
                            MyFontStyle.bold(
                                fontSize: 15,
                                color: AppColors.secondaryTextColor),
                        children: [
                          TextSpan(
                              text: lable,
                              style: labelStyle ??
                                  MyFontStyle.bold(
                                      fontSize: 11,
                                      color: AppColors.secondaryTextColor)),
                        ])),
              )
            : RichText(
                softWrap: false,
                overflow: TextOverflow.ellipsis,
                text: TextSpan(
                    text: value,
                    style: textStyle ??
                        MyFontStyle.bold(
                            fontSize: 15, color: AppColors.secondaryTextColor),
                    children: [
                      TextSpan(
                          text: lable,
                          style: labelStyle ??
                              MyFontStyle.bold(
                                  fontSize: 11,
                                  color: AppColors.secondaryTextColor)),
                    ])),
      ],
    );
  }
}
