// ignore_for_file: prefer_const_constructors_in_immutables

import 'package:ecom/core/providers/app_language_provider.dart';
import 'package:ecom/core/providers/app_theme_provider.dart';
import 'package:ecom/core/utlis/app_theme.dart';
import 'package:ecom/features/addevent/add_event.dart';
import 'package:ecom/features/home/home_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(MultiProvider(
    providers: [
      ChangeNotifierProvider(
        create: (context) => AppLanguageProvider(),
      ),
      ChangeNotifierProvider(
        create: (context) => AppThemeProvider(),
      )
    ],
    child: MainApp(),
  ));
}

class MainApp extends StatelessWidget {
  MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    var languageprovider = Provider.of<AppLanguageProvider>(context);
    var themeprovider = Provider.of<AppThemeProvider>(context);
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      themeMode: themeprovider.AppTheme,
      theme: AppTheme.lightTheme,
      darkTheme: AppTheme.darkTheme,
      localizationsDelegates: AppLocalizations.localizationsDelegates,
      supportedLocales: AppLocalizations.supportedLocales,
      locale: Locale(languageprovider.appLanguage),
      initialRoute: '/',
      routes: {
        '/': (context) => HomePage(),
        '/add_event': (context) => AddEvent(),
      },
    );
  }
}
