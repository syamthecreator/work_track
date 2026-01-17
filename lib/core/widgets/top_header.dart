import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:work_track/core/constants/app_colors.dart';

class TopHeader extends StatelessWidget {
  final String? userName;
  final String? greeting;
  final String profileImage;
  final String logoutIcon;
  final double containerHeight;
  final bool? isContent;
  final VoidCallback onLogoutTap;

  const TopHeader({
    super.key,
    this.userName = "",
    this.greeting = "",
    required this.profileImage,
    required this.onLogoutTap,
    required this.logoutIcon,
    this.containerHeight = 136,
    this.isContent = true,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        // Profile Image
        if (isContent == true)
          Container(
            width: 56,
            height: 56,
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              border: Border.all(
                color: AppColors.kWhiteColour.withValues(alpha: 0.4),
                width: 2,
              ),
            ),
            child: Center(
              child: Container(
                width: 48,
                height: 48,
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  border: Border.all(
                    color: AppColors.kWhiteColour,
                    width: 1.5,
                  ),
                ),
                child: CircleAvatar(
                  radius: 22,
                  backgroundImage: AssetImage(profileImage),
                  backgroundColor: Colors.transparent,
                ),
              ),
            ),
          ),
        if (isContent == true) const SizedBox(width: 12),
    
        // Greeting + Name
        if (isContent == true)
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                greeting ?? "",
                style: TextStyle(
                  fontWeight: FontWeight.w400,
                  color: AppColors.kWhiteColour,
                  fontSize: 10,
                ),
              ),
              const SizedBox(height: 2),
              Text(
                userName ?? "",
                style: const TextStyle(
                  color: AppColors.kWhiteColour,
                  fontSize: 14,
                  fontWeight: FontWeight.w400,
                ),
              ),
            ],
          ),
        if (isContent == true) const Spacer(),
        if (isContent == true)
          // Logout Button
          GestureDetector(
            onTap: onLogoutTap,
            child: Container(
              width: 42,
              height: 42,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                border: Border.all(
                  color: AppColors.kWhiteColour.withValues(alpha: 0.6),
                ),
              ),
              child: Center(
                child: SvgPicture.asset(
                  logoutIcon,
                  width: 18,
                  height: 18,
                  colorFilter: const ColorFilter.mode(
                    AppColors.kWhiteColour,
                    BlendMode.srcIn,
                  ),
                ),
              ),
            ),
          ),
      ],
    );
  }
}
