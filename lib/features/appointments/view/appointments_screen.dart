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
              child: AnimatedBuilder(
                animation: controller,
                builder: (_, _) {
                  return Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(
                          left: 14,
                          right: 14,
                          top: 14,
                        ),
                        child: const Text(
                          "My Appointments",
                          style: TextStyle(
                            color: AppColors.kBlackColour,
                            fontSize: 17,
                            fontWeight: FontWeight.w400,
                          ),
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

                      const SizedBox(height: 10),

                      Padding(
                        padding: const EdgeInsets.only(
                          left: 14,
                          right: 14,
                          top: 10,
                        ),
                        child: const Text(
                          "Next Appointments",
                          style: TextStyle(
                            color: AppColors.kBlackColour,
                            fontSize: 17,
                            fontWeight: FontWeight.w400,
                          ),
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
          return AppointmentCard(appointment: appointments[index]);
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
                  ? AppColors.kSecondaryColour
                  :AppColors.kgrey2Colour,
              borderRadius: BorderRadius.circular(8),
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildHeaderBackground() {
    return Container(
      height: 156,
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
