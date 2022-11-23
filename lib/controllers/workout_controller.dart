import 'package:get/get.dart';

import '../data/models/workout.dart';

class WorkoutController extends GetxController {
  ///
  ///
  ///
  RxList<Workout> workoutList = <Workout>[].obs;

  ///
  ///
  ///
  void addWorkout(Workout workout) {
    if (workoutList.where((p0) => p0.id == workout.id).toList().isNotEmpty) {
      workoutList.removeWhere((p0) => p0.id == workout.id);
    }
    workoutList.add(workout);
  }

  ///
  ///
  ///
  void deleteWorkout(Workout workout) {
    workoutList.remove(workout);
  }
}
