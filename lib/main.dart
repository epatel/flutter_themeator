import 'package:flutter/material.dart';
import 'app.dart';
import 'services/color_storage.dart';
import 'providers/color_scheme_provider.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  final colorStorage = await ColorStorage.init();
  final colorSchemeProvider = ColorSchemeProvider(colorStorage);

  runApp(ThemeatorApp(colorSchemeProvider: colorSchemeProvider));
}
