import 'package:flutter/material.dart';
import 'package:work_track/core/constants/app_colors.dart';
import 'package:work_track/core/widgets/common_card_container.dart';
import 'package:work_track/features/navigation/widgets/app_bottom_navigation.dart';
import 'package:provider/provider.dart';
// import 'package:work_track/features/profile/widgets/profile_no_review.dart';
import 'package:work_track/features/profile/widgets/profile_basic_info.dart';
import 'package:work_track/features/profile/widgets/profile_details.dart';
import 'package:work_track/features/profile/widgets/profile_no_review.dart';
import 'package:work_track/features/profile/widgets/profile_review.dart';
import '../controller/profile_controller.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = context.watch<ProfileController>();
    final profile = controller.profile;

    return Scaffold(
      backgroundColor: AppColors.kWhiteColour,
      bottomNavigationBar: const BottomNavBar(),
      body: Column(
        children: [
          Container(
            height: 126,
            width: double.infinity,
            decoration: BoxDecoration(
              color: AppColors.kSecondaryColour,
              borderRadius: const BorderRadius.only(
                bottomLeft: Radius.circular(10),
                bottomRight: Radius.circular(10),
              ),
              boxShadow: [
                BoxShadow(
                  color: AppColors.kBlackColour.withValues(alpha: 0.25),
                  blurRadius: 18,
                  offset: const Offset(0, 10),
                ),
              ],
            ),
          ),

          const SizedBox(height: 10),

          Stack(
            clipBehavior: Clip.none,
            alignment: Alignment.topCenter,
            children: [
              CommonCardContainer(
                child: ProfileBasicInfo(
                  name: profile.name,
                  id: profile.id,
                  email: profile.email,
                  gender: profile.gender,
                  phone: profile.phone,
                ),
              ),

              Positioned(
                top: -45,
                child: Container(
                  padding: const EdgeInsets.all(4),
                  decoration: const BoxDecoration(
                    shape: BoxShape.circle,
                    color: AppColors.kWhiteColour,
                  ),
                  child: CircleAvatar(
                    radius: 42,
                    backgroundImage: AssetImage(profile.profileImage),
                  ),
                ),
              ),
            ],
          ),

          Expanded(
            child: SingleChildScrollView(
              padding: const EdgeInsets.only(bottom: 16),
              child: Column(
                children: [
                  ProfileDetailsSection(profile: controller.profile),
                  Consumer<ProfileController>(
                    builder: (context, controller, _) {
                      final reviewSection = controller.reviewSection;

                      return reviewSection.hasReviews
                          ? RecentReview(reviewSection: reviewSection)
                          : const ProfileNoReview();
                    },
                  ),
                  // ProfileNoReview()
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
