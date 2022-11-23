import 'package:flutter/foundation.dart';

class Workout {
  String id;
  List<Exercise> execises;
  Workout({
    required this.id,
    required this.execises,
  });

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is Workout &&
        other.id == id &&
        listEquals(other.execises, execises);
  }

  @override
  int get hashCode => id.hashCode ^ execises.hashCode;
}

class Exercise {
  String? id;
  String? exercise;
  String? weigth;
  String? repititions;
  Exercise({
    required this.id,
    required this.exercise,
    required this.weigth,
    required this.repititions,
  });
  static Exercise empty() {
    return Exercise(
      id: null,
      exercise: null,
      weigth: null,
      repititions: null,
    );
  }
}

extension WorkoutExtension on Workout {
  Workout filterEmpty() {
    return Workout(
      id: id,
      execises: execises
          .where(
            (element) =>
                element.exercise != null &&
                element.weigth != null &&
                element.repititions != null,
          )
          .toList(),
    );
  }
}
