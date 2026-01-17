class AttendanceModel {
  final String cardTitle;
  final String shiftName;
  final String checkInLabel;
  final String checkOutLabel;
  final String actionButtonText;
  final String absentButtonText;

  final DateTime date;
  final DateTime time;
  final bool isCheckedIn;

  AttendanceModel({
    required this.cardTitle,
    required this.shiftName,
    required this.checkInLabel,
    required this.checkOutLabel,
    required this.actionButtonText,
    required this.absentButtonText,
    required this.date,
    required this.time,
    required this.isCheckedIn,
  });
}
