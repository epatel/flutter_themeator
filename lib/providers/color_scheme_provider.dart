import 'package:flutter/material.dart';
import '../services/color_storage.dart';
import '../themes.dart';

class ColorSchemeProvider extends ChangeNotifier {
  final ColorStorage _storage;

  late Map<String, Color> _lightColors;
  late Map<String, Color> _darkColors;

  ColorSchemeProvider(this._storage) {
    _loadColors();
  }

  void _loadColors() {
    final savedLight = _storage.loadColors(.light);
    final savedDark = _storage.loadColors(.dark);

    _lightColors = savedLight.isEmpty
        ? ColorStorage.colorSchemeToMap(AppColors.lightColorScheme)
        : savedLight;
    _darkColors = savedDark.isEmpty
        ? ColorStorage.colorSchemeToMap(AppColors.darkColorScheme)
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
    _lightColors = ColorStorage.colorSchemeToMap(AppColors.lightColorScheme);
    _darkColors = ColorStorage.colorSchemeToMap(AppColors.darkColorScheme);

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
