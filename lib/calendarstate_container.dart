import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';

import 'calendar_model.dart';

class CalendarStateContainer extends InheritedWidget {
  final CalendarModel calendarState;

  const CalendarStateContainer({
    super.key,
    required this.calendarState,
    required super.child,
  });

  static CalendarStateContainer? of(BuildContext context) {
    return context.dependOnInheritedWidgetOfExactType<CalendarStateContainer>();
  }

  @override
  bool updateShouldNotify(CalendarStateContainer oldWidget) {
    return calendarState.selectedDay != oldWidget.calendarState.selectedDay ||
        calendarState.selectedAppButtonIndex != oldWidget.calendarState.selectedAppButtonIndex ||
        calendarState.selectedProgramButtonIndex != oldWidget.calendarState.selectedProgramButtonIndex ||
        calendarState.tasks != oldWidget.calendarState.tasks ||
        calendarState.workoutEvents != oldWidget.calendarState.workoutEvents;
  }

}
