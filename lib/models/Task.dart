import 'Schedule.dart';

class Task{

  final String id;
  final String title;
  final String description;
  final bool isCompleted;
  final Schedule? scheduledDate; // Date or period

  Task({
    required this.id,
    required this.title,
    required this.description,
    this.isCompleted = false,
    required this.scheduledDate
  });

}
