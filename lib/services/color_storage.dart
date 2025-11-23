import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../themes.dart';

class ColorStorage {
  static const _keyLight = 'color_scheme_light';
  static const _keyDark = 'color_scheme_dark';

  final SharedPreferences _prefs;

  ColorStorage(this._prefs);

  static Future<ColorStorage> init() async {
    final prefs = await SharedPreferences.getInstance();
    return ColorStorage(prefs);
  }

  Map<String, Color> loadColors(Brightness brightness) {
    final key = brightness == .light ? _keyLight : _keyDark;
    final json = _prefs.getString(key);
    if (json == null) return {};

    final map = jsonDecode(json) as Map<String, dynamic>;
    return map.map((k, v) => MapEntry(k, Color(v as int)));
  }

  Future<void> saveColors(
    Map<String, Color> colors,
    Brightness brightness,
  ) async {
    final key = brightness == .light ? _keyLight : _keyDark;
    final map = colors.map((k, v) => MapEntry(k, v.toARGB()));

    await _prefs.setString(key, jsonEncode(map));
  }

  Future<void> clearColors() async {
    await _prefs.remove(_keyLight);
    await _prefs.remove(_keyDark);
  }

  static Map<String, Color> colorSchemeToMap(ColorScheme scheme) {
    return {
      'primary': scheme.primary,
      'onPrimary': scheme.onPrimary,
      'primaryContainer': scheme.primaryContainer,
      'onPrimaryContainer': scheme.onPrimaryContainer,
      'primaryFixed': scheme.primaryFixed,
      'primaryFixedDim': scheme.primaryFixedDim,
      'onPrimaryFixed': scheme.onPrimaryFixed,
      'onPrimaryFixedVariant': scheme.onPrimaryFixedVariant,
      'secondary': scheme.secondary,
      'onSecondary': scheme.onSecondary,
      'secondaryContainer': scheme.secondaryContainer,
      'onSecondaryContainer': scheme.onSecondaryContainer,
      'secondaryFixed': scheme.secondaryFixed,
      'secondaryFixedDim': scheme.secondaryFixedDim,
      'onSecondaryFixed': scheme.onSecondaryFixed,
      'onSecondaryFixedVariant': scheme.onSecondaryFixedVariant,
      'tertiary': scheme.tertiary,
      'onTertiary': scheme.onTertiary,
      'tertiaryContainer': scheme.tertiaryContainer,
      'onTertiaryContainer': scheme.onTertiaryContainer,
      'tertiaryFixed': scheme.tertiaryFixed,
      'tertiaryFixedDim': scheme.tertiaryFixedDim,
      'onTertiaryFixed': scheme.onTertiaryFixed,
      'onTertiaryFixedVariant': scheme.onTertiaryFixedVariant,
      'error': scheme.error,
      'onError': scheme.onError,
      'errorContainer': scheme.errorContainer,
      'onErrorContainer': scheme.onErrorContainer,
      'surface': scheme.surface,
      'onSurface': scheme.onSurface,
      'surfaceDim': scheme.surfaceDim,
      'surfaceBright': scheme.surfaceBright,
      'surfaceContainerLowest': scheme.surfaceContainerLowest,
      'surfaceContainerLow': scheme.surfaceContainerLow,
      'surfaceContainer': scheme.surfaceContainer,
      'surfaceContainerHigh': scheme.surfaceContainerHigh,
      'surfaceContainerHighest': scheme.surfaceContainerHighest,
      'onSurfaceVariant': scheme.onSurfaceVariant,
      'outline': scheme.outline,
      'outlineVariant': scheme.outlineVariant,
      'shadow': scheme.shadow,
      'scrim': scheme.scrim,
      'inverseSurface': scheme.inverseSurface,
      'onInverseSurface': scheme.onInverseSurface,
      'inversePrimary': scheme.inversePrimary,
      'surfaceTint': scheme.surfaceTint,
    };
  }

