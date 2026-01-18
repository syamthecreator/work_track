class AttendanceModel {
  final String cardTitle;
  final String shiftName;
  final String checkInLabel;
  final String checkOutLabel;
  final String actionButtonCheckInText;
  final String actionButtonCheckOutText;
  final String absentButtonText;

  final DateTime date;
  final DateTime time;
  final bool isCheckedIn;

  AttendanceModel({
    required this.cardTitle,
    required this.shiftName,
    required this.checkInLabel,
    required this.checkOutLabel,
    required this.actionButtonCheckInText,
    required this.actionButtonCheckOutText,
    required this.absentButtonText,
    required this.date,
    required this.time,
    required this.isCheckedIn,
  });
}
