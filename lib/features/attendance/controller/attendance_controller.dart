import 'package:flutter/material.dart';
import 'package:work_track/features/attendance/models/activity_model.dart';
import '../models/attendance_model.dart';

class AttendanceController extends ChangeNotifier {
  final AttendanceModel _attendance = AttendanceModel(
    cardTitle: "Today’s Attendance",
    shiftName: "General Shift",
    checkInLabel: "Check in",
    checkOutLabel: "Check out",
    actionButtonCheckInText: "Check in",
    actionButtonCheckOutText: "Check out",
    absentButtonText: "Mark As Absent",
    date: DateTime(2025, 8, 1),
    time: DateTime(2025, 8, 1, 9, 41),
    isCheckedIn: true,
  );

  final activities = [
    ActivityModel(
      type: ActivityType.checkIn,
      dateTime: DateTime(2025, 7, 31, 9, 35),
    ),
    ActivityModel(
      type: ActivityType.checkOut,
      dateTime: DateTime(2025, 7, 31, 18, 35),
      hoursWorked: 9,
    ),
    ActivityModel(
      type: ActivityType.checkIn,
      dateTime: DateTime(2025, 7, 30, 9, 35),
    ),
    ActivityModel(
      type: ActivityType.checkOut,
      dateTime: DateTime(2025, 7, 30, 18, 35),
      hoursWorked: 9,
    ),
  ];

  AttendanceModel get attendance => _attendance;

  bool _isCheckInTab = true;
  bool get isCheckInTab => _isCheckInTab;

  void switchTab(bool isCheckIn) {
    _isCheckInTab = isCheckIn;
    notifyListeners();
  }

  void markAbsent() {
    // business logic hook
  }

  void checkIn() {
    // API / logic hook
  }

  void checkOut() {
    // API / logic hook
  }
}
