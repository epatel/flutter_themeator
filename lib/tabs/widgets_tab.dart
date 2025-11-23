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
              child: Surface.primary(
                padding: const EdgeInsets.all(12),
                borderRadius: BorderRadius.circular(8),
                child: const _SampleContent(),
              ),
            ),
            _VariantCard(
              label: 'Surface.primaryContainer',
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
              child: Surface.primaryFixed(
                padding: const EdgeInsets.all(12),
                borderRadius: BorderRadius.circular(8),
                child: const _SampleContent(),
              ),
            ),
            _VariantCard(
              label: 'Surface.primaryFixedDim',
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
              child: Surface.secondary(
                padding: const EdgeInsets.all(12),
                borderRadius: BorderRadius.circular(8),
                child: const _SampleContent(),
              ),
            ),
            _VariantCard(
              label: 'Surface.secondaryContainer',
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
              child: Surface.secondaryFixed(
                padding: const EdgeInsets.all(12),
                borderRadius: BorderRadius.circular(8),
                child: const _SampleContent(),
              ),
            ),
            _VariantCard(
              label: 'Surface.secondaryFixedDim',
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
              child: Surface.tertiary(
                padding: const EdgeInsets.all(12),
                borderRadius: BorderRadius.circular(8),
                child: const _SampleContent(),
              ),
            ),
            _VariantCard(
              label: 'Surface.tertiaryContainer',
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
              child: Surface.tertiaryFixed(
                padding: const EdgeInsets.all(12),
                borderRadius: BorderRadius.circular(8),
                child: const _SampleContent(),
              ),
            ),
            _VariantCard(
              label: 'Surface.tertiaryFixedDim',
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
              child: Surface.error(
                padding: const EdgeInsets.all(12),
                borderRadius: BorderRadius.circular(8),
                child: const _SampleContent(),
              ),
            ),
            _VariantCard(
              label: 'Surface.errorContainer',
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
  final Widget child;
  const _VariantCard({required this.label, required this.child});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(label, style: Theme.of(context).textTheme.labelSmall),
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
