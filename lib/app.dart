import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'theme_provider.dart';
import 'providers/color_scheme_provider.dart';
import 'screens/home_screen.dart';

const _fontFamily = 'Inter';

class ThemeatorApp extends StatelessWidget {
  const ThemeatorApp({super.key});

  @override
  Widget build(BuildContext context) {
    final themeProvider = context.watch<ThemeProvider>();
    final colorSchemeProvider = context.watch<ColorSchemeProvider>();

    return MaterialApp(
      title: 'Flutter Themeator',
      theme: ThemeData(
        colorScheme: colorSchemeProvider.lightColorScheme,
        fontFamily: _fontFamily,
      ),
      darkTheme: ThemeData(
        colorScheme: colorSchemeProvider.darkColorScheme,
        fontFamily: _fontFamily,
      ),
      themeMode: themeProvider.themeMode,
      home: const HomeScreen(),
      debugShowCheckedModeBanner: false,
    );
  }
}
