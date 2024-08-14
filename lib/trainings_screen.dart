import 'package:flutter/material.dart';

import 'event_card.dart';

class TrainingsScreen extends StatelessWidget {
  const TrainingsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Trainings'),
      ),
      body: ListView(
        children: const [
          EventCard(eventTitle: 'Upper Body'),
          EventCard(eventTitle: 'Cardio Workout'),
          EventCard(eventTitle: 'Leg Day'),
          EventCard(eventTitle: '15 min ABS'),
          EventCard(eventTitle: 'Morning Pilates'),
        ],
      ),
    );
  }
}
