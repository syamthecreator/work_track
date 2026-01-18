import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:work_track/core/constants/app_colors.dart';
import 'package:work_track/features/attendance/models/activity_model.dart';

class ActivityItem extends StatelessWidget {
  final ActivityModel activity;

  const ActivityItem({super.key, required this.activity});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 3),
      decoration: BoxDecoration(
        color: AppColors.kGreyWhiteColour,
        borderRadius: BorderRadius.circular(16),
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Container(
            width: 8,
            height: 70,
            decoration: BoxDecoration(
              borderRadius: const BorderRadius.only(
                topLeft: Radius.circular(16),
                bottomLeft: Radius.circular(16),
              ),
              gradient: LinearGradient(
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
                colors: activity.isCheckIn
                    ? const [
                        AppColors.kGreenButtonLight,
                        AppColors.kGreenButtonDark,
                      ]
                    : const [
                        AppColors.kRedButtonLight,
                        AppColors.kRedButtonDark,
                      ],
              ),
            ),
          ),

          const SizedBox(width: 12),

          Expanded(
            child: Padding(
              padding: const EdgeInsets.symmetric(vertical: 12),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Text(
                    activity.title,
                    textAlign: TextAlign.center,
                    style: const TextStyle(
                      color: AppColors.kBlackColour,
                      fontSize: 14,
                      fontWeight: FontWeight.w400,
                    ),
                  ),

                  const SizedBox(height: 6),

                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        DateFormat(
                          "MMM d, yyyy 'at' hh:mm a",
                        ).format(activity.dateTime),
                        style: const TextStyle(
                          fontSize: 12,
                          fontWeight: FontWeight.w400,
                          color: AppColors.kSecondaryColour,
                        ),
                      ),

                      if (!activity.isCheckIn) ...[
                        const SizedBox(width: 8),
                        Container(
                          padding: const EdgeInsets.symmetric(
                            horizontal: 10,
                            vertical: 6,
                          ),
                          decoration: BoxDecoration(
                            color: AppColors.kGreenLight,
                            borderRadius: BorderRadius.circular(20),
                          ),
                          child: Text(
                            "Hours Worked: ${activity.hoursWorked?.toString().padLeft(2, '0')}",
                            style: const TextStyle(
                              fontSize: 8,
                              color: AppColors.kGreenDark,
                              fontWeight: FontWeight.w400,
                            ),
                          ),
                        ),
                      ],
                    ],
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
