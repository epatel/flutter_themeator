import 'package:flutter/material.dart';
import '../theme_provider.dart';
import '../providers/color_scheme_provider.dart';
import '../tabs/colors_tab.dart';
import '../tabs/text_themes_tab.dart';
import '../tabs/combinations_tab.dart';
import '../tabs/widgets_tab.dart';

class HomeScreen extends StatelessWidget {
  final ThemeProvider themeProvider;
  final ColorSchemeProvider colorSchemeProvider;

  const HomeScreen({
    super.key,
    required this.themeProvider,
    required this.colorSchemeProvider,
  });

  @override
  Widget build(BuildContext context) {
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
        body: TabBarView(
          children: [
            ColorsTab(colorSchemeProvider: colorSchemeProvider),
            const TextThemesTab(),
            const CombinationsTab(),
            const WidgetsTab(),
          ],
        ),
      ),
    );
  }
}
