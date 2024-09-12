import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'common/app_routes.dart';
import 'common/app_themes.dart';
import 'core/provider/locale_provider.dart';
import 'core/provider/theme_provider.dart';
import 'generated/l10n.dart';

class MyApp extends ConsumerWidget {
  @override
  Widget build(final BuildContext context, final WidgetRef ref) {
    final themeData = ref.watch(themeNotifierProvider);
    final locale = ref.watch(localeNotifierProvider);
    // final introScreen = ref.watch(introSeenProvider);

    return MaterialApp.router(
      title: 'Template App',
      darkTheme: AppThemes.darkTheme,
      themeMode: ThemeMode.light,
      theme: themeData,
      locale: locale,
      debugShowCheckedModeBanner: false,
      showPerformanceOverlay: false,
      showSemanticsDebugger: false,
      debugShowMaterialGrid: false,
      restorationScopeId: 'template_app',
      localizationsDelegates: [
        S.delegate,
        GlobalMaterialLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
        GlobalCupertinoLocalizations.delegate,
      ],
      supportedLocales: S.delegate.supportedLocales,
      onGenerateTitle: (final context) => S.of(context).appTitle,
      routerConfig: AppRoutes().router,
    );
  }
}
