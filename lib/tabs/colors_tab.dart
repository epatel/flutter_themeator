import 'package:flutter/material.dart';
import '../dialogs/color_editor_dialog.dart';

class ColorsTab extends StatelessWidget {
  const ColorsTab({super.key});

  @override
  Widget build(BuildContext context) {
    final colorScheme = Theme.of(context).colorScheme;
    final brightness = Theme.of(context).brightness;

    final colorGroups = [
      _ColorGroup('Surface', [
        _ColorItem(
          'surface',
          colorScheme.surface,
          'onSurface',
          colorScheme.onSurface,
          'Default background for scaffolds',
        ),
        _ColorItem(
          'surfaceDim',
          colorScheme.surfaceDim,
          null,
          null,
          'Dimmed backgrounds, disabled states',
        ),
        _ColorItem(
          'surfaceBright',
          colorScheme.surfaceBright,
          null,
          null,
          'Elevated surfaces in dark mode',
        ),
        _ColorItem(
          'surfaceContainerLowest',
          colorScheme.surfaceContainerLowest,
          null,
          null,
          'Lowest elevation cards',
        ),
        _ColorItem(
          'surfaceContainerLow',
          colorScheme.surfaceContainerLow,
          null,
          null,
          'Low elevation cards, drawers',
        ),
        _ColorItem(
          'surfaceContainer',
          colorScheme.surfaceContainer,
          null,
          null,
          'Standard cards, menus',
        ),
        _ColorItem(
          'surfaceContainerHigh',
          colorScheme.surfaceContainerHigh,
          null,
          null,
          'Dialogs, elevated sheets',
        ),
        _ColorItem(
          'surfaceContainerHighest',
          colorScheme.surfaceContainerHighest,
          null,
          null,
          'Top-level navigation, app bars',
        ),
        _ColorItem(
          'inverseSurface',
          colorScheme.inverseSurface,
          'onInverseSurface',
          colorScheme.onInverseSurface,
          'Snackbars, tooltips',
        ),
      ]),
      _ColorGroup('Primary', [
        _ColorItem(
          'primary',
          colorScheme.primary,
          'onPrimary',
          colorScheme.onPrimary,
          'FABs, prominent buttons, active states',
        ),
        _ColorItem(
          'primaryContainer',
          colorScheme.primaryContainer,
          'onPrimaryContainer',
          colorScheme.onPrimaryContainer,
          'Cards, input fields, tonal buttons',
        ),
        _ColorItem(
          'primaryFixed',
          colorScheme.primaryFixed,
          'onPrimaryFixed',
          colorScheme.onPrimaryFixed,
          'Headers consistent across themes',
        ),
        _ColorItem(
          'primaryFixedDim',
          colorScheme.primaryFixedDim,
          'onPrimaryFixedVariant',
          colorScheme.onPrimaryFixedVariant,
          'Subtle fixed backgrounds',
        ),
      ]),
      _ColorGroup('Secondary', [
        _ColorItem(
          'secondary',
          colorScheme.secondary,
          'onSecondary',
          colorScheme.onSecondary,
          'Filter chips, toggle buttons',
        ),
        _ColorItem(
          'secondaryContainer',
          colorScheme.secondaryContainer,
          'onSecondaryContainer',
          colorScheme.onSecondaryContainer,
          'Selected items, nav rail selection',
        ),
        _ColorItem(
          'secondaryFixed',
          colorScheme.secondaryFixed,
          'onSecondaryFixed',
          colorScheme.onSecondaryFixed,
          'Persistent UI elements, sidebars',
        ),
        _ColorItem(
          'secondaryFixedDim',
          colorScheme.secondaryFixedDim,
          'onSecondaryFixedVariant',
          colorScheme.onSecondaryFixedVariant,
          'Muted fixed backgrounds',
        ),
      ]),
      _ColorGroup('Tertiary', [
        _ColorItem(
          'tertiary',
          colorScheme.tertiary,
          'onTertiary',
          colorScheme.onTertiary,
          'Accent elements, highlights',
        ),
        _ColorItem(
          'tertiaryContainer',
          colorScheme.tertiaryContainer,
          'onTertiaryContainer',
          colorScheme.onTertiaryContainer,
          'Badges, tags, callout boxes',
        ),
        _ColorItem(
          'tertiaryFixed',
          colorScheme.tertiaryFixed,
          'onTertiaryFixed',
          colorScheme.onTertiaryFixed,
          'Promotional banners, features',
        ),
        _ColorItem(
          'tertiaryFixedDim',
          colorScheme.tertiaryFixedDim,
          'onTertiaryFixedVariant',
          colorScheme.onTertiaryFixedVariant,
          'Subtle accents, info panels',
        ),
      ]),
      _ColorGroup('Error', [
        _ColorItem(
          'error',
          colorScheme.error,
          'onError',
          colorScheme.onError,
          'Critical alerts, destructive buttons',
        ),
        _ColorItem(
          'errorContainer',
          colorScheme.errorContainer,
          'onErrorContainer',
          colorScheme.onErrorContainer,
          'Error messages, validation feedback',
        ),
      ]),
      _ColorGroup('Outline & Other', [
        _ColorItem(
          'outline',
          colorScheme.outline,
          null,
          null,
          'Borders, dividers, input outlines',
        ),
        _ColorItem(
          'outlineVariant',
          colorScheme.outlineVariant,
          null,
          null,
          'Subtle dividers, decorative borders',
        ),
        _ColorItem(
          'shadow',
          colorScheme.shadow,
          null,
          null,
          'Drop shadows for elevation',
        ),
        _ColorItem(
          'scrim',
          colorScheme.scrim,
          null,
          null,
          'Modal overlays, background dimming',
        ),
        _ColorItem(
          'inversePrimary',
          colorScheme.inversePrimary,
          null,
          null,
          'Links/buttons on inverse surfaces',
        ),
        _ColorItem(
          'surfaceTint',
          colorScheme.surfaceTint,
          null,
          null,
          'Elevation tint overlay color',
        ),
      ]),
    ];

    return ListView.builder(
      padding: const EdgeInsets.all(16),
      itemCount: colorGroups.length + 1,
      itemBuilder: (context, index) {
        if (index == 0) {
          return Padding(
            padding: const EdgeInsets.only(bottom: 16),
            child: Text(
              'Long press a color to edit',
              style: Theme.of(context).textTheme.bodySmall?.copyWith(
                color: colorScheme.onSurfaceVariant,
              ),
            ),
          );
        }
        final group = colorGroups[index - 1];
        return Column(
          crossAxisAlignment: .start,
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 8),
              child: Text(
                group.name,
                style: Theme.of(context).textTheme.titleLarge,
              ),
            ),
            GridView.builder(
              shrinkWrap: true,
              physics: const NeverScrollableScrollPhysics(),
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                childAspectRatio: 1.6,
                crossAxisSpacing: 8,
                mainAxisSpacing: 8,
              ),
              itemCount: group.colors.length,
              itemBuilder: (context, colorIndex) {
                final colorItem = group.colors[colorIndex];
                return _ColorCard(
                  colorItem: colorItem,
                  onLongPress: () => _showColorEditor(
                    context,
                    colorItem,
                    brightness,
                  ),
                );
              },
            ),
            const SizedBox(height: 16),
          ],
        );
      },
    );
  }

  void _showColorEditor(
    BuildContext context,
    _ColorItem colorItem,
    Brightness brightness,
  ) {
    ColorEditorDialog.show(
      context: context,
      colorName: colorItem.name,
      initialColor: colorItem.color,
      onColorName: colorItem.onColorName,
      initialOnColor: colorItem.onColor,
      brightness: brightness,
    );
  }
}

