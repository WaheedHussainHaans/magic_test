// This is a basic Flutter widget test.
//
// To perform an interaction with a widget in your test, use the WidgetTester
// utility in the flutter_test package. For example, you can send tap and scroll
// gestures. You can also use WidgetTester to find child widgets in the widget
// tree, read text, and verify that the values of widget properties are correct.

import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

import 'package:magic_test/screens/workout/workout.dart';

void main() {
  testWidgets('Test workout screen widget', (WidgetTester tester) async {
    await tester.pumpWidget(const MaterialApp(home: WorkoutScreen()));

    expect(find.text('Set 0'), findsOneWidget);

    // Tap the '+' icon and trigger a frame.
    await tester.tap(find.byIcon(Icons.add));
    await tester.pump();

    // Verify that our counter has incremented.
    expect(find.text('Set'), findsNothing);
    expect(find.text('Set 1'), findsOneWidget);
  });
}
