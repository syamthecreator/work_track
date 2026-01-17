import 'package:flutter/material.dart';
import '../models/appointment_model.dart';

class AppointmentController extends ChangeNotifier {
  /// 🎠 Controllers
  final PageController myPageController = PageController();
  final PageController nextPageController = PageController();

  int _myIndex = 0;
  int _nextIndex = 0;

  int get myIndex => _myIndex;
  int get nextIndex => _nextIndex;

  /// 📌 Data
  final List<AppointmentModel> myAppointments = [];
  final List<AppointmentModel> nextAppointments = [];

  AppointmentController() {
    loadAppointments();
  }

  void loadAppointments() {
    myAppointments.addAll([
      AppointmentModel(
        serviceName: "Deep Cleansing Facial",
        clientName: "Akarsh KK",
        bookingId: "BK2507300003",
        dateTime: DateTime(2025, 8, 22, 0, 30),
        duration: 60,
        price: 150,
        status: "Confirmed",
      ),
      AppointmentModel(
        serviceName: "Deep Cleansing Facial",
        clientName: "Akarsh KK",
        bookingId: "BK2507300003",
        dateTime: DateTime(2025, 8, 23, 11, 30),
        duration: 60,
        price: 250,
        status: "Confirmed",
      ),
      AppointmentModel(
        serviceName: "Deep Cleansing Facial",
        clientName: "Akarsh KK",
        bookingId: "BK2507300003",
        dateTime: DateTime(2025, 8, 24, 10, 00),
        duration: 60,
        price: 200,
        status: "Confirmed",
      ),
    ]);

    nextAppointments.addAll([
      AppointmentModel(
        serviceName: "Hair Spa Treatment",
        clientName: "Rahul Dev",
        bookingId: "BK2507300004",
        dateTime: DateTime(2025, 8, 25, 9, 00),
        duration: 45,
        price: 180,
        status: "Confirmed",
      ),
      AppointmentModel(
        serviceName: "Skin Therapy",
        clientName: "Neha Sharma",
        bookingId: "BK2507300005",
        dateTime: DateTime(2025, 8, 26, 2, 00),
        duration: 50,
        price: 220,
        status: "Confirmed",
      ),
      AppointmentModel(
        serviceName: "Body Massage",
        clientName: "Anil Kumar",
        bookingId: "BK2507300006",
        dateTime: DateTime(2025, 8, 27, 4, 00),
        duration: 70,
        price: 300,
        status: "Confirmed",
      ),
    ]);

    notifyListeners();
  }

  void onMyPageChanged(int index) {
    _myIndex = index;
    notifyListeners();
  }

  void onNextPageChanged(int index) {
    _nextIndex = index;
    notifyListeners();
  }

  @override
  void dispose() {
    myPageController.dispose();
    nextPageController.dispose();
    super.dispose();
  }
}
