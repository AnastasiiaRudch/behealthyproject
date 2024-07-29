import 'Appointment.dart';
import 'Notification.dart';
import 'Proposition.dart';
import 'HealthInfo.dart';
import 'Training.dart';
import 'Task.dart';

class User{
  final String id;
  final String name;
  final String email;
  final String phoneNumber;
  final HealthInfo healthInfo;
  final List<Training> trainings;
  final List<Task> tasks;
  final List<Notification> notifications;
  final List<Proposition> propositions;
  final List<Appointment> appointments;
  final int chatMessageId;

  User( {
    required this.id,
    required this.name,
    required this.email,
    required this.phoneNumber,
    required this.healthInfo,
    required this.trainings,
    required this.tasks,
    required this.notifications,
    required this.propositions,
    required this.appointments,
    required this.chatMessageId
  });

}
