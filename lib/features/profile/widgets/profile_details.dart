import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:work_track/core/constants/app_colors.dart';
import 'package:work_track/core/constants/app_icons.dart';
import 'package:work_track/core/widgets/common_card_container.dart';
import 'package:work_track/features/profile/models/profile_model.dart';
import 'package:work_track/features/profile/widgets/rating_summary.dart';

class ProfileDetailsSection extends StatelessWidget {
  final ProfileModel profile;

  const ProfileDetailsSection({super.key, required this.profile});

  @override
  Widget build(BuildContext context) {
    return CommonCardContainer(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Center(
            child: Text(
              'Personal Details',
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.w400,
                color: AppColors.kBlackColour,
              ),
            ),
          ),

          const SizedBox(height: 24),

          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    _infoItem(
                      AppIcons.location,
                      AppColors.kRedButtonDark,
                      'Address:',
                      profile.address,
                    ),
                    const SizedBox(height: 16),
                    _infoItem(
                      AppIcons.calendar,
                      AppColors.kSecondaryColour,
                      'Member since:',
                      profile.memberSince,
                    ),
                    const SizedBox(height: 16),
                    _infoItem(
                      AppIcons.userRole,
                      AppColors.kSecondaryColour,
                      'Role:',
                      profile.role,
                    ),
                  ],
                ),
              ),

              const SizedBox(width: 20),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisSize: MainAxisSize.min,
                children: [
                  _infoItem(
                    AppIcons.active,
                    AppColors.kSecondaryColour,
                    'Status:',
                    profile.status,
                  ),
                  const SizedBox(height: 16),
                  _infoItem(
                    AppIcons.web,
                    AppColors.kBlueColour,
                    'Language:',
                    profile.language,
                  ),
                ],
              ),
            ],
          ),
          SizedBox(height: 15),
          Center(
            child: Text(
              'Rating Overview',
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.w400,
                color: AppColors.kBlackColour,
              ),
            ),
          ),
          const SizedBox(height: 15),

          RatingSummaryCard(
            rating: 0.0,
            ratingDistribution: {5: 0.0, 4: 0.0, 3: 0.0, 2: 0.0, 1: 0.0},
          ),
        ],
      ),
    );
  }

  Widget _infoItem(String icon, Color colors, String label, String value) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.center,
      mainAxisSize: MainAxisSize.min,
      children: [
        _icon(icon, colors),

        const SizedBox(width: 3),
        Text(
          label,
          style: const TextStyle(
            fontSize: 14,
            color: AppColors.kSecondaryColour,
            fontWeight: FontWeight.w400,
          ),
        ),
        const SizedBox(width: 5),
        Flexible(
          fit: FlexFit.loose,
          child: Text(
            value,
            style: const TextStyle(
              fontSize: 14,
              fontWeight: FontWeight.w400,
              color: AppColors.kBlackColour,
            ),
            overflow: TextOverflow.ellipsis,
          ),
        ),
      ],
    );
  }

  Widget _icon(String path, Color color) {
    return SizedBox(
      width: 16,
      height: 16,
      child: SvgPicture.asset(
        path,
        colorFilter: ColorFilter.mode(color, BlendMode.srcIn),
      ),
    );
  }
}
