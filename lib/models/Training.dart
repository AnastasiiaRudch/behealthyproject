import '../enums/TrainingCategory.dart';
import 'Schedule.dart';
import 'Task.dart';

class Training {
  final String id;
  final String title;
  final String description;
  final TrainingCategory category;
  final DateTime createdDate;
  final int duration;
  final int calories;
  final List<Task> tasks;
  final String videoUrl;
  final bool isFavorite;
  final bool personal;
  final Schedule? scheduledDate; // Date or period

  Training({
    required this.id,
    required this.title,
    required this.description,
    required this.category,
    required this.createdDate,
    required this.duration,
    required this.calories,
    required this.tasks,
    required this.videoUrl,
    required this.isFavorite,
    required this.personal,
    required this.scheduledDate
});

}
