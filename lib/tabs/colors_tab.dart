import 'package:flutter/material.dart';

class ColorsTab extends StatelessWidget {
  const ColorsTab({super.key});

  @override
  Widget build(BuildContext context) {
    final colorScheme = Theme.of(context).colorScheme;

    final colorGroups = [
      _ColorGroup('Primary', [
        _ColorItem('primary', colorScheme.primary, colorScheme.onPrimary),
        _ColorItem(
          'primaryContainer',
          colorScheme.primaryContainer,
          colorScheme.onPrimaryContainer,
        ),
        _ColorItem(
          'primaryFixed',
          colorScheme.primaryFixed,
          colorScheme.onPrimaryFixed,
        ),
        _ColorItem(
          'primaryFixedDim',
          colorScheme.primaryFixedDim,
          colorScheme.onPrimaryFixedVariant,
        ),
      ]),
      _ColorGroup('Secondary', [
        _ColorItem('secondary', colorScheme.secondary, colorScheme.onSecondary),
        _ColorItem(
          'secondaryContainer',
          colorScheme.secondaryContainer,
          colorScheme.onSecondaryContainer,
        ),
        _ColorItem(
          'secondaryFixed',
          colorScheme.secondaryFixed,
          colorScheme.onSecondaryFixed,
        ),
        _ColorItem(
          'secondaryFixedDim',
          colorScheme.secondaryFixedDim,
          colorScheme.onSecondaryFixedVariant,
        ),
      ]),
      _ColorGroup('Tertiary', [
        _ColorItem('tertiary', colorScheme.tertiary, colorScheme.onTertiary),
        _ColorItem(
          'tertiaryContainer',
          colorScheme.tertiaryContainer,
          colorScheme.onTertiaryContainer,
        ),
        _ColorItem(
          'tertiaryFixed',
          colorScheme.tertiaryFixed,
          colorScheme.onTertiaryFixed,
        ),
        _ColorItem(
          'tertiaryFixedDim',
          colorScheme.tertiaryFixedDim,
          colorScheme.onTertiaryFixedVariant,
        ),
      ]),
      _ColorGroup('Error', [
        _ColorItem('error', colorScheme.error, colorScheme.onError),
        _ColorItem(
          'errorContainer',
          colorScheme.errorContainer,
          colorScheme.onErrorContainer,
        ),
      ]),
      _ColorGroup('Surface', [
        _ColorItem('surface', colorScheme.surface, colorScheme.onSurface),
        _ColorItem('surfaceDim', colorScheme.surfaceDim, colorScheme.onSurface),
        _ColorItem(
          'surfaceBright',
          colorScheme.surfaceBright,
          colorScheme.onSurface,
        ),
        _ColorItem(
          'surfaceContainerLowest',
          colorScheme.surfaceContainerLowest,
          colorScheme.onSurface,
        ),
        _ColorItem(
          'surfaceContainerLow',
          colorScheme.surfaceContainerLow,
          colorScheme.onSurface,
        ),
        _ColorItem(
          'surfaceContainer',
          colorScheme.surfaceContainer,
          colorScheme.onSurface,
        ),
        _ColorItem(
          'surfaceContainerHigh',
          colorScheme.surfaceContainerHigh,
          colorScheme.onSurface,
        ),
        _ColorItem(
          'surfaceContainerHighest',
          colorScheme.surfaceContainerHighest,
          colorScheme.onSurface,
        ),
        _ColorItem(
          'inverseSurface',
          colorScheme.inverseSurface,
          colorScheme.onInverseSurface,
        ),
      ]),
      _ColorGroup('Outline & Other', [
        _ColorItem('outline', colorScheme.outline, null),
        _ColorItem('outlineVariant', colorScheme.outlineVariant, null),
        _ColorItem('shadow', colorScheme.shadow, null),
        _ColorItem('scrim', colorScheme.scrim, null),
        _ColorItem('inversePrimary', colorScheme.inversePrimary, null),
        _ColorItem('surfaceTint', colorScheme.surfaceTint, null),
      ]),
    ];

    return ListView.builder(
      padding: const EdgeInsets.all(16),
      itemCount: colorGroups.length,
      itemBuilder: (context, index) {
        final group = colorGroups[index];
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
                return _ColorCard(colorItem: colorItem);
              },
            ),
            const SizedBox(height: 16),
          ],
        );
      },
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
  final Color? onColor;

  _ColorItem(this.name, this.color, this.onColor);
}

class _ColorCard extends StatelessWidget {
  final _ColorItem colorItem;

  const _ColorCard({required this.colorItem});

  @override
  Widget build(BuildContext context) {
    final luminance = colorItem.color.computeLuminance();
    final fallbackTextColor = luminance > 0.5 ? Colors.black : Colors.white;

    return Container(
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
          if (colorItem.onColor != null) ...[
            const SizedBox(height: 4),
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 6, vertical: 2),
              decoration: BoxDecoration(
                color: colorItem.color,
                borderRadius: BorderRadius.circular(4),
              ),
              child: Text(
                '• on${colorItem.name[0].toUpperCase()}${colorItem.name.substring(1)} #${colorItem.onColor!.toHex()}',
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
