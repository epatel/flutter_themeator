import 'package:flutter/material.dart';

enum SurfaceType { standard, primary, secondary, tertiary, error }

enum SurfaceMode { standard, container, fixed, fixedDim }

class Surface extends StatelessWidget {
  final SurfaceType type;
  final SurfaceMode mode;
  final Widget child;
  final EdgeInsetsGeometry? padding;
  final BorderRadiusGeometry? borderRadius;

  const Surface({
    super.key,
    this.type = SurfaceType.standard,
    this.mode = SurfaceMode.standard,
    required this.child,
    this.padding,
    this.borderRadius,
  });

  // Surface factories
  factory Surface.standard({
    Key? key,
    required Widget child,
    EdgeInsetsGeometry? padding,
    BorderRadiusGeometry? borderRadius,
  }) => Surface(
    key: key,
    type: .standard,
    mode: .standard,
    padding: padding,
    borderRadius: borderRadius,
    child: child,
  );

  factory Surface.standardContainer({
    Key? key,
    required Widget child,
    EdgeInsetsGeometry? padding,
    BorderRadiusGeometry? borderRadius,
  }) => Surface(
    key: key,
    type: .standard,
    mode: .container,
    padding: padding,
    borderRadius: borderRadius,
    child: child,
  );

  factory Surface.standardFixed({
    Key? key,
    required Widget child,
    EdgeInsetsGeometry? padding,
    BorderRadiusGeometry? borderRadius,
  }) => Surface(
    key: key,
    type: .standard,
    mode: .fixed,
    padding: padding,
    borderRadius: borderRadius,
    child: child,
  );

  factory Surface.standardFixedDim({
    Key? key,
    required Widget child,
    EdgeInsetsGeometry? padding,
    BorderRadiusGeometry? borderRadius,
  }) => Surface(
    key: key,
    type: .standard,
    mode: .fixedDim,
    padding: padding,
    borderRadius: borderRadius,
    child: child,
  );

  // Primary factories
  factory Surface.primary({
    Key? key,
    required Widget child,
    EdgeInsetsGeometry? padding,
    BorderRadiusGeometry? borderRadius,
  }) => Surface(
    key: key,
    type: .primary,
    mode: .standard,
    padding: padding,
    borderRadius: borderRadius,
    child: child,
  );

  factory Surface.primaryContainer({
    Key? key,
    required Widget child,
    EdgeInsetsGeometry? padding,
    BorderRadiusGeometry? borderRadius,
  }) => Surface(
    key: key,
    type: .primary,
    mode: .container,
    padding: padding,
    borderRadius: borderRadius,
    child: child,
  );

  factory Surface.primaryFixed({
    Key? key,
    required Widget child,
    EdgeInsetsGeometry? padding,
    BorderRadiusGeometry? borderRadius,
  }) => Surface(
    key: key,
    type: .primary,
    mode: .fixed,
    padding: padding,
    borderRadius: borderRadius,
    child: child,
  );

  factory Surface.primaryFixedDim({
    Key? key,
    required Widget child,
    EdgeInsetsGeometry? padding,
    BorderRadiusGeometry? borderRadius,
  }) => Surface(
    key: key,
    type: .primary,
    mode: .fixedDim,
    padding: padding,
    borderRadius: borderRadius,
    child: child,
  );

  // Secondary factories
  factory Surface.secondary({
    Key? key,
    required Widget child,
    EdgeInsetsGeometry? padding,
    BorderRadiusGeometry? borderRadius,
  }) => Surface(
    key: key,
    type: .secondary,
    mode: .standard,
    padding: padding,
    borderRadius: borderRadius,
    child: child,
  );

  factory Surface.secondaryContainer({
    Key? key,
    required Widget child,
    EdgeInsetsGeometry? padding,
    BorderRadiusGeometry? borderRadius,
  }) => Surface(
    key: key,
    type: .secondary,
    mode: .container,
    padding: padding,
    borderRadius: borderRadius,
    child: child,
  );

  factory Surface.secondaryFixed({
    Key? key,
    required Widget child,
    EdgeInsetsGeometry? padding,
    BorderRadiusGeometry? borderRadius,
  }) => Surface(
    key: key,
    type: .secondary,
    mode: .fixed,
    padding: padding,
    borderRadius: borderRadius,
    child: child,
  );

  factory Surface.secondaryFixedDim({
    Key? key,
    required Widget child,
    EdgeInsetsGeometry? padding,
    BorderRadiusGeometry? borderRadius,
  }) => Surface(
    key: key,
    type: .secondary,
    mode: .fixedDim,
    padding: padding,
    borderRadius: borderRadius,
    child: child,
  );

  // Tertiary factories
  factory Surface.tertiary({
    Key? key,
    required Widget child,
    EdgeInsetsGeometry? padding,
    BorderRadiusGeometry? borderRadius,
  }) => Surface(
    key: key,
    type: .tertiary,
    mode: .standard,
    padding: padding,
    borderRadius: borderRadius,
    child: child,
  );

  factory Surface.tertiaryContainer({
    Key? key,
    required Widget child,
    EdgeInsetsGeometry? padding,
    BorderRadiusGeometry? borderRadius,
  }) => Surface(
    key: key,
    type: .tertiary,
    mode: .container,
    padding: padding,
    borderRadius: borderRadius,
    child: child,
  );