class _ColorGroup {
  final String name;
  final List<_ColorItem> colors;

  _ColorGroup(this.name, this.colors);
}

class _ColorItem {
  final String name;
  final Color color;
  final String? onColorName;
  final Color? onColor;
  final String? useCase;

  _ColorItem(
    this.name,
    this.color,
    this.onColorName,
    this.onColor, [
    this.useCase,
  ]);
}

class _ColorCard extends StatelessWidget {
  final _ColorItem colorItem;
  final VoidCallback onLongPress;

  const _ColorCard({required this.colorItem, required this.onLongPress});

  @override
  Widget build(BuildContext context) {
    final luminance = colorItem.color.computeLuminance();
    final fallbackTextColor = luminance > 0.5 ? Colors.black : Colors.white;

    return GestureDetector(
      onLongPress: onLongPress,
      child: Container(
        decoration: BoxDecoration(
          color: colorItem.color,
          borderRadius: BorderRadius.circular(8),
          border: Border.all(color: Theme.of(context).colorScheme.outline),
        ),
        padding: const EdgeInsets.all(8),
        child: Column(
          crossAxisAlignment: .start,
          mainAxisAlignment: .center,
          children: [
            Text(
              colorItem.name,
              style: TextStyle(
                color: fallbackTextColor,
                fontWeight: .bold,
                fontSize: 12,
              ),
            ),
            Text(
              '#${colorItem.color.toHex()}',
              style: TextStyle(
                color: fallbackTextColor.withValues(alpha: 0.7),
                fontSize: 10,
              ),
            ),
            if (colorItem.useCase != null) ...[
              const SizedBox(height: 4),
              Text(
                colorItem.useCase!,
                style: TextStyle(
                  color: fallbackTextColor.withValues(alpha: 0.8),
                  fontSize: 10,
                  fontStyle: FontStyle.italic,
                ),
                maxLines: 2,
                overflow: TextOverflow.ellipsis,
              ),
            ],
            if (colorItem.onColor != null && colorItem.onColorName != null) ...[
              const SizedBox(height: 4),
              Container(
                padding: const EdgeInsets.symmetric(horizontal: 6, vertical: 2),
                decoration: BoxDecoration(
                  color: colorItem.color,
                  borderRadius: BorderRadius.circular(4),
                ),
                child: Text(
                  '• ${colorItem.onColorName} #${colorItem.onColor!.toHex()}',
                  style: TextStyle(
                    color: colorItem.onColor,
                    fontWeight: .w500,
                    fontSize: 11,
                  ),
                ),
              ),
            ],
          ],
        ),
      ),
    );
  }
}

extension on Color {
  String toHex() {
    return '${(r * 255).round().toRadixString(16).padLeft(2, '0')}'
            '${(g * 255).round().toRadixString(16).padLeft(2, '0')}'
            '${(b * 255).round().toRadixString(16).padLeft(2, '0')}'
        .toUpperCase();
  }
}
