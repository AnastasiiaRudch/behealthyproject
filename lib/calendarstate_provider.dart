import 'package:flutter/material.dart';

import 'calendarstate_container.dart';

class CalendarStateProvider extends StatefulWidget {
  final Widget child;

  const CalendarStateProvider({super.key, required this.child});

  @override
  _CalendarStateProviderState createState() => _CalendarStateProviderState();
}

class _CalendarStateProviderState extends State<CalendarStateProvider> {
  int _selectedAppButtonIndex = 0;
  int _selectedProgramButtonIndex = 0;
  DateTime _selectedDay = DateTime.now();

  final Map<DateTime, List<Widget>> _events = {
    DateTime.utc(2024, 8, 10): [
      const Icon(Icons.fitness_center),
      const Icon(Icons.check)
    ],
    DateTime.utc(2024, 8, 11): [const Icon(Icons.cake)],
  };

  final Map<DateTime, List<String>> _workoutEvents = {
    DateTime.utc(2024, 8, 10): ['Upper Body', 'Leg Day'],
    DateTime.utc(2024, 8, 12): ['Cardio Workout'],
    DateTime.utc(2024, 8, 19): ['Cardio Workout'],
  };

  late List<Map<String, dynamic>> _tasks = [
    {'name': 'Everyday Walk', 'isDone': false},
    {'name': 'Vegetables', 'isDone': false},
    {'name': 'Drink Water', 'isDone': true},
  ];

  // new object in the same list
  void updateTaskStatus(Map<String, dynamic> task) {
    final index = _tasks.indexWhere((t) => t['name'] == task['name']);
    if (index != -1) {
      setState(() {
        // Create a copy of the list so that InheritedWidget notices the changes
        _tasks = List.from(_tasks);
        _tasks[index] = {
          ..._tasks[index], // save all old values
          'isDone': !_tasks[index]['isDone'], // change task status
        };
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return CalendarStateContainer(
      selectedAppButtonIndex: _selectedAppButtonIndex,
      selectedProgramButtonIndex: _selectedProgramButtonIndex,
      selectedDay: _selectedDay,
      events: _events,
      workoutEvents: _workoutEvents,
      tasks: _tasks,
      onAppButtonChanged: (index) {
        setState(() {
          _selectedAppButtonIndex = index;
        });
      },
      onProgramButtonChanged: (index) {
        setState(() {
          _selectedProgramButtonIndex = index;
        });
      },
      onDayChanged: (day) {
        setState(() {
          _selectedDay = day!;
        });
      },
      onTaskStatusChanged: updateTaskStatus,
      child: widget.child,
    );
  }
}
