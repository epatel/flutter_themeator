import 'package:flutter/material.dart';
import '../services/color_storage.dart';

class ColorSchemeProvider extends ChangeNotifier {
  final ColorStorage _storage;

  late Map<String, Color> _lightColors;
  late Map<String, Color> _darkColors;

  ColorSchemeProvider(this._storage) {
    _loadColors();
  }

  void _loadColors() {
    final defaultLight = ColorScheme.fromSeed(
      seedColor: Colors.deepPurple,
      brightness: .light,
    );
    final defaultDark = ColorScheme.fromSeed(
      seedColor: Colors.deepPurple,
      brightness: .dark,
    );

    final savedLight = _storage.loadColors(.light);
    final savedDark = _storage.loadColors(.dark);

    _lightColors = savedLight.isEmpty
        ? ColorStorage.colorSchemeToMap(defaultLight)
        : savedLight;
    _darkColors = savedDark.isEmpty
        ? ColorStorage.colorSchemeToMap(defaultDark)
        : savedDark;
  }

  ColorScheme get lightColorScheme =>
      ColorStorage.mapToColorScheme(_lightColors, .light);

  ColorScheme get darkColorScheme =>
      ColorStorage.mapToColorScheme(_darkColors, .dark);

  Color getColor(String name, Brightness brightness) {
    final colors = brightness == .light ? _lightColors : _darkColors;
    return colors[name] ?? Colors.grey;
  }

  Future<void> updateColor(
    String name,
    Color color,
    Brightness brightness,
  ) async {
    final colors = brightness == .light ? _lightColors : _darkColors;
    colors[name] = color;
    await _storage.saveColors(colors, brightness);
    notifyListeners();
  }

  Future<void> resetToDefault() async {
    final defaultLight = ColorScheme.fromSeed(
      seedColor: Colors.deepPurple,
      brightness: .light,
    );
    final defaultDark = ColorScheme.fromSeed(
      seedColor: Colors.deepPurple,
      brightness: .dark,
    );

    _lightColors = ColorStorage.colorSchemeToMap(defaultLight);
    _darkColors = ColorStorage.colorSchemeToMap(defaultDark);

    await _storage.clearColors();
    notifyListeners();
  }

  String? getOnColorName(String colorName) {
    final onColorPairs = {
      'primary': 'onPrimary',
      'primaryContainer': 'onPrimaryContainer',
      'primaryFixed': 'onPrimaryFixed',
      'primaryFixedDim': 'onPrimaryFixedVariant',
      'secondary': 'onSecondary',
      'secondaryContainer': 'onSecondaryContainer',
      'secondaryFixed': 'onSecondaryFixed',
      'secondaryFixedDim': 'onSecondaryFixedVariant',
      'tertiary': 'onTertiary',
      'tertiaryContainer': 'onTertiaryContainer',
      'tertiaryFixed': 'onTertiaryFixed',
      'tertiaryFixedDim': 'onTertiaryFixedVariant',
      'error': 'onError',
      'errorContainer': 'onErrorContainer',
      'surface': 'onSurface',
      'surfaceDim': 'onSurface',
      'surfaceBright': 'onSurface',
      'surfaceContainerLowest': 'onSurface',
      'surfaceContainerLow': 'onSurface',
      'surfaceContainer': 'onSurface',
      'surfaceContainerHigh': 'onSurface',
      'surfaceContainerHighest': 'onSurface',
      'inverseSurface': 'onInverseSurface',
    };
    return onColorPairs[colorName];
  }
}
