import 'package:flutter_test/flutter_test.dart';
import 'package:magic_test/data/models/workout.dart';

void main() {
  group('Unit Tests', () {
    test('check if the workout is empty returns empty', () {
      expect(Exercise.empty().id, null);
    });

    test('Check if the filtered list dont have the null values', () {
      final Workout workout = Workout(id: '1221', execises: [Exercise.empty()]);

      expect(workout.filterEmpty().execises.length, 0);
    });
  });
}
