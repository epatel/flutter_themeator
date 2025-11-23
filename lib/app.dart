import 'package:flutter/material.dart';
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

class ThemeatorApp extends StatefulWidget {
  final ColorSchemeProvider colorSchemeProvider;

  const ThemeatorApp({super.key, required this.colorSchemeProvider});

  @override
  State<ThemeatorApp> createState() => _ThemeatorAppState();
}

class _ThemeatorAppState extends State<ThemeatorApp> {
  final _themeProvider = ThemeProvider();

  @override
  Widget build(BuildContext context) {
    return ListenableBuilder(
      listenable: Listenable.merge([
        _themeProvider,
        widget.colorSchemeProvider,
      ]),
      builder: (context, child) {
        return MaterialApp(
          title: 'Flutter Themeator',
          theme: ThemeData(
            colorScheme: widget.colorSchemeProvider.lightColorScheme,
            textTheme: _interTextTheme,
          ),
          darkTheme: ThemeData(
            colorScheme: widget.colorSchemeProvider.darkColorScheme,
            textTheme: _interTextTheme,
          ),
          themeMode: _themeProvider.themeMode,
          home: HomeScreen(
            themeProvider: _themeProvider,
            colorSchemeProvider: widget.colorSchemeProvider,
          ),
          debugShowCheckedModeBanner: false,
        );
      },
    );
  }
}
