import 'package:behealthyproject/custom_button.dart';
import 'package:flutter/material.dart';
import 'package:table_calendar/table_calendar.dart';
import 'event_card.dart';
import 'task_card.dart';

class CalendarScreen extends StatefulWidget {
  const CalendarScreen({super.key});

  @override
  _CalendarScreenState createState() => _CalendarScreenState();
}

class _CalendarScreenState extends State<CalendarScreen> {
  final CalendarFormat _calendarFormat = CalendarFormat.month;
  DateTime _focusedDay = DateTime.now();
  DateTime? _selectedDay;
  int _selectedAppButtonIndex = 0; // Index of chosen button in appBar, 0 by default
  int _selectedProgramButtonIndex = 0; // Index of selected button in Program section

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
  };

  final List<Map<String, dynamic>> _tasks = [
    {'name': 'Everyday Walk', 'isDone': false},
    {'name': 'Vegetables', 'isDone': false},
    {'name': 'Drink Water', 'isDone': true},
  ];

  @override
  Widget build(BuildContext context) {
    List<String>? workouts =
    _workoutEvents[_selectedDay]; //Workouts for specific date
    String title = _selectedProgramButtonIndex == 0 ? 'Workouts' : 'Tasks';

    return Scaffold(
      appBar: AppBar(
        title: Row(
          children: [
            CustomButton(
              text: 'My Calendar',
              isSelected: _selectedAppButtonIndex == 0,
              onPressed: () {
                setState(() {
                  _selectedAppButtonIndex = 0;
                });
              },
            ),
            const SizedBox(width: 10),
            CustomButton(
              text: 'Appointment',
              isSelected: _selectedAppButtonIndex == 1,
              onPressed: () {
                setState(() {
                  _selectedAppButtonIndex = 1;
                });
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
                return isSameDay(_selectedDay, day);
              },
              onDaySelected: (selectedDay, focusedDay) {
                setState(() {
                  _selectedDay = selectedDay;
                  _focusedDay = focusedDay;
                });
              },
              eventLoader: (day) {
                List<Widget> eventIcons = _events[day] ?? [];

                // If there is workout on chosen date, add Icon
                if (_workoutEvents.containsKey(day)) {
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
                  color: Colors
                      .transparent, // Icons instead of dots in calendar
                ),
                markersMaxCount: 3, // Amount of markers on date
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
                    isSelected: _selectedProgramButtonIndex == 0,
                    onPressed: () {
                      setState(() {
                        _selectedProgramButtonIndex = 0;
                      });
                    },
                  ),
                  const SizedBox(width: 10),
                  CustomButton(
                    text: 'Tasks',
                    isSelected: _selectedProgramButtonIndex == 1,
                    onPressed: () {
                      setState(() {
                        _selectedProgramButtonIndex = 1;
                      });
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
                    style: const TextStyle(
                        fontSize: 18, fontWeight: FontWeight.bold),
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
            _selectedProgramButtonIndex == 0
                ? Column(
              children: workouts?.map((workout) =>
                  EventCard(eventTitle: workout)).toList() ?? [],
            )
                : Column(
              children: _tasks.map((task) {
                return TaskCard(
                  taskName: task['name'],
                  isDone: task['isDone'],
                  onToggle: () {
                    setState(() {
                      task['isDone'] = !task['isDone'];
                    });
                  },
                );
              }).toList(),
            ),
            const SizedBox(height: 20),
          ],
      ),
    );
  }
}
