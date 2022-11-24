import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:integration_test/integration_test.dart';

import 'package:magic_test/screens/workout/workout.dart';

void main() {
  IntegrationTestWidgetsFlutterBinding.ensureInitialized();

  group('end-to-end test', () {
    testWidgets('tap on the add set, verify no of sets', (tester) async {
      runApp(const MaterialApp(
        home: WorkoutScreen(),
      ));
      // app.main();
      await tester.pumpAndSettle();

      // Verify the inital text is Set 0.
      expect(find.text('Set 0'), findsOneWidget);

      // Finds the floating action button to tap on.
      final button = find.byKey(const Key('Add set text'));

      // Emulate a tap on the floating action button.
      await tester.tap(button);

      // Trigger a frame.
      await tester.pumpAndSettle();

      // Verify the counter increments by 1.
      expect(find.text('Set 1'), findsOneWidget);
    });
  });
}