  static ColorScheme mapToColorScheme(
    Map<String, Color> colors,
    Brightness brightness,
  ) {
    final defaultScheme = brightness == .light
        ? AppColors.lightColorScheme
        : AppColors.darkColorScheme;

    return ColorScheme(
      brightness: brightness,
      primary: colors['primary'] ?? defaultScheme.primary,
      onPrimary: colors['onPrimary'] ?? defaultScheme.onPrimary,
      primaryContainer:
          colors['primaryContainer'] ?? defaultScheme.primaryContainer,
      onPrimaryContainer:
          colors['onPrimaryContainer'] ?? defaultScheme.onPrimaryContainer,
      primaryFixed: colors['primaryFixed'] ?? defaultScheme.primaryFixed,
      primaryFixedDim:
          colors['primaryFixedDim'] ?? defaultScheme.primaryFixedDim,
      onPrimaryFixed: colors['onPrimaryFixed'] ?? defaultScheme.onPrimaryFixed,
      onPrimaryFixedVariant:
          colors['onPrimaryFixedVariant'] ??
          defaultScheme.onPrimaryFixedVariant,
      secondary: colors['secondary'] ?? defaultScheme.secondary,
      onSecondary: colors['onSecondary'] ?? defaultScheme.onSecondary,
      secondaryContainer:
          colors['secondaryContainer'] ?? defaultScheme.secondaryContainer,
      onSecondaryContainer:
          colors['onSecondaryContainer'] ?? defaultScheme.onSecondaryContainer,
      secondaryFixed: colors['secondaryFixed'] ?? defaultScheme.secondaryFixed,
      secondaryFixedDim:
          colors['secondaryFixedDim'] ?? defaultScheme.secondaryFixedDim,
      onSecondaryFixed:
          colors['onSecondaryFixed'] ?? defaultScheme.onSecondaryFixed,
      onSecondaryFixedVariant:
          colors['onSecondaryFixedVariant'] ??
          defaultScheme.onSecondaryFixedVariant,
      tertiary: colors['tertiary'] ?? defaultScheme.tertiary,
      onTertiary: colors['onTertiary'] ?? defaultScheme.onTertiary,
      tertiaryContainer:
          colors['tertiaryContainer'] ?? defaultScheme.tertiaryContainer,
      onTertiaryContainer:
          colors['onTertiaryContainer'] ?? defaultScheme.onTertiaryContainer,
      tertiaryFixed: colors['tertiaryFixed'] ?? defaultScheme.tertiaryFixed,
      tertiaryFixedDim:
          colors['tertiaryFixedDim'] ?? defaultScheme.tertiaryFixedDim,
      onTertiaryFixed:
          colors['onTertiaryFixed'] ?? defaultScheme.onTertiaryFixed,
      onTertiaryFixedVariant:
          colors['onTertiaryFixedVariant'] ??
          defaultScheme.onTertiaryFixedVariant,
      error: colors['error'] ?? defaultScheme.error,
      onError: colors['onError'] ?? defaultScheme.onError,
      errorContainer: colors['errorContainer'] ?? defaultScheme.errorContainer,
      onErrorContainer:
          colors['onErrorContainer'] ?? defaultScheme.onErrorContainer,
      surface: colors['surface'] ?? defaultScheme.surface,
      onSurface: colors['onSurface'] ?? defaultScheme.onSurface,
      surfaceDim: colors['surfaceDim'] ?? defaultScheme.surfaceDim,
      surfaceBright: colors['surfaceBright'] ?? defaultScheme.surfaceBright,
      surfaceContainerLowest:
          colors['surfaceContainerLowest'] ??
          defaultScheme.surfaceContainerLowest,
      surfaceContainerLow:
          colors['surfaceContainerLow'] ?? defaultScheme.surfaceContainerLow,
      surfaceContainer:
          colors['surfaceContainer'] ?? defaultScheme.surfaceContainer,
      surfaceContainerHigh:
          colors['surfaceContainerHigh'] ?? defaultScheme.surfaceContainerHigh,
      surfaceContainerHighest:
          colors['surfaceContainerHighest'] ??
          defaultScheme.surfaceContainerHighest,
      onSurfaceVariant:
          colors['onSurfaceVariant'] ?? defaultScheme.onSurfaceVariant,
      outline: colors['outline'] ?? defaultScheme.outline,
      outlineVariant: colors['outlineVariant'] ?? defaultScheme.outlineVariant,
      shadow: colors['shadow'] ?? defaultScheme.shadow,
      scrim: colors['scrim'] ?? defaultScheme.scrim,
      inverseSurface: colors['inverseSurface'] ?? defaultScheme.inverseSurface,
      onInverseSurface:
          colors['onInverseSurface'] ?? defaultScheme.onInverseSurface,
      inversePrimary: colors['inversePrimary'] ?? defaultScheme.inversePrimary,
      surfaceTint: colors['surfaceTint'] ?? defaultScheme.surfaceTint,
    );
  }
}

extension _ColorExtension on Color {
  int toARGB() {
    return ((a * 255).round() << 24) |
        ((r * 255).round() << 16) |
        ((g * 255).round() << 8) |
        (b * 255).round();
  }
}
