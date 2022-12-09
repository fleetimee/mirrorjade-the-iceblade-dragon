import 'package:firebase_core/firebase_core.dart';
import 'package:flex_color_scheme/flex_color_scheme.dart';
import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:form_builder_validators/localization/l10n.dart';

import 'package:get/get.dart';
import 'package:zanpakuto_ichigo/firebase_options.dart';
import 'package:google_fonts/google_fonts.dart';

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
        appBarStyle: FlexAppBarStyle.primary,
        fontFamily: GoogleFonts.openSans().fontFamily,
      ).toTheme,
      darkTheme: FlexColorScheme.dark(
        scheme: FlexScheme.deepBlue,
        appBarStyle: FlexAppBarStyle.scaffoldBackground,
        useMaterial3: true,
        fontFamily: GoogleFonts.openSans().fontFamily,
      ).toTheme,
      themeMode: ThemeMode.light,
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
}
