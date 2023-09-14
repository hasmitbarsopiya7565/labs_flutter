// ignore_for_file: must_be_immutable

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import '../utils/app_colors.dart';
import '../utils/common.dart';
import '../utils/my_font_style.dart';

typedef CallbackonChanged = void Function(String val);

class ThemeTextField extends StatefulWidget {
  ThemeTextField(
      {Key? key,
      required this.controller,
      required this.hint,
      this.maxLines = 1,
      this.prefixIcon,
      this.suffixIcon,
      this.inputType = TextInputType.text,
      this.enabled = true,
      this.readOnly = false,
      this.ontap,
      this.onChanged,
      this.inputLengthLimit = 50,
      this.height,
      this.textAlign = TextAlign.start,
      this.textAlignVertical = TextAlignVertical.center,
      this.isBorder = true,
      this.textStyle,
      this.isPassword = false,
      this.hintStyle,
      this.fillColor,
      this.isUnderline = false,
      this.validator,
      this.focusNode,
      this.onFieldSubmitted,
      this.borderColor,
      this.contentPadding,
      this.enabledBorder,
      this.focusedBorder,
      this.inputFormatters})
      : super(key: key);
  final TextEditingController controller;
  final Widget? prefixIcon;
  final Widget? suffixIcon;
  final String hint;
  final TextStyle? textStyle;
  final TextStyle? hintStyle;
  final TextInputType inputType;
  final int? maxLines;
  final bool readOnly;
  final bool enabled;
  final bool isBorder;
  final VoidCallback? ontap;
  final CallbackonChanged? onChanged;
  final int inputLengthLimit;
  final TextAlign textAlign;
  final TextAlignVertical textAlignVertical;
  final bool isPassword;
  final Color? fillColor;
  final Color? borderColor;
  final bool isUnderline;
  final FormFieldValidator? validator;
  final FocusNode? focusNode;
  final ValueChanged<String>? onFieldSubmitted;
  final EdgeInsetsGeometry? contentPadding;
  final InputBorder? enabledBorder;
  final InputBorder? focusedBorder;
  final List<TextInputFormatter>? inputFormatters;
  double? height = 17;
  @override
  State<ThemeTextField> createState() => _ThemeTextFieldState();
}

class _ThemeTextFieldState extends State<ThemeTextField> {
  @override
  Widget build(BuildContext context) {
    return TextFormField(
      focusNode: widget.focusNode,
      autovalidateMode: AutovalidateMode.onUserInteraction,
      obscureText: widget.isPassword,
      textAlign: widget.textAlign,
      textAlignVertical: widget.textAlignVertical,
      maxLines: widget.maxLines,
      controller: widget.controller,
      cursorColor: AppColors.primaryColor,
      cursorWidth: 2,
      keyboardType: widget.inputType,
      enabled: widget.enabled,
      readOnly: widget.readOnly,
      onTap: () {
        if (widget.ontap != null) {
          widget.ontap!.call();
        }
      },
      inputFormatters: widget.inputFormatters ??
          [
            LengthLimitingTextInputFormatter(widget.inputLengthLimit),
          ],
      style: widget.textStyle ??
          MyFontStyle.regular(fontSize: 14, color: AppColors.primaryColor),
      decoration: InputDecoration(
        hintText: widget.hint,
        hintStyle: widget.hintStyle ??
            MyFontStyle.bold(
                color: AppColors.primaryHintTextColor, fontSize: 14),
        prefixIcon: widget.prefixIcon,
        border: widget.isBorder == true ? textFieldBorder() : textFieldRadius(),
        filled: true,
        fillColor: widget.fillColor ?? Colors.transparent,
        enabledBorder: widget.enabledBorder ??
            (widget.isBorder == true
                ? !widget.isUnderline
                    ? textFieldBorder(
                        color:
                            widget.borderColor ?? AppColors.primaryBorderColor)
                    : textFieldUnderLine()
                : textFieldRadius()),
        focusedBorder: widget.focusedBorder ??
            (widget.isBorder == true
                ? !widget.isUnderline
                    ? textFieldBorder()
                    : textFieldUnderLine()
                : textFieldRadius()),
        contentPadding: widget.contentPadding ??
            (widget.isBorder == true
                ? const EdgeInsets.all(10)
                : const EdgeInsets.all(15)),
        suffixIcon: widget.suffixIcon,
      ),
      onChanged: (value) {
        if (widget.onChanged != null) {
          widget.onChanged!.call(value);
        }
      },
      validator: widget.validator,
      onFieldSubmitted: (value) => widget.onFieldSubmitted?.call(value),
    );
  }
}
