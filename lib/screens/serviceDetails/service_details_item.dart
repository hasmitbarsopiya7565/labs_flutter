import 'package:flutter/material.dart';
import 'package:labs/extensions/common_extensions.dart';
import 'package:labs/widgets/theme_textfield.dart';
import '../../utils/app_colors.dart';
import '../../utils/my_font_style.dart';

class ServiceDetailsItem extends StatelessWidget {
  final String label;
  final String? value;
  final String hint;
  final Color color;
  final TextEditingController controller = TextEditingController();
  final CallbackonChanged? onChanged;
  final TextInputType? inputType;
  ServiceDetailsItem({
    super.key,
    required this.label,
    this.value,
    required this.color,
    required this.hint,
    this.onChanged,
    this.inputType,
  });

  @override
  Widget build(BuildContext context) {
    if (value != null || value?.isNotEmpty == true) {
      controller.text = value ?? "";
    }
    return Row(
      children: [
        Text(
          label,
          style: MyFontStyle.regular(fontSize: 14),
        ),
        10.width,
        Container(
          decoration: BoxDecoration(
              border: Border.all(color: AppColors.gray, width: 2),
              borderRadius: BorderRadius.circular(10)),
          child: Row(
            children: [
              IntrinsicWidth(
                child: ThemeTextField(
                  inputType: inputType ?? TextInputType.number,
                  onChanged: (value) {
                    if (onChanged != null) {
                      onChanged!.call(value);
                    }
                  },
                  contentPadding: const EdgeInsets.symmetric(horizontal: 10),
                  textAlign: TextAlign.end,
                  controller: controller,
                  hint: '',
                  isBorder: false,
                  fillColor: AppColors.transparent,
                ),
              ),
              if (hint.isNotEmpty)
                Text(
                  hint,
                  style: MyFontStyle.regular(fontSize: 14),
                ),
              if (hint.isNotEmpty) 10.width,
            ],
          ),
        ),
      ],
    );
  }
}
