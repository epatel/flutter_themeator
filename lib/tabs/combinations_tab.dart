import 'package:flutter/material.dart';

class CombinationsTab extends StatelessWidget {
  const CombinationsTab({super.key});

  @override
  Widget build(BuildContext context) {
    final colorScheme = Theme.of(context).colorScheme;

    final combinations = [
      _Combination('Primary', colorScheme.primary, colorScheme.onPrimary),
      _Combination('Primary Container', colorScheme.primaryContainer, colorScheme.onPrimaryContainer),
      _Combination('Secondary', colorScheme.secondary, colorScheme.onSecondary),
      _Combination('Secondary Container', colorScheme.secondaryContainer, colorScheme.onSecondaryContainer),
      _Combination('Tertiary', colorScheme.tertiary, colorScheme.onTertiary),
      _Combination('Tertiary Container', colorScheme.tertiaryContainer, colorScheme.onTertiaryContainer),
      _Combination('Error', colorScheme.error, colorScheme.onError),
      _Combination('Error Container', colorScheme.errorContainer, colorScheme.onErrorContainer),
      _Combination('Surface', colorScheme.surface, colorScheme.onSurface),
      _Combination('Surface Dim', colorScheme.surfaceDim, colorScheme.onSurface),
      _Combination('Surface Bright', colorScheme.surfaceBright, colorScheme.onSurface),
      _Combination('Surface Container Lowest', colorScheme.surfaceContainerLowest, colorScheme.onSurface),
      _Combination('Surface Container Low', colorScheme.surfaceContainerLow, colorScheme.onSurface),
      _Combination('Surface Container', colorScheme.surfaceContainer, colorScheme.onSurface),
      _Combination('Surface Container High', colorScheme.surfaceContainerHigh, colorScheme.onSurface),
      _Combination('Surface Container Highest', colorScheme.surfaceContainerHighest, colorScheme.onSurface),
      _Combination('Inverse Surface', colorScheme.inverseSurface, colorScheme.onInverseSurface),
    ];

    return ListView.builder(
      padding: const EdgeInsets.all(16),
      itemCount: combinations.length,
      itemBuilder: (context, index) {
        final combo = combinations[index];
        return _CombinationCard(combination: combo);
      },
    );
  }
}

class _Combination {
  final String name;
  final Color background;
  final Color foreground;

  _Combination(this.name, this.background, this.foreground);
}

class _CombinationCard extends StatelessWidget {
  final _Combination combination;

  const _CombinationCard({required this.combination});

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;

    return Container(
      margin: const EdgeInsets.only(bottom: 12),
      decoration: BoxDecoration(
        color: combination.background,
        borderRadius: BorderRadius.circular(12),
        border: Border.all(color: Theme.of(context).colorScheme.outline),
      ),
      padding: const EdgeInsets.all(16),
      child: Column(
        crossAxisAlignment: .start,
        children: [
          Text(
            combination.name,
            style: textTheme.titleMedium?.copyWith(
              color: combination.foreground,
              fontWeight: .bold,
            ),
          ),
          const SizedBox(height: 8),
          Text(
            'Headline',
            style: textTheme.headlineSmall?.copyWith(color: combination.foreground),
          ),
          const SizedBox(height: 4),
          Text(
            'Body text demonstrating readability on this background color. The quick brown fox jumps over the lazy dog.',
            style: textTheme.bodyMedium?.copyWith(color: combination.foreground),
          ),
          const SizedBox(height: 8),
          Text(
            'Label · Caption · Small text',
            style: textTheme.labelSmall?.copyWith(
              color: combination.foreground.withValues(alpha: 0.7),
            ),
          ),
        ],
      ),
    );
  }
}
