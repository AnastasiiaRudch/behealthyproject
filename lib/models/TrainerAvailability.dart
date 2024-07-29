class TrainerAvailability {
  final String id;
  final String trainerId;
  final DateTime date;
  final bool isAvailable;

  TrainerAvailability({
    required this.id,
    required this.trainerId,
    required this.date,
    this.isAvailable = true,
  });
}