  factory Surface.tertiaryFixed({
    Key? key,
    required Widget child,
    EdgeInsetsGeometry? padding,
    BorderRadiusGeometry? borderRadius,
  }) => Surface(
    key: key,
    type: .tertiary,
    mode: .fixed,
    padding: padding,
    borderRadius: borderRadius,
    child: child,
  );

  factory Surface.tertiaryFixedDim({
    Key? key,
    required Widget child,
    EdgeInsetsGeometry? padding,
    BorderRadiusGeometry? borderRadius,
  }) => Surface(
    key: key,
    type: .tertiary,
    mode: .fixedDim,
    padding: padding,
    borderRadius: borderRadius,
    child: child,
  );

  // Error factories
  factory Surface.error({
    Key? key,
    required Widget child,
    EdgeInsetsGeometry? padding,
    BorderRadiusGeometry? borderRadius,
  }) => Surface(
    key: key,
    type: .error,
    mode: .standard,
    padding: padding,
    borderRadius: borderRadius,
    child: child,
  );

  factory Surface.errorContainer({
    Key? key,
    required Widget child,
    EdgeInsetsGeometry? padding,
    BorderRadiusGeometry? borderRadius,
  }) => Surface(
    key: key,
    type: .error,
    mode: .container,
    padding: padding,
    borderRadius: borderRadius,
    child: child,
  );

  (Color background, Color foreground) _resolveColors(ColorScheme colorScheme) {
    return switch ((type, mode)) {
      (SurfaceType.standard, SurfaceMode.standard) => (
        colorScheme.surface,
        colorScheme.onSurface,
      ),
      (SurfaceType.standard, SurfaceMode.container) => (
        colorScheme.surfaceContainer,
        colorScheme.onSurface,
      ),
      (SurfaceType.standard, SurfaceMode.fixed) => (
        colorScheme.surface,
        colorScheme.onSurface,
      ),
      (SurfaceType.standard, SurfaceMode.fixedDim) => (
        colorScheme.surfaceDim,
        colorScheme.onSurfaceVariant,
      ),
      (SurfaceType.primary, SurfaceMode.standard) => (
        colorScheme.primary,
        colorScheme.onPrimary,
      ),
      (SurfaceType.primary, SurfaceMode.container) => (
        colorScheme.primaryContainer,
        colorScheme.onPrimaryContainer,
      ),
      (SurfaceType.primary, SurfaceMode.fixed) => (
        colorScheme.primaryFixed,
        colorScheme.onPrimaryFixed,
      ),
      (SurfaceType.primary, SurfaceMode.fixedDim) => (
        colorScheme.primaryFixedDim,
        colorScheme.onPrimaryFixedVariant,
      ),
      // Secondary
      (SurfaceType.secondary, SurfaceMode.standard) => (
        colorScheme.secondary,
        colorScheme.onSecondary,
      ),
      (SurfaceType.secondary, SurfaceMode.container) => (
        colorScheme.secondaryContainer,
        colorScheme.onSecondaryContainer,
      ),
      (SurfaceType.secondary, SurfaceMode.fixed) => (
        colorScheme.secondaryFixed,
        colorScheme.onSecondaryFixed,
      ),
      (SurfaceType.secondary, SurfaceMode.fixedDim) => (
        colorScheme.secondaryFixedDim,
        colorScheme.onSecondaryFixedVariant,
      ),
      // Tertiary
      (SurfaceType.tertiary, SurfaceMode.standard) => (
        colorScheme.tertiary,
        colorScheme.onTertiary,
      ),
      (SurfaceType.tertiary, SurfaceMode.container) => (
        colorScheme.tertiaryContainer,
        colorScheme.onTertiaryContainer,
      ),
      (SurfaceType.tertiary, SurfaceMode.fixed) => (
        colorScheme.tertiaryFixed,
        colorScheme.onTertiaryFixed,
      ),
      (SurfaceType.tertiary, SurfaceMode.fixedDim) => (
        colorScheme.tertiaryFixedDim,
        colorScheme.onTertiaryFixedVariant,
      ),
      // Error
      (SurfaceType.error, SurfaceMode.standard) => (
        colorScheme.error,
        colorScheme.onError,
      ),
      (SurfaceType.error, SurfaceMode.container) => (
        colorScheme.errorContainer,
        colorScheme.onErrorContainer,
      ),
      (SurfaceType.error, SurfaceMode.fixed) => (
        colorScheme.error,
        colorScheme.onError,
      ),
      (SurfaceType.error, SurfaceMode.fixedDim) => (
        colorScheme.error,
        colorScheme.onError,
      ),
    };
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final colorScheme = theme.colorScheme;
    final (background, foreground) = _resolveColors(colorScheme);

    final overrideTheme = theme.copyWith(
      colorScheme: colorScheme.copyWith(
        surface: background,
        onSurface: foreground,
      ),
      textTheme: theme.textTheme.apply(
        bodyColor: foreground,
        displayColor: foreground,
      ),
      iconTheme: theme.iconTheme.copyWith(color: foreground),
    );

    return Container(
      decoration: BoxDecoration(
        color: background,
        borderRadius: borderRadius,
      ),
      padding: padding,
      child: Theme(
        data: overrideTheme,
        child: DefaultTextStyle.merge(
          style: TextStyle(color: foreground),
          child: IconTheme.merge(
            data: IconThemeData(color: foreground),
            child: child,
          ),
        ),
      ),
    );
  }
}
