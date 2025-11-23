import 'package:flutter/material.dart';
import '../providers/color_scheme_provider.dart';
import '../dialogs/color_editor_dialog.dart';

class ColorsTab extends StatelessWidget {
  final ColorSchemeProvider colorSchemeProvider;

  const ColorsTab({super.key, required this.colorSchemeProvider});

  @override
  Widget build(BuildContext context) {
    final colorScheme = Theme.of(context).colorScheme;
    final brightness = Theme.of(context).brightness;

    final colorGroups = [
      _ColorGroup('Primary', [
        _ColorItem(
          'primary',
          colorScheme.primary,
          'onPrimary',
          colorScheme.onPrimary,
        ),
        _ColorItem(
          'primaryContainer',
          colorScheme.primaryContainer,
          'onPrimaryContainer',
          colorScheme.onPrimaryContainer,
        ),
        _ColorItem(
          'primaryFixed',
          colorScheme.primaryFixed,
          'onPrimaryFixed',
          colorScheme.onPrimaryFixed,
        ),
        _ColorItem(
          'primaryFixedDim',
          colorScheme.primaryFixedDim,
          'onPrimaryFixedVariant',
          colorScheme.onPrimaryFixedVariant,
        ),
      ]),
      _ColorGroup('Secondary', [
        _ColorItem(
          'secondary',
          colorScheme.secondary,
          'onSecondary',
          colorScheme.onSecondary,
        ),
        _ColorItem(
          'secondaryContainer',
          colorScheme.secondaryContainer,
          'onSecondaryContainer',
          colorScheme.onSecondaryContainer,
        ),
        _ColorItem(
          'secondaryFixed',
          colorScheme.secondaryFixed,
          'onSecondaryFixed',
          colorScheme.onSecondaryFixed,
        ),
        _ColorItem(
          'secondaryFixedDim',
          colorScheme.secondaryFixedDim,
          'onSecondaryFixedVariant',
          colorScheme.onSecondaryFixedVariant,
        ),
      ]),
      _ColorGroup('Tertiary', [
        _ColorItem(
          'tertiary',
          colorScheme.tertiary,
          'onTertiary',
          colorScheme.onTertiary,
        ),
        _ColorItem(
          'tertiaryContainer',
          colorScheme.tertiaryContainer,
          'onTertiaryContainer',
          colorScheme.onTertiaryContainer,
        ),
        _ColorItem(
          'tertiaryFixed',
          colorScheme.tertiaryFixed,
          'onTertiaryFixed',
          colorScheme.onTertiaryFixed,
        ),
        _ColorItem(
          'tertiaryFixedDim',
          colorScheme.tertiaryFixedDim,
          'onTertiaryFixedVariant',
          colorScheme.onTertiaryFixedVariant,
        ),
      ]),
      _ColorGroup('Error', [
        _ColorItem('error', colorScheme.error, 'onError', colorScheme.onError),
        _ColorItem(
          'errorContainer',
          colorScheme.errorContainer,
          'onErrorContainer',
          colorScheme.onErrorContainer,
        ),
      ]),
      _ColorGroup('Surface', [
        _ColorItem(
          'surface',
          colorScheme.surface,
          'onSurface',
          colorScheme.onSurface,
        ),
        _ColorItem('surfaceDim', colorScheme.surfaceDim, null, null),
        _ColorItem('surfaceBright', colorScheme.surfaceBright, null, null),
        _ColorItem(
          'surfaceContainerLowest',
          colorScheme.surfaceContainerLowest,
          null,
          null,
        ),
        _ColorItem(
          'surfaceContainerLow',
          colorScheme.surfaceContainerLow,
          null,
          null,
        ),
        _ColorItem(
          'surfaceContainer',
          colorScheme.surfaceContainer,
          null,
          null,
        ),
        _ColorItem(
          'surfaceContainerHigh',
          colorScheme.surfaceContainerHigh,
          null,
          null,
        ),
        _ColorItem(
          'surfaceContainerHighest',
          colorScheme.surfaceContainerHighest,
          null,
          null,
        ),
        _ColorItem(
          'inverseSurface',
          colorScheme.inverseSurface,
          'onInverseSurface',
          colorScheme.onInverseSurface,
        ),
      ]),
      _ColorGroup('Outline & Other', [
        _ColorItem('outline', colorScheme.outline, null, null),
        _ColorItem('outlineVariant', colorScheme.outlineVariant, null, null),
        _ColorItem('shadow', colorScheme.shadow, null, null),
        _ColorItem('scrim', colorScheme.scrim, null, null),
        _ColorItem('inversePrimary', colorScheme.inversePrimary, null, null),
        _ColorItem('surfaceTint', colorScheme.surfaceTint, null, null),
        _ColorItem('onSurface', colorScheme.onSurface, null, null),
        _ColorItem(
          'onSurfaceVariant',
          colorScheme.onSurfaceVariant,
          null,
          null,
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
                childAspectRatio: 2.0,
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
      provider: colorSchemeProvider,
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

  _ColorItem(this.name, this.color, this.onColorName, this.onColor);
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
