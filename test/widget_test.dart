import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:flutter_themeator/app.dart';
import 'package:flutter_themeator/services/color_storage.dart';
import 'package:flutter_themeator/providers/color_scheme_provider.dart';
import 'package:flutter_themeator/theme_provider.dart';
import 'package:flutter_themeator/widgets/surface.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';

Future<ColorSchemeProvider> createTestProvider() async {
  SharedPreferences.setMockInitialValues({});
  final prefs = await SharedPreferences.getInstance();
  final colorStorage = ColorStorage(prefs);
  return ColorSchemeProvider(colorStorage);
}

Widget createTestApp(ColorSchemeProvider colorSchemeProvider) {
  return MultiProvider(
    providers: [
      ChangeNotifierProvider(create: (_) => ThemeProvider()),
      ChangeNotifierProvider.value(value: colorSchemeProvider),
    ],
    child: const ThemeatorApp(),
  );
}

void main() {
  group('ThemeatorApp', () {
    testWidgets('renders with all tabs', (WidgetTester tester) async {
      final colorSchemeProvider = await createTestProvider();

      await tester.pumpWidget(createTestApp(colorSchemeProvider));

      expect(find.text('Flutter Themeator'), findsOneWidget);
      expect(find.text('Colors'), findsOneWidget);
      expect(find.text('Text'), findsOneWidget);
      expect(find.text('Combos'), findsOneWidget);
      expect(find.text('Widgets'), findsOneWidget);
    });

    testWidgets('can switch between tabs', (WidgetTester tester) async {
      final colorSchemeProvider = await createTestProvider();

      await tester.pumpWidget(createTestApp(colorSchemeProvider));

      // Initially on Colors tab
      expect(find.text('Long press a color to edit'), findsOneWidget);

      // Tap on Text tab
      await tester.tap(find.text('Text'));
      await tester.pumpAndSettle();

      expect(find.text('displayLarge'), findsOneWidget);

      // Tap on Combos tab
      await tester.tap(find.text('Combos'));
      await tester.pumpAndSettle();

      expect(find.text('Surface'), findsWidgets);

      // Tap on Widgets tab
      await tester.tap(find.text('Widgets'));
      await tester.pumpAndSettle();

      expect(find.text('Surface Widget'), findsOneWidget);
    });

    testWidgets('theme toggle button exists', (WidgetTester tester) async {
      final colorSchemeProvider = await createTestProvider();

      await tester.pumpWidget(createTestApp(colorSchemeProvider));

      expect(find.byIcon(Icons.dark_mode), findsOneWidget);
    });

    testWidgets('reset button exists', (WidgetTester tester) async {
      final colorSchemeProvider = await createTestProvider();

      await tester.pumpWidget(createTestApp(colorSchemeProvider));

      expect(find.byIcon(Icons.refresh), findsOneWidget);
    });
  });

  group('Surface widget', () {
    testWidgets('Surface.primary applies correct colors', (tester) async {
      await tester.pumpWidget(
        MaterialApp(
          theme: ThemeData(
            colorScheme: ColorScheme.fromSeed(seedColor: Colors.blue),
          ),
          home: Scaffold(
            body: Surface.primary(
              padding: const EdgeInsets.all(16),
              child: const Text('Test'),
            ),
          ),
        ),
      );

      expect(find.text('Test'), findsOneWidget);

      final container = tester.widget<Container>(
        find.descendant(
          of: find.byType(Surface),
          matching: find.byType(Container),
        ).first,
      );
      final decoration = container.decoration as BoxDecoration;
      expect(decoration.color, isNotNull);
    });

    testWidgets('Surface.secondary renders correctly', (tester) async {
      await tester.pumpWidget(
        MaterialApp(
          theme: ThemeData(
            colorScheme: ColorScheme.fromSeed(seedColor: Colors.blue),
          ),
          home: Scaffold(
            body: Surface.secondary(
              padding: const EdgeInsets.all(16),
              child: const Text('Secondary'),
            ),
          ),
        ),
      );

      expect(find.text('Secondary'), findsOneWidget);
    });

    testWidgets('Surface.error renders correctly', (tester) async {
      await tester.pumpWidget(
        MaterialApp(
          theme: ThemeData(
            colorScheme: ColorScheme.fromSeed(seedColor: Colors.blue),
          ),
          home: Scaffold(
            body: Surface.error(
              padding: const EdgeInsets.all(16),
              child: const Text('Error'),
            ),
          ),
        ),
      );

      expect(find.text('Error'), findsOneWidget);
    });

    testWidgets('Surface applies borderRadius', (tester) async {
      await tester.pumpWidget(
        MaterialApp(
          home: Scaffold(
            body: Surface.primary(
              borderRadius: BorderRadius.circular(12),
              child: const Text('Rounded'),
            ),
          ),
        ),
      );

      final container = tester.widget<Container>(
        find.descendant(
          of: find.byType(Surface),
          matching: find.byType(Container),
        ).first,
      );
      final decoration = container.decoration as BoxDecoration;
      expect(decoration.borderRadius, BorderRadius.circular(12));
    });
  });

  group('ColorSchemeProvider', () {
    test('initializes with default colors', () async {
      final provider = await createTestProvider();

      expect(provider.lightColorScheme, isNotNull);
      expect(provider.darkColorScheme, isNotNull);
      expect(provider.lightColorScheme.primary, isNotNull);
    });

    test('can update a color', () async {
      final provider = await createTestProvider();
      final originalColor = provider.lightColorScheme.primary;

      await provider.updateColor('primary', Colors.red, Brightness.light);

      expect(provider.lightColorScheme.primary, Colors.red);
      expect(provider.lightColorScheme.primary, isNot(originalColor));
    });

    test('can reset to default', () async {
      final provider = await createTestProvider();

      await provider.updateColor('primary', Colors.red, Brightness.light);
      expect(provider.lightColorScheme.primary, Colors.red);

      await provider.resetToDefault();

      // Should be back to deepPurple seed color
      expect(provider.lightColorScheme.primary, isNot(Colors.red));
    });
  });
}
