import 'package:flutter/material.dart';
import 'package:work_track/core/constants/app_colors.dart';
import 'package:work_track/core/constants/app_icons.dart';
import 'package:work_track/core/constants/app_images.dart';
import 'package:work_track/features/appointments/controller/appointment_controller.dart';
import 'package:work_track/features/navigation/widgets/app_bottom_navigation.dart';
import '../widgets/appointment_card.dart';
import '../../../core/widgets/top_header.dart';

class AppointmentScreen extends StatefulWidget {
  const AppointmentScreen({super.key});

  @override
  State<AppointmentScreen> createState() => _AppointmentScreenState();
}

class _AppointmentScreenState extends State<AppointmentScreen> {
  late AppointmentController controller;

  @override
  void initState() {
    super.initState();
    controller = AppointmentController();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: const BottomNavBar(),
      backgroundColor: AppColors.kWhiteColour,
      body: Column(
        children: [
          _buildHeaderBackground(),

          Expanded(
            child: SingleChildScrollView(
              padding: const EdgeInsets.all(16),
              child: AnimatedBuilder(
                animation: controller,
                builder: (_, _) {
                  return Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Text(
                        "My Appointments",
                        style: TextStyle(
                          color: AppColors.kBlackColour,
                          fontSize: 17,
                          fontWeight: FontWeight.w400,
                        ),
                      ),

                      _carousel(
                        controller.myPageController,
                        controller.myAppointments,
                        controller.onMyPageChanged,
                      ),

                      _indicator(
                        controller.myAppointments.length,
                        controller.myIndex,
                      ),

                      const SizedBox(height: 28),

                      const Text(
                        "Next Appointments",
                        style: TextStyle(
                          color: AppColors.kBlackColour,
                          fontSize: 17,
                          fontWeight: FontWeight.w400,
                        ),
                      ),

                      _carousel(
                        controller.nextPageController,
                        controller.nextAppointments,
                        controller.onNextPageChanged,
                      ),

                      _indicator(
                        controller.nextAppointments.length,
                        controller.nextIndex,
                      ),
                    ],
                  );
                },
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _carousel(
    PageController pageController,
    List appointments,
    Function(int) onChanged,
  ) {
    return SizedBox(
      height: 260,
      child: PageView.builder(
        controller: pageController,
        itemCount: appointments.length,
        onPageChanged: onChanged,
        itemBuilder: (context, index) {
          return Padding(
            padding: const EdgeInsets.symmetric(horizontal: 8),
            child: AppointmentCard(appointment: appointments[index]),
          );
        },
      ),
    );
  }

  Widget _indicator(int length, int currentIndex) {
    return Padding(
      padding: const EdgeInsets.only(top: 12),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: List.generate(
          length,
          (index) => AnimatedContainer(
            duration: const Duration(milliseconds: 250),
            margin: const EdgeInsets.symmetric(horizontal: 2),
            width: currentIndex == index ? 18 : 8,
            height: 8,
            decoration: BoxDecoration(
              color: currentIndex == index
                  ? Colors.black87
                  : Colors.grey.shade400,
              borderRadius: BorderRadius.circular(8),
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildHeaderBackground() {
    return Container(
      height: 126,
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
