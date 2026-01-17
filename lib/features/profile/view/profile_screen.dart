import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:work_track/core/constants/app_colors.dart';
import 'package:work_track/core/constants/app_icons.dart';
import 'package:work_track/features/navigation/widgets/app_bottom_navigation.dart';

import 'package:provider/provider.dart';

import '../controller/profile_controller.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return const _ProfileView();
  }
}

class _ProfileView extends StatelessWidget {
  const _ProfileView();

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
              Container(
                margin: const EdgeInsets.symmetric(horizontal: 20),
                padding: const EdgeInsets.fromLTRB(20, 70, 20, 24),
                decoration: BoxDecoration(
                  color: AppColors.kGreyWhiteColour,
                  borderRadius: BorderRadius.circular(22),
                  border: Border.all(
                    color: AppColors.kBlackColour.withValues(alpha: 0.04),
                  ),
                  boxShadow: [
                    BoxShadow(
                      color: AppColors.kBlackColour.withValues(alpha: 0.25),
                      blurRadius: 8,
                      spreadRadius: 3,
                      offset: const Offset(0, 1),
                    ),
                  ],
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Text(
                      profile.name,
                      style: const TextStyle(
                        fontSize: 22,
                        fontWeight: FontWeight.w600,
                        color: AppColors.kSecondaryColour,
                      ),
                    ),
                    const SizedBox(height: 6),
                    Text(
                      'ID: ${profile.id}',
                      style: const TextStyle(
                        fontSize: 14,
                        color: AppColors.kSecondaryColour,
                      ),
                    ),
                    const SizedBox(height: 20),

                    _ProfileRow(icon: AppIcons.email, text: profile.email),
                    const SizedBox(height: 12),
                    _ProfileRow(icon: AppIcons.user, text: profile.gender),
                    const SizedBox(height: 12),
                    _ProfileRow(icon: AppIcons.telephone, text: profile.phone),
                  ],
                ),
              ),

              Positioned(
                top: -45,
                child: Container(
                  padding: const EdgeInsets.all(4),
                  decoration: const BoxDecoration(
                    shape: BoxShape.circle,
                    color: Colors.white,
                  ),
                  child: CircleAvatar(
                    radius: 42,
                    backgroundImage: AssetImage(profile.profileImage),
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

class _ProfileRow extends StatelessWidget {
  final String icon;
  final String text;

  const _ProfileRow({required this.icon, required this.text});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        SvgPicture.asset(
          icon,
          width: 18,
          height: 18,
          colorFilter: const ColorFilter.mode(
            AppColors.kSecondaryColour,
            BlendMode.srcIn,
          ),
        ),
        const SizedBox(width: 10),
        Text(
          text,
          style: const TextStyle(
            fontSize: 15,
            color: AppColors.kSecondaryColour,
          ),
        ),
      ],
    );
  }
}
