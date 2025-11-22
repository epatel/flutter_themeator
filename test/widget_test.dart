import 'package:flutter_test/flutter_test.dart';
import 'package:flutter_themeator/app.dart';

void main() {
  testWidgets('App renders with tabs', (WidgetTester tester) async {
    await tester.pumpWidget(const ThemeatorApp());

    expect(find.text('Flutter Themeator'), findsOneWidget);
    expect(find.text('Colors'), findsOneWidget);
    expect(find.text('Text'), findsOneWidget);
    expect(find.text('Combos'), findsOneWidget);
  });
}
