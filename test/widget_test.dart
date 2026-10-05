// This is a basic Flutter widget test.
//
// To perform an interaction with a widget in your test, use the WidgetTester
// utility in the flutter_test package. For example, you can send tap and scroll
// gestures. You can also use WidgetTester to find child widgets in the widget
// tree, read text, and verify that the values of widget properties are correct.

import 'package:flutter_test/flutter_test.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'package:shalwar_kameez_tailor/main.dart';

void main() {
  testWidgets('App renders smoke test', (WidgetTester tester) async {
    // Build our app wrapped in ProviderScope and trigger a frame.
    await tester.pumpWidget(const ProviderScope(child: TailorApp()));

    // Verify that the main title is present.
    expect(find.text('Shalwar Kameez Tailor'), findsOneWidget);
  });
}
