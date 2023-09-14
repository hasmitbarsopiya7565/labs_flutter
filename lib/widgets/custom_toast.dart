import 'dart:async';
import 'package:flutter/material.dart';
import 'package:labs/extensions/common_extensions.dart';

import '../utils/app_colors.dart';
import '../utils/my_font_style.dart';

class CustomToast extends StatelessWidget {
  const CustomToast(
      {super.key,
      required this.toastMessage,
      this.toastBackgroundColor,
      this.toastTextStyle,
      required this.textOverFlow,
      this.isLocaleText = false,
      required this.toastType});

  final String toastMessage;
  final Color? toastBackgroundColor;
  final String toastType;
  final TextStyle? toastTextStyle;
  final bool isLocaleText;
  final TextOverflow textOverFlow;
  static OverlayEntry? overlayEntry;
  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.topCenter,
      child: Container(
        margin: const EdgeInsets.only(top: 50),
        width: MediaQuery.of(context).size.width - 50,
        clipBehavior: Clip.hardEdge,
        decoration: ShapeDecoration(
          color: Colors.white,
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
          shadows: [
            BoxShadow(
                color: AppColors.black.withOpacity(0.1),
                spreadRadius: 0.5,
                blurRadius: 5,
                offset: const Offset(2, 0))
          ],
        ),
        child: Container(
          margin:
              const EdgeInsets.only(top: 10, bottom: 10, left: 13, right: 5),
          padding: const EdgeInsets.only(left: 3),
          width: MediaQuery.of(context).size.width - 50,
          color: getToastColor(toastType: toastType),
          child: Container(
            padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 10),
            color: AppColors.white,
            child: Row(children: [
              15.width,
              Expanded(
                child: Text(
                  toastMessage,
                  style: toastTextStyle ??
                      MyFontStyle.regular(color: AppColors.black, fontSize: 14),
                  overflow: textOverFlow,
                ),
              ),
              GestureDetector(
                  onTap: () => overlayEntry?.remove(),
                  child: const Icon(
                    Icons.close,
                    color: AppColors.gray,
                  )),
            ]),
          ),
        ),
      ),
    );
  }

  static void showToast(
      {required BuildContext context,
      required String message,
      required String toastType,
      Color? backgroundColor,
      TextStyle? textStyle,
      TextOverflow textOverFlow = TextOverflow.clip,
      bool isLocaleText = false}) {
    if (overlayEntry?.mounted ?? false) {
      overlayEntry?.remove();
    }

    overlayEntry = OverlayEntry(
        builder: (context) => CustomToast(
              toastMessage: message,
              toastBackgroundColor: backgroundColor,
              toastType: toastType,
              toastTextStyle: textStyle,
              textOverFlow: textOverFlow,
              isLocaleText: isLocaleText,
            ));
    if (overlayEntry != null) {
      Overlay.of(context).insert(overlayEntry!);
    }
    Timer(const Duration(milliseconds: 5000), () {
      if (overlayEntry != null) {
        overlayEntry?.remove();
      }
    });
  }
}

Color getToastColor({required String toastType}) {
  switch (toastType) {
    case ToastTypes.error:
      return AppColors.error;
    case ToastTypes.success:
      return AppColors.success;
    case ToastTypes.warning:
      return AppColors.warning;
    default:
      return AppColors.black;
  }
}

class ToastTypes {
  static const error = "error";
  static const success = "success";
  static const warning = "warning";
}
