import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'theme_provider.dart';
import 'screens/home_screen.dart';

class ThemeatorApp extends StatefulWidget {
  const ThemeatorApp({super.key});

  @override
  State<ThemeatorApp> createState() => _ThemeatorAppState();
}

class _ThemeatorAppState extends State<ThemeatorApp> {
  final _themeProvider = ThemeProvider();

  @override
  Widget build(BuildContext context) {
    return ListenableBuilder(
      listenable: _themeProvider,
      builder: (context, child) {
        return MaterialApp(
          title: 'Flutter Themeator',
          theme: ThemeData(
            colorScheme: .fromSeed(seedColor: Colors.deepPurple),
            textTheme: GoogleFonts.interTextTheme(),
          ),
          darkTheme: ThemeData(
            colorScheme: .fromSeed(
              seedColor: Colors.deepPurple,
              brightness: .dark,
            ),
            textTheme: GoogleFonts.interTextTheme(ThemeData.dark().textTheme),
          ),
          themeMode: _themeProvider.themeMode,
          home: HomeScreen(themeProvider: _themeProvider),
          debugShowCheckedModeBanner: false,
        );
      },
    );
  }
}
