class Schedule {
  final DateTime? scheduledDate; // Date if it's only one time scheduled
  final DateTime? startDate; // Start of period if training is planned for period
  final DateTime? endDate; // End of period if training is planned for period

  Schedule({
    this.scheduledDate,
    this.startDate,
    this.endDate,
  });
}

//Next functionality
// final bool isRecurring; // Repeated training or not
// final List<String>? recurringDays; // Days of the week on which the training is repeated
// final List<DateTime>? recurringDates; // Specific dates on which the training is repeated
