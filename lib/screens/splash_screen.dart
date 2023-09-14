import 'package:flutter/material.dart';

import '../navigation/routes.dart';
import '../utils/app_colors.dart';
import '../utils/labels.dart';
import '../utils/my_font_style.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    WidgetsFlutterBinding.ensureInitialized().addPostFrameCallback((timeStamp) {
      Future.delayed(const Duration(seconds: 2)).then((value) {
        Navigator.pushReplacementNamed(context, Routes.loginScreen);
      });
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
            body: Center(
      child: Text(
        Labels.appName.toUpperCase(),
        style: MyFontStyle.bold(color: AppColors.primaryColor, fontSize: 50),
      ),
    )));
  }
}
