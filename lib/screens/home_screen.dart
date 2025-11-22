import 'package:flutter/material.dart';
import '../theme_provider.dart';
import '../tabs/colors_tab.dart';
import '../tabs/text_themes_tab.dart';
import '../tabs/combinations_tab.dart';

class HomeScreen extends StatelessWidget {
  final ThemeProvider themeProvider;

  const HomeScreen({super.key, required this.themeProvider});

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 3,
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: Theme.of(context).colorScheme.inversePrimary,
          title: const Text('Flutter Themeator'),
          actions: [
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
            ],
          ),
        ),
        body: const TabBarView(
          children: [
            ColorsTab(),
            TextThemesTab(),
            CombinationsTab(),
          ],
        ),
      ),
    );
  }
}
