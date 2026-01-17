enum ActivityType { checkIn, checkOut }

class ActivityModel {
  final ActivityType type;
  final DateTime dateTime;
  final int? hoursWorked; // null for Check In

  ActivityModel({
    required this.type,
    required this.dateTime,
    this.hoursWorked,
  });

  bool get isCheckIn => type == ActivityType.checkIn;

  String get title => isCheckIn ? "Check In" : "Check Out";
}
