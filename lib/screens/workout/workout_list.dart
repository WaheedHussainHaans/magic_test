import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:magic_test/screens/workout/workout.dart';

import '../../controllers/workout_controller.dart';
import '../../data/models/workout.dart';
import '../../widgets/default_appbar.dart';

class WorkoutListScreen extends StatelessWidget {
  WorkoutListScreen({super.key});
  final WorkoutController workoutController = Get.find<WorkoutController>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const DefaultAppBar(
        title: 'Workout List',
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: ListView.builder(
          itemCount: workoutController.workoutList.length,
          itemBuilder: (context, index) {
            Workout workout = workoutController.workoutList[index];
            return Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text('Workout $index'),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: workout.execises
                      .map((exercise) => Text(
                          'Set ${workout.execises.indexOf(exercise)}: ${exercise.exercise} - ${exercise.weigth}kg, ${exercise.repititions} repetitions'))
                      .toList(),
                ),
                Row(
                  children: [
                    TextButton(
                      onPressed: () {
                        Get.to(() => WorkoutScreen(
                              workout: workout,
                            ));
                      },
                      child: const Text('Edit'),
                    )
                  ],
                )
              ],
            );
          },
        ),
      ),
    );
  }
}
