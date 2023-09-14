import 'package:flutter/material.dart';
import 'package:labs/screens/login_screen.dart';
import 'package:labs/screens/serviceDetails/service_details.dart';

import '../screens/service/service_screen.dart';
import '../screens/splash_screen.dart';

class Routes {
  static const splashScreen = "/";
  static const loginScreen = "/loginScreen";
  static const serviceScreen = "/serviceScreen";
  static const serviceDetailsScreen = "/serviceDetailsScreen";

  static Map<String, Widget Function(BuildContext context)> routes = {
    splashScreen: (context) => const SplashScreen(),
    loginScreen: (context) => const LoginScreen(),
    serviceScreen: (context) => const ServiceScreen(),
    serviceDetailsScreen: (context) => const ServiceDetailsScreen(),
  };
}
