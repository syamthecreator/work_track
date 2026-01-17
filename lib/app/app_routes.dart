import 'package:flutter/material.dart';
import 'package:work_track/features/appointments/view/appointments_screen.dart';
import 'package:work_track/features/attendance/view/attendance_screen.dart';
import 'package:work_track/features/profile/view/profile_screen.dart';

class AppRoutes {
  // Route names
  static const String appointments = '/appointments';
  static const String attendance = '/attendance';
  static const String profile = '/profile';

  // Route map
  static final Map<String, WidgetBuilder> routes = {
    appointments: (context) => const AppointmentScreen(),
    attendance: (context) => const AttendanceScreen(),
    profile: (context) => const ProfileScreen(),
  };
}
