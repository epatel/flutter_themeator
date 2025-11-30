import 'package:flutter/material.dart';

class TextThemesTab extends StatelessWidget {
  const TextThemesTab({super.key});

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;

    final textStyles = [
      _TextStyleItem('displayLarge', textTheme.displayLarge),
      _TextStyleItem('displayMedium', textTheme.displayMedium),
      _TextStyleItem('displaySmall', textTheme.displaySmall),
      _TextStyleItem('headlineLarge', textTheme.headlineLarge),
      _TextStyleItem('headlineMedium', textTheme.headlineMedium),
      _TextStyleItem('headlineSmall', textTheme.headlineSmall),
      _TextStyleItem('titleLarge', textTheme.titleLarge),
      _TextStyleItem('titleMedium', textTheme.titleMedium),
      _TextStyleItem('titleSmall', textTheme.titleSmall),
      _TextStyleItem('bodyLarge', textTheme.bodyLarge),
      _TextStyleItem('bodyMedium', textTheme.bodyMedium),
      _TextStyleItem('bodySmall', textTheme.bodySmall),
      _TextStyleItem('labelLarge', textTheme.labelLarge),
      _TextStyleItem('labelMedium', textTheme.labelMedium),
      _TextStyleItem('labelSmall', textTheme.labelSmall),
    ];

    return ListView.builder(
      padding: const EdgeInsets.all(16),
      itemCount: textStyles.length,
      itemBuilder: (context, index) {
        final item = textStyles[index];
        return _TextStyleCard(item: item);
      },
    );
  }
}

class _TextStyleItem {
  final String name;
  final TextStyle? style;

  _TextStyleItem(this.name, this.style);
}

class _TextStyleCard extends StatelessWidget {
  final _TextStyleItem item;

  const _TextStyleCard({required this.item});

  @override
  Widget build(BuildContext context) {
    final colorScheme = Theme.of(context).colorScheme;

    return Card(
      margin: const EdgeInsets.only(bottom: 12),
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: .start,
          children: [
            Row(
              children: [
                Container(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 8,
                    vertical: 4,
                  ),
                  decoration: BoxDecoration(
                    color: colorScheme.primaryContainer,
                    borderRadius: BorderRadius.circular(4),
                  ),
                  child: Text(
                    item.name,
                    style: Theme.of(context).textTheme.labelMedium?.copyWith(
                      color: colorScheme.onPrimaryContainer,
                    ),
                  ),
                ),
                const Spacer(),
                if (item.style != null)
                  Text(
                    '${item.style!.fontSize?.toStringAsFixed(0) ?? '?'}px · ${_fontWeightName(item.style!.fontWeight)}',
                    style: Theme.of(context).textTheme.bodySmall?.copyWith(
                      color: colorScheme.onSurfaceVariant,
                    ),
                  ),
              ],
            ),
            const SizedBox(height: 12),
            Text(
              'The quick brown fox jumps over the lazy dog',
              style: TextStyle(
                fontFamily: item.style?.fontFamily,
                fontSize: item.style?.fontSize,
                fontWeight: item.style?.fontWeight,
                letterSpacing: item.style?.letterSpacing,
                height: item.style?.height,
                color: colorScheme.onSurface,
              ),
            ),
          ],
        ),
      ),
    );
  }

  String _fontWeightName(FontWeight? weight) {
    if (weight == null) return '?';
    return switch (weight) {
      FontWeight.w100 => 'Thin',
      FontWeight.w200 => 'ExtraLight',
      FontWeight.w300 => 'Light',
      FontWeight.w400 => 'Regular',
      FontWeight.w500 => 'Medium',
      FontWeight.w600 => 'SemiBold',
      FontWeight.w700 => 'Bold',
      FontWeight.w800 => 'ExtraBold',
      FontWeight.w900 => 'Black',
      _ => '?',
    };
  }
}
