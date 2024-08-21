import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';

class CalendarStateContainer extends InheritedWidget {
  final int
      selectedAppButtonIndex; //stores the index of the selected button in the AppBar
  final int selectedProgramButtonIndex;
  final DateTime selectedDay;
  final Map<DateTime, List<Widget>> events;
  final Map<DateTime, List<String>> workoutEvents;
  final List<Map<String, dynamic>> tasks;
  final ValueChanged<int>
      onAppButtonChanged; //a function that is called when selectedAppButtonIndex of this button changes.
  final ValueChanged<int> onProgramButtonChanged;
  final ValueChanged<DateTime?> onDayChanged;

  // final ValueChanged<Map<DateTime, List<Widget>>> onEventsChanged;
  // final ValueChanged<Map<DateTime, List<String>>> onWorkoutsChanged;
  final ValueChanged<Map<String, dynamic>> onTaskStatusChanged;

  // final bool taskChanged;

  const CalendarStateContainer({
    super.key,
    required this.selectedAppButtonIndex,
    required this.selectedProgramButtonIndex,
    required this.selectedDay,
    required this.events,
    required this.workoutEvents,
    required this.tasks,
    required this.onAppButtonChanged,
    required this.onProgramButtonChanged,
    required this.onDayChanged,
    // required this.onEventsChanged,
    // required this.onWorkoutsChanged,
    required this.onTaskStatusChanged,
    required super.child,
    // required this.taskChanged
  });

  static CalendarStateContainer? of(BuildContext context) {
    return context.dependOnInheritedWidgetOfExactType<CalendarStateContainer>();
  }

  @override
  bool updateShouldNotify(CalendarStateContainer oldWidget) {
    bool shouldNotify = selectedAppButtonIndex !=
            oldWidget.selectedAppButtonIndex ||
        selectedProgramButtonIndex != oldWidget.selectedProgramButtonIndex ||
        selectedDay != oldWidget.selectedDay ||
        tasks != oldWidget.tasks;
    workoutEvents != oldWidget.workoutEvents;
    return shouldNotify;
  }

  bool listEquals1(
      List<Map<String, dynamic>> list1, List<Map<String, dynamic>> list2) {
    if (list1.length != list2.length) return false;
    for (int i = 0; i < list1.length; i++) {
      if (list1[i]['name'] != list2[i]['name'] ||
          list1[i]['isDone'] != list2[i]['isDone']) {
        return false;
      }
    }
    return true;
  }
}
