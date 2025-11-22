import 'package:flutter/material.dart';

class ColorsTab extends StatelessWidget {
  const ColorsTab({super.key});

  @override
  Widget build(BuildContext context) {
    final colorScheme = Theme.of(context).colorScheme;

    final colorGroups = [
      _ColorGroup('Primary', [
        _ColorItem('primary', colorScheme.primary),
        _ColorItem('onPrimary', colorScheme.onPrimary),
        _ColorItem('primaryContainer', colorScheme.primaryContainer),
        _ColorItem('onPrimaryContainer', colorScheme.onPrimaryContainer),
        _ColorItem('primaryFixed', colorScheme.primaryFixed),
        _ColorItem('primaryFixedDim', colorScheme.primaryFixedDim),
        _ColorItem('onPrimaryFixed', colorScheme.onPrimaryFixed),
        _ColorItem('onPrimaryFixedVariant', colorScheme.onPrimaryFixedVariant),
      ]),
      _ColorGroup('Secondary', [
        _ColorItem('secondary', colorScheme.secondary),
        _ColorItem('onSecondary', colorScheme.onSecondary),
        _ColorItem('secondaryContainer', colorScheme.secondaryContainer),
        _ColorItem('onSecondaryContainer', colorScheme.onSecondaryContainer),
        _ColorItem('secondaryFixed', colorScheme.secondaryFixed),
        _ColorItem('secondaryFixedDim', colorScheme.secondaryFixedDim),
        _ColorItem('onSecondaryFixed', colorScheme.onSecondaryFixed),
        _ColorItem('onSecondaryFixedVariant', colorScheme.onSecondaryFixedVariant),
      ]),
      _ColorGroup('Tertiary', [
        _ColorItem('tertiary', colorScheme.tertiary),
        _ColorItem('onTertiary', colorScheme.onTertiary),
        _ColorItem('tertiaryContainer', colorScheme.tertiaryContainer),
        _ColorItem('onTertiaryContainer', colorScheme.onTertiaryContainer),
        _ColorItem('tertiaryFixed', colorScheme.tertiaryFixed),
        _ColorItem('tertiaryFixedDim', colorScheme.tertiaryFixedDim),
        _ColorItem('onTertiaryFixed', colorScheme.onTertiaryFixed),
        _ColorItem('onTertiaryFixedVariant', colorScheme.onTertiaryFixedVariant),
      ]),
      _ColorGroup('Error', [
        _ColorItem('error', colorScheme.error),
        _ColorItem('onError', colorScheme.onError),
        _ColorItem('errorContainer', colorScheme.errorContainer),
        _ColorItem('onErrorContainer', colorScheme.onErrorContainer),
      ]),
      _ColorGroup('Surface', [
        _ColorItem('surface', colorScheme.surface),
        _ColorItem('onSurface', colorScheme.onSurface),
        _ColorItem('surfaceDim', colorScheme.surfaceDim),
        _ColorItem('surfaceBright', colorScheme.surfaceBright),
        _ColorItem('surfaceContainerLowest', colorScheme.surfaceContainerLowest),
        _ColorItem('surfaceContainerLow', colorScheme.surfaceContainerLow),
        _ColorItem('surfaceContainer', colorScheme.surfaceContainer),
        _ColorItem('surfaceContainerHigh', colorScheme.surfaceContainerHigh),
        _ColorItem('surfaceContainerHighest', colorScheme.surfaceContainerHighest),
        _ColorItem('onSurfaceVariant', colorScheme.onSurfaceVariant),
      ]),
      _ColorGroup('Outline', [
        _ColorItem('outline', colorScheme.outline),
        _ColorItem('outlineVariant', colorScheme.outlineVariant),
      ]),
      _ColorGroup('Other', [
        _ColorItem('shadow', colorScheme.shadow),
        _ColorItem('scrim', colorScheme.scrim),
        _ColorItem('inverseSurface', colorScheme.inverseSurface),
        _ColorItem('onInverseSurface', colorScheme.onInverseSurface),
        _ColorItem('inversePrimary', colorScheme.inversePrimary),
        _ColorItem('surfaceTint', colorScheme.surfaceTint),
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
                childAspectRatio: 2.5,
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

  _ColorItem(this.name, this.color);
}

class _ColorCard extends StatelessWidget {
  final _ColorItem colorItem;

  const _ColorCard({required this.colorItem});

  @override
  Widget build(BuildContext context) {
    final luminance = colorItem.color.computeLuminance();
    final textColor = luminance > 0.5 ? Colors.black : Colors.white;

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
              color: textColor,
              fontWeight: .bold,
              fontSize: 12,
            ),
          ),
          Text(
            '#${colorItem.color.toHex()}',
            style: TextStyle(
              color: textColor.withValues(alpha: 0.7),
              fontSize: 10,
            ),
          ),
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
