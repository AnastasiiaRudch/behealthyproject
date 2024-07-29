import '../enums/AppointmentCategory.dart';

class Appointment {
  final String id;
  final DateTime date;
  final String trainerId;
  final String userId;
  final bool isConfirmed;
  final AppointmentCategory category;

  Appointment({
    required this.id,
    required this.date,
    required this.trainerId,
    required this.userId,
    this.isConfirmed = false,
    required this.category
  });

}
