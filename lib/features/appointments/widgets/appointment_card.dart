import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:work_track/core/constants/app_colors.dart';
import 'package:work_track/core/constants/app_icons.dart';
import 'package:work_track/core/widgets/common_card_container.dart';
import '../models/appointment_model.dart';
import 'package:intl/intl.dart';

class AppointmentCard extends StatelessWidget {
  final AppointmentModel appointment;

  const AppointmentCard({super.key, required this.appointment});

  @override
  Widget build(BuildContext context) {
    return CommonCardContainer(
  
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            appointment.serviceName,
            style: const TextStyle(
              color: AppColors.kBlack2Colour,
              fontSize: 16,
              fontWeight: FontWeight.w400,
            ),
          ),
          const SizedBox(height: 6),
          Text(
            "Client: ${appointment.clientName} - ${appointment.duration} mins",
            style: TextStyle(color: AppColors.kgreyColour),
          ),
          const SizedBox(height: 4),
          RichText(
            text: TextSpan(
              style: TextStyle(color: AppColors.kgreyColour),
              children: [
                const TextSpan(text: "Booking: "),
                TextSpan(
                  text: appointment.bookingId,
                  style: TextStyle(
                    fontWeight: FontWeight.w400,
                    color: AppColors.kBlueColour,
                    decoration: TextDecoration.underline,
                  ),
                  recognizer: TapGestureRecognizer()
                    ..onTap = () {
                      //
                    },
                ),

                TextSpan(
                  style: TextStyle(
                    color: AppColors.kgreyColour,
                    fontWeight: FontWeight.w400,
                  ),
                  text: " - Total: ${appointment.duration} mins",
                ),
              ],
            ),
          ),
          const SizedBox(height: 12),
          Row(
            children: [
              SvgPicture.asset(
                AppIcons.calendar,
                width: 18,
                height: 18,
                colorFilter: const ColorFilter.mode(
                  AppColors.kSecondaryColour,
                  BlendMode.srcIn,
                ),
              ),
              const SizedBox(width: 8),
              Text(
                style: TextStyle(
                  color: AppColors.kgreyColour,
                  fontWeight: FontWeight.w400,
                ),
                DateFormat(
                  "EEE, MMM d, yyyy • hh:mm a",
                ).format(appointment.dateTime),
              ),
            ],
          ),
          const SizedBox(height: 8),
          Row(
            children: [
              SvgPicture.asset(
                AppIcons.checkmark,
                width: 20,
                height: 20,
                colorFilter: const ColorFilter.mode(
                  AppColors.kSecondaryColour,
                  BlendMode.srcIn,
                ),
              ),
              const SizedBox(width: 8),
              Text(
                "AED ${appointment.price.toInt()}",
                style: const TextStyle(
                  color: AppColors.kgreyColour,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ],
          ),
          const SizedBox(height: 14),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Container(
                padding: const EdgeInsets.symmetric(
                  horizontal: 16,
                  vertical: 6,
                ),
                decoration: BoxDecoration(
                  color: AppColors.kPurpleBgColour,
                  borderRadius: BorderRadius.circular(20),
                ),
                child: Text(
                  appointment.status,
                  style: TextStyle(
                    color: AppColors.kPurpleColour,
                    fontWeight: FontWeight.w400,
                  ),
                ),
              ),
              CircleAvatar(
                radius: 26,
                backgroundColor: AppColors.kSecondaryColour,
                child: SvgPicture.asset(
                  AppIcons.arrow,
                  width: 22,
                  height: 22,
                  colorFilter: const ColorFilter.mode(
                    AppColors.kWhiteColour,
                    BlendMode.srcIn,
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
