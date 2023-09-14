import 'package:flutter/material.dart';

import '../utils/app_colors.dart';

class Loading {
  static Loading? _loading;
  static BuildContext? _context;

  static bool showSkeleton() {
    return true;
  }

  static bool hideSkeleton() {
    return false;
  }

  static void show(BuildContext context) {
    _loading ??= Loading();
    _context = context;

    showDialog(
      context: _context!,
      barrierDismissible: false,
      barrierColor: Colors.black26,
      builder: (BuildContext context) {
        return const Center(
          child: CircularProgressIndicator(color: AppColors.primaryColor),
        );
      },
    );
  }

  static void hide() {
    _loading ??= Loading();
    if (_context == null) return;
    Navigator.pop(_context!);
    _context = null;
  }
}
