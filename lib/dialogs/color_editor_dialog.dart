import 'package:flex_color_picker/flex_color_picker.dart';
import 'package:flutter/material.dart';
import '../providers/color_scheme_provider.dart';

class ColorEditorDialog extends StatefulWidget {
  final String colorName;
  final Color initialColor;
  final String? onColorName;
  final Color? initialOnColor;
  final Brightness brightness;
  final ColorSchemeProvider provider;

  const ColorEditorDialog({
    super.key,
    required this.colorName,
    required this.initialColor,
    this.onColorName,
    this.initialOnColor,
    required this.brightness,
    required this.provider,
  });

  static Future<void> show({
    required BuildContext context,
    required String colorName,
    required Color initialColor,
    String? onColorName,
    Color? initialOnColor,
    required Brightness brightness,
    required ColorSchemeProvider provider,
  }) {
    return showDialog(
      context: context,
      builder: (context) => ColorEditorDialog(
        colorName: colorName,
        initialColor: initialColor,
        onColorName: onColorName,
        initialOnColor: initialOnColor,
        brightness: brightness,
        provider: provider,
      ),
    );
  }

  @override
  State<ColorEditorDialog> createState() => _ColorEditorDialogState();
}

class _ColorEditorDialogState extends State<ColorEditorDialog> {
  late Color _color;
  late Color? _onColor;
  bool _editingOnColor = false;

  @override
  void initState() {
    super.initState();
    _color = widget.initialColor;
    _onColor = widget.initialOnColor;
  }

  @override
  Widget build(BuildContext context) {
    final hasOnColor = widget.onColorName != null && _onColor != null;

    return Dialog(
      child: ConstrainedBox(
        constraints: const BoxConstraints(maxWidth: 400, maxHeight: 600),
        child: Padding(
          padding: const EdgeInsets.all(16),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Text(
                'Edit Color',
                style: Theme.of(context).textTheme.titleLarge,
              ),
              const SizedBox(height: 16),

              // Preview
              Container(
                height: 60,
                decoration: BoxDecoration(
                  color: _color,
                  borderRadius: BorderRadius.circular(8),
                  border: Border.all(
                    color: Theme.of(context).colorScheme.outline,
                  ),
                ),
                child: Center(
                  child: Text(
                    widget.colorName,
                    style: TextStyle(
                      color:
                          _onColor ??
                          (_color.computeLuminance() > 0.5
                              ? Colors.black
                              : Colors.white),
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ),
              const SizedBox(height: 16),

              // Toggle buttons for which color to edit
              if (hasOnColor) ...[
                SegmentedButton<bool>(
                  segments: [
                    ButtonSegment(
                      value: false,
                      label: Text(widget.colorName),
                    ),
                    ButtonSegment(
                      value: true,
                      label: Text(widget.onColorName!),
                    ),
                  ],
                  selected: {_editingOnColor},
                  onSelectionChanged: (selected) {
                    setState(() => _editingOnColor = selected.first);
                  },
                ),
                const SizedBox(height: 16),
              ],

              // Color picker
              Flexible(
                child: SingleChildScrollView(
                  child: ColorPicker(
                    color: _editingOnColor ? _onColor! : _color,
                    onColorChanged: (color) {
                      setState(() {
                        if (_editingOnColor) {
                          _onColor = color;
                        } else {
                          _color = color;
                        }
                      });
                    },
                    pickersEnabled: const {
                      ColorPickerType.wheel: true,
                      ColorPickerType.accent: false,
                      ColorPickerType.primary: true,
                      ColorPickerType.both: false,
                      ColorPickerType.bw: false,
                      ColorPickerType.custom: false,
                      ColorPickerType.customSecondary: false,
                    },
                    enableShadesSelection: true,
                    enableTonalPalette: true,
                    showColorCode: true,
                    colorCodeHasColor: true,
                    showColorName: true,
                    showRecentColors: true,
                    maxRecentColors: 10,
                    recentColors: const [],
                    heading: Text(
                      _editingOnColor
                          ? 'Select ${widget.onColorName}'
                          : 'Select ${widget.colorName}',
                      style: Theme.of(context).textTheme.titleSmall,
                    ),
                    subheading: Text(
                      'Select shade',
                      style: Theme.of(context).textTheme.titleSmall,
                    ),
                    tonalSubheading: Text(
                      'Tonal palette',
                      style: Theme.of(context).textTheme.titleSmall,
                    ),
                    wheelSubheading: Text(
                      'Selected color and shades',
                      style: Theme.of(context).textTheme.titleSmall,
                    ),
                  ),
                ),
              ),
              const SizedBox(height: 16),

              // Action buttons
              Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  TextButton(
                    onPressed: () => Navigator.of(context).pop(),
                    child: const Text('Cancel'),
                  ),
                  const SizedBox(width: 8),
                  FilledButton(
                    onPressed: _save,
                    child: const Text('Save'),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }

  Future<void> _save() async {
    await widget.provider.updateColor(
      widget.colorName,
      _color,
      widget.brightness,
    );

    if (widget.onColorName != null && _onColor != null) {
      await widget.provider.updateColor(
        widget.onColorName!,
        _onColor!,
        widget.brightness,
      );
    }

    if (mounted) {
      Navigator.of(context).pop();
    }
  }
}
