import 'package:flutter/material.dart';
import 'package:work_track/app/app_routes.dart';
import 'package:work_track/core/constants/app_icons.dart';
import 'package:work_track/features/navigation/models/bottom_nav_item_model.dart';

class BottomNavigationController extends ChangeNotifier {
  int _currentIndex = 0;
  int get currentIndex => _currentIndex;

  final List<BottomNavItemModel> items = [
    BottomNavItemModel(icon: AppIcons.calenderDot),
    BottomNavItemModel(icon: AppIcons.clock),
    BottomNavItemModel(icon: AppIcons.profileIcon),
  ];

  final List<String> routes = [
    AppRoutes.appointments,
    AppRoutes.attendance,
    AppRoutes.profile,
  ];

  void changeIndex(BuildContext context, int index) {
    if (_currentIndex == index) return;

    _currentIndex = index;
    notifyListeners();

    Navigator.pushNamedAndRemoveUntil(context, routes[index], (route) => false);
  }
}
