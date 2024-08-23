import 'package:flutter/cupertino.dart';

class CalendarModel {
  int selectedAppButtonIndex;
  int selectedProgramButtonIndex;
  DateTime selectedDay;
  Map<DateTime, List<Widget>> events;
  Map<DateTime, List<String>> workoutEvents;
  List<Map<String, dynamic>> tasks;

  CalendarModel({
    required this.selectedAppButtonIndex,
    required this.selectedProgramButtonIndex,
    required this.selectedDay,
    required this.events,
    required this.workoutEvents,
    required this.tasks,
  });

  void updateAppButtonIndex(int index) {
    selectedAppButtonIndex = index;
  }

  void updateProgramButtonIndex(int index) {
    selectedProgramButtonIndex = index;
  }

  void updateSelectedDay(DateTime day) {
    selectedDay = day;
  }

  void updateTaskStatus(Map<String, dynamic> task) {
    final index = tasks.indexWhere((t) => t['name'] == task['name']);
    if (index != -1) {
      tasks[index] = {
        ...tasks[index],
        'isDone': !tasks[index]['isDone'],
      };
    }
  }
}
