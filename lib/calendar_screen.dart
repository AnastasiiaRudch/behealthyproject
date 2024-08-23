import 'package:behealthyproject/custom_button.dart';
import 'package:flutter/material.dart';
import 'package:table_calendar/table_calendar.dart';
import 'calendar_model.dart';
import 'calendarstate_container.dart';
import 'event_card.dart';
import 'task_card.dart';

class CalendarScreen extends StatelessWidget {
  CalendarScreen({super.key});

  final CalendarFormat _calendarFormat = CalendarFormat.month;
  DateTime _focusedDay = DateTime.now();

  @override
  Widget build(BuildContext context) {
    final container = CalendarStateContainer.of(context);
    if (container == null) return const SizedBox.shrink();

    final calendarState = container.calendarState;

    print("CalendarScreen opened");
    print("Selected Day: ${calendarState.selectedDay}");
    print("Focused Day: $_focusedDay");

    // Initialize workouts with the selected day's workouts on first render
    // receive workouts for the selected day from the container
    List<String>? workouts = calendarState.workoutEvents[calendarState.selectedDay] ?? [];
    print("workouts on Selected Day: $workouts");
    String title = calendarState.selectedProgramButtonIndex == 0 ? 'Workouts' : 'Tasks';

    return Scaffold(
      appBar: AppBar(
        title: Row(
          children: [
            CustomButton(
              text: 'My Calendar',
              isSelected: calendarState.selectedAppButtonIndex == 0,
              onPressed: () {
                calendarState.updateAppButtonIndex(0);
              },
            ),
            const SizedBox(width: 10),
            CustomButton(
              text: 'Appointment',
              isSelected: calendarState.selectedAppButtonIndex == 1,
              onPressed: () {
                calendarState.updateAppButtonIndex(1);
              },
            ),
          ],
        ),
      ),
      body: ListView(
        padding: EdgeInsets.zero,
        children: [
          TableCalendar(
            firstDay: DateTime.utc(2020, 1, 1),
            lastDay: DateTime.utc(2030, 12, 31),
            focusedDay: _focusedDay,
            calendarFormat: _calendarFormat,
            selectedDayPredicate: (day) {
              return isSameDay(calendarState.selectedDay, day);
            },
            onDaySelected: (selectedDay, focusedDay) {
              calendarState.updateSelectedDay(selectedDay);
              _focusedDay = focusedDay;
              print("Focused Day: $_focusedDay");
              // Explicitly update workouts for the selected day
              workouts = calendarState.workoutEvents[selectedDay];
              print("Workouts for selected day: $workouts");
            },
            eventLoader: (day) {
              List<Widget> eventIcons = calendarState.events[day] ?? [];
              // If there is workout on chosen date, add Icon
              if (calendarState.workoutEvents.containsKey(day)) {
                // Check if the fitness icon is already in the list
                bool hasFitnessIcon = eventIcons.any((icon) => icon is Icon && (icon as Icon).icon == Icons.fitness_center);

                if (!hasFitnessIcon) {
                  eventIcons.add(const Icon(Icons.fitness_center));
                }
              }

              return eventIcons;
            },
            calendarStyle: const CalendarStyle(
              markerDecoration: BoxDecoration(
                color: Colors.transparent,// Icons instead of dots in calendar
              ),
              markersMaxCount: 3,// Amount of markers on date
            ),
            calendarBuilders: CalendarBuilders(
              markerBuilder: (context, date, events) {
                if (events.isEmpty) return const SizedBox();
                return Row(
                  mainAxisSize: MainAxisSize.min,
                  children: events.map((event) {
                    return Flexible(
                      child: Container(
                        padding: const EdgeInsets.symmetric(horizontal: 2.0),
                        child: event is Widget ? event : const SizedBox(),
                      ),
                    );
                  }).toList(),
                );
              },
            ),
          ),
          const SizedBox(height: 20),
          const Padding(
            padding: EdgeInsets.symmetric(horizontal: 16.0),
            child: Align(
              alignment: Alignment.centerLeft,
              child: Text(
                'Program:',
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              ),
            ),
          ),
          const SizedBox(height: 10),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16.0),
            child: Row(
              children: [
                CustomButton(
                  text: 'Workouts',
                  isSelected: calendarState.selectedProgramButtonIndex == 0,
                  onPressed: () {
                    calendarState.updateProgramButtonIndex(0);
                  },
                ),
                const SizedBox(width: 10),
                CustomButton(
                  text: 'Tasks',
                  isSelected: calendarState.selectedProgramButtonIndex == 1,
                  onPressed: () {
                    calendarState.updateProgramButtonIndex(1);
                  },
                ),
              ],
            ),
          ),
          const SizedBox(height: 20),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  title,
                  style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                ),
                IconButton(
                  icon: const Icon(Icons.add_circle, color: Colors.black),
                  onPressed: () {
                    // Action on Add push
                  },
                ),
              ],
            ),
          ),
          // List of Workouts/Tasks under Calendar
          _buildProgramContent(calendarState, workouts),
          const SizedBox(height: 20),
        ],
      ),
    );
  }

  Widget _buildProgramContent(CalendarModel calendarState, List<String>? workouts) {
    return calendarState.selectedProgramButtonIndex == 0
        ? Column(
      children: workouts?.map((workout) => EventCard(eventTitle: workout)).toList() ?? [],
    )
        : Column(
      children: calendarState.tasks.map((task) {
        return TaskCard(
          taskName: task['name'],
          isDone: task['isDone'],
          onToggle: () {
            calendarState.updateTaskStatus(task);
          },
        );
      }).toList(),
    );
  }
}

