import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'theme_provider.dart';
import 'providers/color_scheme_provider.dart';
import 'screens/home_screen.dart';

const _interTextTheme = TextTheme(
  displayLarge: TextStyle(fontFamily: 'Inter'),
  displayMedium: TextStyle(fontFamily: 'Inter'),
  displaySmall: TextStyle(fontFamily: 'Inter'),
  headlineLarge: TextStyle(fontFamily: 'Inter'),
  headlineMedium: TextStyle(fontFamily: 'Inter'),
  headlineSmall: TextStyle(fontFamily: 'Inter'),
  titleLarge: TextStyle(fontFamily: 'Inter'),
  titleMedium: TextStyle(fontFamily: 'Inter'),
  titleSmall: TextStyle(fontFamily: 'Inter'),
  bodyLarge: TextStyle(fontFamily: 'Inter'),
  bodyMedium: TextStyle(fontFamily: 'Inter'),
  bodySmall: TextStyle(fontFamily: 'Inter'),
  labelLarge: TextStyle(fontFamily: 'Inter'),
  labelMedium: TextStyle(fontFamily: 'Inter'),
  labelSmall: TextStyle(fontFamily: 'Inter'),
);

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
        textTheme: _interTextTheme,
      ),
      darkTheme: ThemeData(
        colorScheme: colorSchemeProvider.darkColorScheme,
        textTheme: _interTextTheme,
      ),
      themeMode: themeProvider.themeMode,
      home: const HomeScreen(),
      debugShowCheckedModeBanner: false,
    );
  }
}
