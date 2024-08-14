import 'package:flutter/material.dart';

class EventCard extends StatelessWidget {
  final String eventTitle;

  const EventCard({super.key, required this.eventTitle});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.all(10.0),
      padding: const EdgeInsets.all(10.0),
      decoration: BoxDecoration(
        color: Colors.grey.shade200,
        borderRadius: BorderRadius.circular(8.0),
      ),
      child: Row(
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                eventTitle,
                style: const TextStyle(
                  fontSize: 20.0,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const Text('Home Workout',
                  style: TextStyle(
                    fontSize: 16.0,
                    color: Colors.grey,
                  )),
            ],
          ),
          const Spacer(),
          const Column(
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              Row(
                children: [
                  Icon(Icons.access_time),
                  SizedBox(width: 4.0),
                  Text('50 Minutes'),
                ],
              ),
              SizedBox(height: 8.0),
              Row(
                children: [
                  Icon(Icons.local_fire_department),
                  SizedBox(width: 4.0),
                  Text('1300 Kcal'),
                ],
              ),
              SizedBox(height: 8.0),
              Row(
                children: [
                  Icon(Icons.fitness_center),
                  SizedBox(width: 4.0),
                  Text('5 Exercises'),
                ],
              ),
            ],
          ),
        ],
      ),
    );
  }
}
