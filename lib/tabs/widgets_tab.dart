import 'package:flutter/material.dart';
import '../widgets/surface.dart';

class WidgetsTab extends StatelessWidget {
  const WidgetsTab({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView(
      padding: const EdgeInsets.all(16),
      children: [
        Text('Surface Widget', style: Theme.of(context).textTheme.titleLarge),
        const SizedBox(height: 8),
        Text(
          'A container that sets a color scheme color as background and automatically styles all text and icons with the corresponding "on" color.',
          style: Theme.of(context).textTheme.bodyMedium,
        ),
        const SizedBox(height: 24),

        // Primary
        _SectionHeader('Primary'),
        const SizedBox(height: 8),
        _VariantRow(
          children: [
            _VariantCard(
              label: 'Surface.primary',
              useCase: 'FABs, prominent buttons, active states',
              child: Surface.primary(
                padding: const EdgeInsets.all(12),
                borderRadius: BorderRadius.circular(8),
                child: const _SampleContent(),
              ),
            ),
            _VariantCard(
              label: 'Surface.primaryContainer',
              useCase: 'Cards, input fields, tonal buttons',
              child: Surface.primaryContainer(
                padding: const EdgeInsets.all(12),
                borderRadius: BorderRadius.circular(8),
                child: const _SampleContent(),
              ),
            ),
          ],
        ),
        const SizedBox(height: 8),
        _VariantRow(
          children: [
            _VariantCard(
              label: 'Surface.primaryFixed',
              useCase: 'Headers that stay consistent across themes',
              child: Surface.primaryFixed(
                padding: const EdgeInsets.all(12),
                borderRadius: BorderRadius.circular(8),
                child: const _SampleContent(),
              ),
            ),
            _VariantCard(
              label: 'Surface.primaryFixedDim',
              useCase: 'Subtle fixed backgrounds, secondary headers',
              child: Surface.primaryFixedDim(
                padding: const EdgeInsets.all(12),
                borderRadius: BorderRadius.circular(8),
                child: const _SampleContent(),
              ),
            ),
          ],
        ),
        const SizedBox(height: 24),

        // Secondary
        _SectionHeader('Secondary'),
        const SizedBox(height: 8),
        _VariantRow(
          children: [
            _VariantCard(
              label: 'Surface.secondary',
              useCase: 'Filter chips, toggle buttons, less prominent actions',
              child: Surface.secondary(
                padding: const EdgeInsets.all(12),
                borderRadius: BorderRadius.circular(8),
                child: const _SampleContent(),
              ),
            ),
            _VariantCard(
              label: 'Surface.secondaryContainer',
              useCase: 'Selected items, navigation rail selection',
              child: Surface.secondaryContainer(
                padding: const EdgeInsets.all(12),
                borderRadius: BorderRadius.circular(8),
                child: const _SampleContent(),
              ),
            ),
          ],
        ),
        const SizedBox(height: 8),
        _VariantRow(
          children: [
            _VariantCard(
              label: 'Surface.secondaryFixed',
              useCase: 'Persistent UI elements, sidebars',
              child: Surface.secondaryFixed(
                padding: const EdgeInsets.all(12),
                borderRadius: BorderRadius.circular(8),
                child: const _SampleContent(),
              ),
            ),
            _VariantCard(
              label: 'Surface.secondaryFixedDim',
              useCase: 'Muted fixed backgrounds, footer sections',
              child: Surface.secondaryFixedDim(
                padding: const EdgeInsets.all(12),
                borderRadius: BorderRadius.circular(8),
                child: const _SampleContent(),
              ),
            ),
          ],
        ),
        const SizedBox(height: 24),

        // Tertiary
        _SectionHeader('Tertiary'),
        const SizedBox(height: 8),
        _VariantRow(
          children: [
            _VariantCard(
              label: 'Surface.tertiary',
              useCase: 'Accent elements, complementary highlights',
              child: Surface.tertiary(
                padding: const EdgeInsets.all(12),
                borderRadius: BorderRadius.circular(8),
                child: const _SampleContent(),
              ),
            ),
            _VariantCard(
              label: 'Surface.tertiaryContainer',
              useCase: 'Badges, tags, callout boxes',
              child: Surface.tertiaryContainer(
                padding: const EdgeInsets.all(12),
                borderRadius: BorderRadius.circular(8),
                child: const _SampleContent(),
              ),
            ),
          ],
        ),
        const SizedBox(height: 8),
        _VariantRow(
          children: [
            _VariantCard(
              label: 'Surface.tertiaryFixed',
              useCase: 'Promotional banners, feature highlights',
              child: Surface.tertiaryFixed(
                padding: const EdgeInsets.all(12),
                borderRadius: BorderRadius.circular(8),
                child: const _SampleContent(),
              ),
            ),
            _VariantCard(
              label: 'Surface.tertiaryFixedDim',
              useCase: 'Subtle accents, info panels',
              child: Surface.tertiaryFixedDim(
                padding: const EdgeInsets.all(12),
                borderRadius: BorderRadius.circular(8),
                child: const _SampleContent(),
              ),
            ),
          ],
        ),
        const SizedBox(height: 24),

        // Error
        _SectionHeader('Error'),
        const SizedBox(height: 8),
        _VariantRow(
          children: [
            _VariantCard(
              label: 'Surface.error',
              useCase: 'Critical alerts, destructive action buttons',
              child: Surface.error(
                padding: const EdgeInsets.all(12),
                borderRadius: BorderRadius.circular(8),
                child: const _SampleContent(),
              ),
            ),
            _VariantCard(
              label: 'Surface.errorContainer',
              useCase: 'Error messages, validation feedback, warnings',
              child: Surface.errorContainer(
                padding: const EdgeInsets.all(12),
                borderRadius: BorderRadius.circular(8),
                child: const _SampleContent(),
              ),
            ),
          ],
        ),
        const SizedBox(height: 24),

        // Usage example
        _SectionHeader('Usage with Theme.of(context)'),
        const SizedBox(height: 8),
        Surface.primary(
          padding: const EdgeInsets.all(16),
          borderRadius: BorderRadius.circular(12),
          child: Builder(
            builder: (context) => Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              spacing: 8,
              children: [
                Text(
                  'Headline',
                  style: Theme.of(context).textTheme.headlineSmall,
                ),
                const Text(
                  'When using Theme.of(context) inside a Surface, wrap your content in a Builder to get the overridden theme context.',
                ),
                Text(
                  'Label • Caption',
                  style: Theme.of(context).textTheme.labelSmall,
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}

class _SectionHeader extends StatelessWidget {
  final String title;
  const _SectionHeader(this.title);

  @override
  Widget build(BuildContext context) {
    return Text(
      title,
      style: Theme.of(context).textTheme.titleMedium?.copyWith(
        color: Theme.of(context).colorScheme.primary,
      ),
    );
  }
}

class _VariantRow extends StatelessWidget {
  final List<Widget> children;
  const _VariantRow({required this.children});

  @override
  Widget build(BuildContext context) {
    return Row(
      children:
          children
              .expand(
                (child) => [Expanded(child: child), const SizedBox(width: 8)],
              )
              .toList()
            ..removeLast(),
    );
  }
}

class _VariantCard extends StatelessWidget {
  final String label;
  final String? useCase;
  final Widget child;
  const _VariantCard({required this.label, this.useCase, required this.child});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(label, style: Theme.of(context).textTheme.labelSmall),
        if (useCase != null) ...[
          const SizedBox(height: 2),
          Text(
            useCase!,
            style: Theme.of(context).textTheme.bodySmall?.copyWith(
              color: Theme.of(context).colorScheme.onSurfaceVariant,
              fontSize: 11,
            ),
          ),
        ],
        const SizedBox(height: 4),
        child,
      ],
    );
  }
}

class _SampleContent extends StatelessWidget {
  const _SampleContent();

  @override
  Widget build(BuildContext context) {
    return const Row(
      children: [
        Icon(Icons.check, size: 18),
        SizedBox(width: 8),
        Expanded(child: Text('Sample text')),
      ],
    );
  }
}
