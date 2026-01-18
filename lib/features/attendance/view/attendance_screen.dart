import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:work_track/core/constants/app_colors.dart';
import 'package:work_track/core/constants/app_icons.dart';
import 'package:work_track/core/constants/app_images.dart';
import 'package:work_track/core/widgets/top_header.dart';
import 'package:work_track/features/attendance/widgets/activity_item.dart';
import '../controller/attendance_controller.dart';
import '../widgets/attendance_card.dart';
import 'package:work_track/features/navigation/widgets/app_bottom_navigation.dart';

class AttendanceScreen extends StatelessWidget {
  const AttendanceScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.kWhiteColour,
      bottomNavigationBar: const BottomNavBar(),

      body: Consumer<AttendanceController>(
        builder: (context, controller, _) {
          return Stack(
            children: [
              _buildHeaderBackground(),

              Column(
                children: [
                  const SizedBox(height: 120),

                  const AttendanceCard(),

                  Padding(
                    padding: const EdgeInsets.all(15),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        const Text(
                          "Your Activities",
                          style: TextStyle(
                            fontSize: 17,
                            fontWeight: FontWeight.w400,
                            color: AppColors.kBlackColour
                          ),
                        ),
                        GestureDetector(
                          child: const Text(
                            "View All",
                            style: TextStyle(
                              color: AppColors.kBlueColour,
                              decoration: TextDecoration.underline,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),

                  Expanded(
                    child: ListView.builder(
                      padding: const EdgeInsets.only(bottom: 16),
                      itemCount: controller.activities.length,
                      itemBuilder: (context, index) {
                        return ActivityItem(
                          activity: controller.activities[index],
                        );
                      },
                    ),
                  ),
                ],
              ),
            ],
          );
        },
      ),
    );
  }

  Widget _buildHeaderBackground() {
    return Container(
      height: 200,
      padding: const EdgeInsets.symmetric(horizontal: 16),
      decoration: BoxDecoration(
        color: AppColors.kSecondaryColour,
        borderRadius: BorderRadius.only(
          bottomLeft: Radius.circular(10),
          bottomRight: Radius.circular(10),
        ),
        boxShadow: [
          BoxShadow(
            color: AppColors.kBlackColour.withValues(alpha: 0.25),
            blurRadius: 18,
            spreadRadius: 0,
            offset: const Offset(0, 10),
          ),
        ],
      ),
      child: TopHeader(
        greeting: "Good morning...",
        userName: "Sarah Johnson",
        profileImage: AppImages.profileImage,
        logoutIcon: AppIcons.logoutIcon,
        onLogoutTap: () {},
      ),
    );
  }
}
