import 'package:provider/provider.dart';
import 'package:provider/single_child_widget.dart';
import 'package:work_track/features/attendance/controller/attendance_controller.dart';
import 'package:work_track/features/navigation/controller/bottom_navigation_controller.dart';
import 'package:work_track/features/appointments/controller/appointment_controller.dart';
import 'package:work_track/features/profile/controller/profile_controller.dart';

class AppProviderBinding {
  static List<SingleChildWidget> get providers => [
    ChangeNotifierProvider(create: (_) => AppointmentController()),
    ChangeNotifierProvider(create: (_) => AttendanceController()),
    ChangeNotifierProvider(create: (_) => ProfileController()),
    ChangeNotifierProvider(create: (_) => BottomNavigationController()),
  ];
}
