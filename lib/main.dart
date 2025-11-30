import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'app.dart';
import 'services/color_storage.dart';
import 'providers/color_scheme_provider.dart';
import 'theme_provider.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  final colorStorage = await ColorStorage.init();
  final colorSchemeProvider = ColorSchemeProvider(colorStorage);

  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => ThemeProvider()),
        ChangeNotifierProvider.value(value: colorSchemeProvider),
      ],
      child: const ThemeatorApp(),
    ),
  );
}
