import 'dart:io';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:flutter_themeator/services/color_storage.dart';
import 'package:flutter_themeator/providers/color_scheme_provider.dart';
import 'package:flutter_themeator/widgets/surface.dart';
import 'package:flutter_themeator/tabs/colors_tab.dart';
import 'package:flutter_themeator/tabs/text_themes_tab.dart';
import 'package:flutter_themeator/tabs/combinations_tab.dart';
import 'package:flutter_themeator/tabs/widgets_tab.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';

Future<ColorSchemeProvider> createTestProvider() async {
  SharedPreferences.setMockInitialValues({});
  final prefs = await SharedPreferences.getInstance();
  final colorStorage = ColorStorage(prefs);
  return ColorSchemeProvider(colorStorage);
}

Future<void> loadFont(String fontFamily, String path) async {
  final fontData = File(path).readAsBytesSync();
  final fontLoader = FontLoader(fontFamily)
    ..addFont(Future.value(ByteData.view(fontData.buffer)));
  await fontLoader.load();
}

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

void main() {
  setUpAll(() async {
    TestWidgetsFlutterBinding.ensureInitialized();
    await loadFont('Inter', 'assets/fonts/Inter-Regular.ttf');
  });

  group('Golden Tests - Light Theme', () {
    testWidgets('Colors tab', (tester) async {
      final provider = await createTestProvider();

      await tester.pumpWidget(
        ChangeNotifierProvider.value(
          value: provider,
          child: MaterialApp(
            theme: ThemeData(
              colorScheme: provider.lightColorScheme,
              textTheme: _interTextTheme,
            ),
            home: const Scaffold(
              body: ColorsTab(),
            ),
          ),
        ),
      );
      await tester.pumpAndSettle();

      await expectLater(
        find.byType(ColorsTab),
        matchesGoldenFile('goldens/colors_tab_light.png'),
      );
    });

    testWidgets('Text themes tab', (tester) async {
      await tester.pumpWidget(
        MaterialApp(
          theme: ThemeData(
            colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
            textTheme: _interTextTheme,
          ),
          home: const Scaffold(
            body: TextThemesTab(),
          ),
        ),
      );
      await tester.pumpAndSettle();

      await expectLater(
        find.byType(TextThemesTab),
        matchesGoldenFile('goldens/text_themes_tab_light.png'),
      );
    });

    testWidgets('Combinations tab', (tester) async {
      await tester.pumpWidget(
        MaterialApp(
          theme: ThemeData(
            colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
            textTheme: _interTextTheme,
          ),
          home: const Scaffold(
            body: CombinationsTab(),
          ),
        ),
      );
      await tester.pumpAndSettle();

      await expectLater(
        find.byType(CombinationsTab),
        matchesGoldenFile('goldens/combinations_tab_light.png'),
      );
    });

    testWidgets('Widgets tab', (tester) async {
      await tester.pumpWidget(
        MaterialApp(
          theme: ThemeData(
            colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
            textTheme: _interTextTheme,
          ),
          home: const Scaffold(
            body: WidgetsTab(),
          ),
        ),
      );
      await tester.pumpAndSettle();

      await expectLater(
        find.byType(WidgetsTab),
        matchesGoldenFile('goldens/widgets_tab_light.png'),
      );
    });
  });

  group('Golden Tests - Dark Theme', () {
    testWidgets('Colors tab dark', (tester) async {
      final provider = await createTestProvider();

      await tester.pumpWidget(
        ChangeNotifierProvider.value(
          value: provider,
          child: MaterialApp(
            theme: ThemeData(
              colorScheme: provider.darkColorScheme,
              textTheme: _interTextTheme,
            ),
            home: const Scaffold(
              body: ColorsTab(),
            ),
          ),
        ),
      );
      await tester.pumpAndSettle();

      await expectLater(
        find.byType(ColorsTab),
        matchesGoldenFile('goldens/colors_tab_dark.png'),
      );
    });

    testWidgets('Text themes tab dark', (tester) async {
      await tester.pumpWidget(
        MaterialApp(
          theme: ThemeData(
            colorScheme: ColorScheme.fromSeed(
              seedColor: Colors.deepPurple,
              brightness: Brightness.dark,
            ),
            textTheme: _interTextTheme,
          ),
          home: const Scaffold(
            body: TextThemesTab(),
          ),
        ),
      );
      await tester.pumpAndSettle();

      await expectLater(
        find.byType(TextThemesTab),
        matchesGoldenFile('goldens/text_themes_tab_dark.png'),
      );
    });
  });

  group('Golden Tests - Surface Widget Variants', () {
    testWidgets('All Surface variants', (tester) async {
      await tester.pumpWidget(
        MaterialApp(
          theme: ThemeData(
            colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
            textTheme: _interTextTheme,
          ),
          home: Scaffold(
            body: SingleChildScrollView(
              padding: const EdgeInsets.all(16),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  Surface.primary(
                    padding: const EdgeInsets.all(16),
                    borderRadius: BorderRadius.circular(8),
                    child: const Text('Primary'),
                  ),
                  const SizedBox(height: 8),
                  Surface.primaryContainer(
                    padding: const EdgeInsets.all(16),
                    borderRadius: BorderRadius.circular(8),
                    child: const Text('Primary Container'),
                  ),
                  const SizedBox(height: 8),
                  Surface.secondary(
                    padding: const EdgeInsets.all(16),
                    borderRadius: BorderRadius.circular(8),
                    child: const Text('Secondary'),
                  ),
                  const SizedBox(height: 8),
                  Surface.secondaryContainer(
                    padding: const EdgeInsets.all(16),
                    borderRadius: BorderRadius.circular(8),
                    child: const Text('Secondary Container'),
                  ),
                  const SizedBox(height: 8),
                  Surface.tertiary(
                    padding: const EdgeInsets.all(16),
                    borderRadius: BorderRadius.circular(8),
                    child: const Text('Tertiary'),
                  ),
                  const SizedBox(height: 8),
                  Surface.tertiaryContainer(
                    padding: const EdgeInsets.all(16),
                    borderRadius: BorderRadius.circular(8),
                    child: const Text('Tertiary Container'),
                  ),
                  const SizedBox(height: 8),
                  Surface.error(
                    padding: const EdgeInsets.all(16),
                    borderRadius: BorderRadius.circular(8),
                    child: const Text('Error'),
                  ),
                  const SizedBox(height: 8),
                  Surface.errorContainer(
                    padding: const EdgeInsets.all(16),
                    borderRadius: BorderRadius.circular(8),
                    child: const Text('Error Container'),
                  ),
                ],
              ),
            ),
          ),
        ),
      );
      await tester.pumpAndSettle();

      await expectLater(
        find.byType(Scaffold),
        matchesGoldenFile('goldens/surface_variants_light.png'),
      );
    });

    testWidgets('Surface variants dark theme', (tester) async {
      await tester.pumpWidget(
        MaterialApp(
          theme: ThemeData(
            colorScheme: ColorScheme.fromSeed(
              seedColor: Colors.deepPurple,
              brightness: Brightness.dark,
            ),
            textTheme: _interTextTheme,
          ),
          home: Scaffold(
            body: SingleChildScrollView(
              padding: const EdgeInsets.all(16),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  Surface.primary(
                    padding: const EdgeInsets.all(16),
                    borderRadius: BorderRadius.circular(8),
                    child: const Text('Primary'),
                  ),
                  const SizedBox(height: 8),
                  Surface.primaryContainer(
                    padding: const EdgeInsets.all(16),
                    borderRadius: BorderRadius.circular(8),
                    child: const Text('Primary Container'),
                  ),
                  const SizedBox(height: 8),
                  Surface.secondary(
                    padding: const EdgeInsets.all(16),
                    borderRadius: BorderRadius.circular(8),
                    child: const Text('Secondary'),
                  ),
                  const SizedBox(height: 8),
                  Surface.secondaryContainer(
                    padding: const EdgeInsets.all(16),
                    borderRadius: BorderRadius.circular(8),
                    child: const Text('Secondary Container'),
                  ),
                  const SizedBox(height: 8),
                  Surface.tertiary(
                    padding: const EdgeInsets.all(16),
                    borderRadius: BorderRadius.circular(8),
                    child: const Text('Tertiary'),
                  ),
                  const SizedBox(height: 8),
                  Surface.tertiaryContainer(
                    padding: const EdgeInsets.all(16),
                    borderRadius: BorderRadius.circular(8),
                    child: const Text('Tertiary Container'),
                  ),
                  const SizedBox(height: 8),
                  Surface.error(
                    padding: const EdgeInsets.all(16),
                    borderRadius: BorderRadius.circular(8),
                    child: const Text('Error'),
                  ),
                  const SizedBox(height: 8),
                  Surface.errorContainer(
                    padding: const EdgeInsets.all(16),
                    borderRadius: BorderRadius.circular(8),
                    child: const Text('Error Container'),
                  ),
                ],
              ),
            ),
          ),
        ),
      );
      await tester.pumpAndSettle();

      await expectLater(
        find.byType(Scaffold),
        matchesGoldenFile('goldens/surface_variants_dark.png'),
      );
    });
  });

  group('Golden Tests - Full App', () {
    testWidgets('Full app light theme', (tester) async {
      final provider = await createTestProvider();

      await tester.pumpWidget(
        MaterialApp(
          theme: ThemeData(
            colorScheme: provider.lightColorScheme,
            textTheme: _interTextTheme,
          ),
          home: Scaffold(
            appBar: AppBar(
              title: const Text('Flutter Themeator'),
            ),
            body: const Center(
              child: Text('Colors tab content'),
            ),
          ),
        ),
      );
      await tester.pumpAndSettle();

      await expectLater(
        find.byType(MaterialApp),
        matchesGoldenFile('goldens/full_app_light.png'),
      );
    });
  });
}
