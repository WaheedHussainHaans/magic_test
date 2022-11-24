import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:magic_test/controllers/workout_controller.dart';
import 'package:magic_test/data/models/workout.dart';
import 'package:magic_test/screens/workout/workout_list.dart';
import 'package:magic_test/widgets/default_appbar.dart';
import 'package:magic_test/widgets/select_option.dart';
import 'package:magic_test/widgets/selection_field.dart';
import '../../widgets/primary_button.dart';

class WorkoutScreen extends StatefulWidget {
  final Workout? workout;
  const WorkoutScreen({super.key, this.workout});

  @override
  State<WorkoutScreen> createState() => _WorkoutScreenState();
}

class _WorkoutScreenState extends State<WorkoutScreen> {
  ///
  ///
  ///
  final WorkoutController workoutController = Get.put(WorkoutController());

  Workout workout = Workout(
    id: DateTime.now().microsecondsSinceEpoch.toString(),
    execises: [
      Exercise.empty(),
    ],
  );

  ///
  ///
  ///
  @override
  void initState() {
    if (widget.workout != null) {
      workout = widget.workout!;
    }
    super.initState();
  }

  ///
  ///
  ///
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const DefaultAppBar(
        title: 'Workout',
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            children: [
              ListView.builder(
                  itemCount: workout.execises.length,
                  physics: const NeverScrollableScrollPhysics(),
                  shrinkWrap: true,
                  itemBuilder: (context, index) {
                    return Column(
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              'Set $index',
                              style: Theme.of(context).textTheme.headline6,
                            ),
                            if (workout.execises.length > 1)
                              IconButton(
                                onPressed: () {
                                  if (workout.execises.length > 1) {
                                    workout.execises.removeAt(index);
                                    setState(() {});
                                  }
                                },
                                icon: const Icon(Icons.delete),
                              )
                          ],
                        ),
                        const SizedBox(
                          height: 12,
                        ),
                        SelectionField(
                          onPressed: () async {
                            workout.execises[index].exercise = await Get.to(
                              () => SelectOptionWidget(
                                options: const [
                                  'Barbell row',
                                  'Bench press',
                                  'Shoulder press,',
                                  'Deadlift',
                                  'Squat',
                                ],
                                selectedOption:
                                    workout.execises[index].exercise,
                                appbarTitle: 'Select Excercise',
                              ),
                            );
                            setState(() {});
                          },
                          selectionOption: workout.execises[index].exercise,
                          headingText: 'Select excercise',
                        ),
                        SelectionField(
                          onPressed: () async {
                            workout.execises[index].weigth = await Get.to(
                              () => SelectOptionWidget(
                                options: List.generate(
                                    100, (index) => '${index + 1}'),
                                selectedOption: workout.execises[index].weigth,
                                appbarTitle: 'Select Weight',
                              ),
                            );
                            setState(() {});
                          },
                          selectionOption: workout.execises[index].weigth,
                          headingText: 'Select weight',
                        ),
                        SelectionField(
                          onPressed: () async {
                            workout.execises[index].repititions = await Get.to(
                              () => SelectOptionWidget(
                                options: List.generate(
                                    100, (index) => '${index + 1}'),
                                selectedOption:
                                    workout.execises[index].repititions,
                                appbarTitle: 'Select Reps',
                              ),
                            );
                            setState(() {});
                          },
                          selectionOption: workout.execises[index].repititions,
                          headingText: 'Select repitions',
                        ),
                      ],
                    );
                  }),
              const SizedBox(
                height: 12,
              ),
              InkWell(
                key: const Key('Add set text'),
                onTap: () {
                  workout.execises.add(Exercise.empty());
                  setState(() {});
                },
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: const [
                    Text(
                      'Add set',
                    ),
                    Icon(
                      Icons.add,
                    ),
                  ],
                ),
              ),
              const SizedBox(
                height: 12,
              ),
              PrimaryButton(
                onPressed: () {
                  if (workout.filterEmpty().execises.isEmpty) {
                    Get.snackbar('Fields can not be empty', '');
                    return;
                  } else {
                    workoutController.addWorkout(
                      workout.filterEmpty(),
                    );
                    Get.to(WorkoutListScreen());
                    workout = Workout(
                      id: DateTime.now().microsecondsSinceEpoch.toString(),
                      execises: [
                        Exercise.empty(),
                      ],
                    );
                    setState(() {});
                  }
                },
                text: 'Add workout',
              ),
            ],
          ),
        ),
      ),
    );
  }
}
