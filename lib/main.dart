import 'package:flutter/material.dart';
import 'package:fullstackoauth/core/l10n/generated/l10n.dart';
import 'package:fullstackoauth/core/l10n/locale_provider.dart';
import 'package:fullstackoauth/core/route/app_router.dart';
import 'package:fullstackoauth/core/theme/app_theme.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(ChangeNotifierProvider(
      create: (context) => LocaleProvider(), child: const MainApp()));
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return Consumer<LocaleProvider>(builder: (context, localeProvider, child) {
      return MaterialApp.router(
        locale: localeProvider.locale,
        supportedLocales: S.delegate.supportedLocales,
        localizationsDelegates: const [
          S.delegate,
          GlobalMaterialLocalizations.delegate,
          GlobalWidgetsLocalizations.delegate,
          GlobalCupertinoLocalizations.delegate,
        ],
        routerConfig: router,
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
          colorScheme: ColorScheme.fromSeed(
            seedColor: Colors.greenAccent,
          ),
        ),
        darkTheme: AppTheme.darkTheme,
        themeMode: ThemeMode.system,
      );
    });
  }
}
