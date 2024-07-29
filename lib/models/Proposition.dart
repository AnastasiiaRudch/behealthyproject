import '../enums/PropositionCategory.dart';

class Proposition {
  final String id;
  final String title;
  final String message;
  final DateTime date;
  final DateTime startDate;
  final DateTime endDate;
  final String userId;
  final PropositionCategory category;

  Proposition(
      {required this.id,
        required this.title,
        required this.message,
        required this.date,
        required this.userId,
        required this.category,
        required this.startDate,
        required this.endDate
      }
      );
}
