class AppointmentModel {
  final String serviceName;
  final String clientName;
  final String bookingId;
  final DateTime dateTime;
  final int duration;
  final double price;
  final String status;

  AppointmentModel({
    required this.serviceName,
    required this.clientName,
    required this.bookingId,
    required this.dateTime,
    required this.duration,
    required this.price,
    required this.status,
  });
}
