import 'package:flutter/material.dart';

Map<DateTime, List<Widget>> getInitialEvents() {
  return {
    DateTime.utc(2024, 8, 10): [
      const Icon(Icons.fitness_center),
      const Icon(Icons.check),
    ],
    DateTime.utc(2024, 8, 11): [const Icon(Icons.cake)],
  };
}

Map<DateTime, List<String>> getInitialWorkoutEvents() {
  return {
    DateTime.utc(2024, 8, 10): ['Upper Body', 'Leg Day'],
    DateTime.utc(2024, 8, 12): ['Cardio Workout'],
    DateTime.utc(2024, 8, 19): ['Cardio Workout'],
  };
}

List<Map<String, dynamic>> getInitialTasks() {
  return [
    {'name': 'Everyday Walk', 'isDone': false},
    {'name': 'Vegetables', 'isDone': false},
    {'name': 'Drink Water', 'isDone': true},
  ];
}
