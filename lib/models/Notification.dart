import '../enums/NotificationCategory.dart';

class Notification {
  final String id;
  final String title;
  final String message;
  final DateTime date;
  final String userId;
  final NotificationCategory category;

  Notification(
      {required this.id,
      required this.title,
      required this.message,
      required this.date,
      required this.userId,
      required this.category});
}
