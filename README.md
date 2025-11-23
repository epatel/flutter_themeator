# Flutter Themeator

A Flutter demo app that showcases all Material 3 ColorScheme colors and TextTheme styles. Perfect for exploring theme combinations and testing custom color schemes.

## Features

- **Colors Tab**: View all 30+ ColorScheme properties with their corresponding "on" colors
- **Text Tab**: Preview all 15 TextTheme styles (displayLarge through labelSmall)
- **Combos Tab**: See text rendered on various background/foreground color combinations
- **Widgets Tab**: Demo of the Surface widget with all variants
- **Light/Dark Mode**: Toggle between light and dark themes
- **Color Editing**: Long-press any color to edit it with a color picker
- **Persistence**: Custom colors are saved to SharedPreferences

## Surface Widget

A convenience widget that automatically applies background and foreground colors from the theme:

```dart
// Primary surface with automatic text/icon coloring
Surface.primary(
  padding: EdgeInsets.all(16),
  borderRadius: BorderRadius.circular(8),
  child: Text('This text uses onPrimary color'),
)

// Available variants:
Surface.primary()
Surface.primaryContainer()
Surface.primaryFixed()
Surface.primaryFixedDim()
Surface.secondary()
Surface.secondaryContainer()
Surface.secondaryFixed()
Surface.secondaryFixedDim()
Surface.tertiary()
Surface.tertiaryContainer()
Surface.tertiaryFixed()
Surface.tertiaryFixedDim()
Surface.error()
Surface.errorContainer()
```

## Getting Started

```bash
flutter pub get
flutter run
```

## Testing

```bash
# Run all tests
flutter test

# Update golden files
flutter test --update-goldens
```

## Project Structure

```
lib/
├── main.dart                    # Entry point
├── app.dart                     # App configuration
├── theme_provider.dart          # Light/dark mode state
├── providers/
│   └── color_scheme_provider.dart  # Custom color management
├── services/
│   └── color_storage.dart       # SharedPreferences persistence
├── screens/
│   └── home_screen.dart         # Main tabbed interface
├── tabs/
│   ├── colors_tab.dart          # ColorScheme display
│   ├── text_themes_tab.dart     # TextTheme display
│   ├── combinations_tab.dart    # Color combinations
│   └── widgets_tab.dart         # Surface widget demos
├── widgets/
│   └── surface.dart             # Surface widget
└── dialogs/
    └── color_editor_dialog.dart # Color picker dialog
```

## Dependencies

- `shared_preferences` - Persist custom colors
- `flex_color_picker` - Color picker UI
