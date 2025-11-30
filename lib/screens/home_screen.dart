import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:provider/provider.dart';
import '../theme_provider.dart';
import '../providers/color_scheme_provider.dart';
import '../services/theme_exporter.dart';
import '../tabs/colors_tab.dart';
import '../tabs/text_themes_tab.dart';
import '../tabs/combinations_tab.dart';
import '../tabs/widgets_tab.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  Future<void> _exportTheme(
    BuildContext context,
    ColorSchemeProvider colorSchemeProvider,
  ) async {
    final dartCode = ThemeExporter.generateDartFile(
      colorSchemeProvider.lightColorScheme,
      colorSchemeProvider.darkColorScheme,
    );

    // Copy to clipboard (works on all platforms including web)
    await Clipboard.setData(ClipboardData(text: dartCode));
    if (context.mounted) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Theme copied to clipboard')),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    final themeProvider = context.watch<ThemeProvider>();
    final colorSchemeProvider = context.read<ColorSchemeProvider>();

    return DefaultTabController(
      length: 4,
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: Theme.of(context).colorScheme.inversePrimary,
          title: const Text('Flutter Themeator'),
          actions: [
            IconButton(
              icon: const Icon(Icons.refresh),
              onPressed: colorSchemeProvider.resetToDefault,
              tooltip: 'Reset colors to default',
            ),
            IconButton(
              icon: const Icon(Icons.download),
              onPressed: () => _exportTheme(context, colorSchemeProvider),
              tooltip: 'Export theme as Dart file',
            ),
            IconButton(
              icon: Icon(
                themeProvider.themeMode == .dark
                    ? Icons.light_mode
                    : Icons.dark_mode,
              ),
              onPressed: themeProvider.toggleTheme,
              tooltip: 'Toggle theme',
            ),
          ],
          bottom: const TabBar(
            tabs: [
              Tab(icon: Icon(Icons.palette), text: 'Colors'),
              Tab(icon: Icon(Icons.text_fields), text: 'Text'),
              Tab(icon: Icon(Icons.layers), text: 'Combos'),
              Tab(icon: Icon(Icons.widgets), text: 'Widgets'),
            ],
          ),
        ),
        body: const TabBarView(
          children: [
            ColorsTab(),
            TextThemesTab(),
            CombinationsTab(),
            WidgetsTab(),
          ],
        ),
      ),
    );
  }
}
