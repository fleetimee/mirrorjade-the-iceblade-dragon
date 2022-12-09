import 'package:firebase_core/firebase_core.dart';
import 'package:flex_color_scheme/flex_color_scheme.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:zanpakuto_ichigo/firebase_options.dart';

import 'app/routes/app_pages.dart';

void main() async {
  // Initialize widget
  WidgetsFlutterBinding.ensureInitialized();

  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );

  runApp(
    GetMaterialApp(
      title: "AKM Admin",
      initialRoute: AppPages.INITIAL,
      getPages: AppPages.routes,
      theme: FlexColorScheme.light(
        scheme: FlexScheme.deepBlue,
        appBarStyle: FlexAppBarStyle.scaffoldBackground,
      ).toTheme,
      darkTheme: FlexColorScheme.dark(
        scheme: FlexScheme.deepBlue,
        appBarStyle: FlexAppBarStyle.scaffoldBackground,
      ).toTheme,
    ),
  );
}
