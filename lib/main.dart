import 'package:flex_color_scheme/flex_color_scheme.dart';
import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:form_builder_validators/localization/l10n.dart';

import 'package:get/get.dart';
import 'package:responsive_framework/responsive_framework.dart';
import 'package:zanpakuto_ichigo/app/common/constant.dart';
import 'package:zanpakuto_ichigo/app/modules/auth/controllers/auth_controller.dart';
import 'package:google_fonts/google_fonts.dart';

import 'app/routes/app_pages.dart';

void main() async {
  // Initialize widget
  WidgetsFlutterBinding.ensureInitialized();

  Get.testMode = true;

  runApp(
    GetMaterialApp(
      builder: (context, child) => ResponsiveWrapper.builder(
          BouncingScrollWrapper.builder(context, child!),
          maxWidth: 1200,
          minWidth: 450,
          defaultScale: true,
          breakpoints: [
            const ResponsiveBreakpoint.resize(450, name: MOBILE),
            const ResponsiveBreakpoint.autoScale(800, name: TABLET),
            const ResponsiveBreakpoint.autoScale(1000, name: TABLET),
            const ResponsiveBreakpoint.resize(1200, name: DESKTOP),
            const ResponsiveBreakpoint.autoScale(2460, name: "4K"),
          ],
          background: Container(color: const Color(0xFFF5F5F5))),
      title: "AKM Admin",
      home: const Center(
        child: CircularProgressIndicator(),
      ),
      getPages: AppPages.routes,
      theme: FlexColorScheme.light(
        scheme: FlexScheme.deepBlue,
        appBarStyle: FlexAppBarStyle.scaffoldBackground,
        fontFamily: GoogleFonts.openSans().fontFamily,
        useMaterial3: true,
      ).toTheme,
      darkTheme: FlexColorScheme.dark(
        scheme: FlexScheme.mandyRed,
        appBarStyle: FlexAppBarStyle.scaffoldBackground,
        useMaterial3: true,
        fontFamily: GoogleFonts.openSans().fontFamily,
      ).toTheme,
      themeMode: ThemeMode.system,
      localizationsDelegates: const [
        GlobalMaterialLocalizations.delegate,
        GlobalCupertinoLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
        FormBuilderLocalizations.delegate,
      ],
      supportedLocales: const [
        Locale('en'),
      ],
      locale: const Locale('en'),
    ),
  );

  await firebaseInitialization.then((value) {
    Get.put(AuthController());
  });
}
