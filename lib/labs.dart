import 'package:flutter/material.dart';
import 'package:labs/manager/preferences/preferences.dart';
import 'package:labs/utils/labels.dart';

import 'navigation/routes.dart';

class LabsApp extends StatefulWidget {
  const LabsApp({super.key});

  @override
  State<LabsApp> createState() => _LabsAppState();
}

class _LabsAppState extends State<LabsApp> {
  @override
  void initState() {
    Preferences.init();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: Labels.appName,
      debugShowCheckedModeBanner: false,
      routes: Routes.routes,
      initialRoute: Routes.splashScreen,
    );
  }
}
