import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:provider/provider.dart';
import 'package:work_track/features/navigation/controller/bottom_navigation_controller.dart';
import '../../../../../core/constants/app_colors.dart';

class BottomNavBar extends StatelessWidget {
  const BottomNavBar({super.key});

  @override
  @override
  Widget build(BuildContext context) {
    final controller = context.watch<BottomNavigationController>();
    final double navigationBarHeight = 100;

    return MediaQuery.removePadding(
      context: context,
      removeBottom: true,
      child: SizedBox(
        height: navigationBarHeight,
        child: BottomNavigationBar(
          currentIndex: controller.currentIndex,
          onTap: (index) => controller.changeIndex(context, index),
          type: BottomNavigationBarType.fixed,
          backgroundColor: AppColors.kWhiteColour,
          elevation: 0,
          showSelectedLabels: false,
          showUnselectedLabels: false,
          enableFeedback: false,
          items: List.generate(controller.items.length, (index) {
            final item = controller.items[index];
            return BottomNavigationBarItem(
              label: '',
              icon: _buildNavIcon(iconPath: item.icon, isActive: false),
              activeIcon: _buildNavIcon(iconPath: item.icon, isActive: true),
            );
          }),
        ),
      ),
    );
  }

  Widget _buildNavIcon({required String iconPath, required bool isActive}) {
    final double iconBgSize = 44;
    final double iconSize = 22;
    return Container(
      width: iconBgSize,
      height: iconBgSize,
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        color: isActive ? AppColors.kSecondaryColour : AppColors.kgrey2Colour,
      ),
      child: Center(
        child: SvgPicture.asset(
          iconPath,
          width: iconSize,
          height: iconSize,
          colorFilter: ColorFilter.mode(
            isActive ? AppColors.kWhiteColour : AppColors.kSecondaryColour,
            BlendMode.srcIn,
          ),
        ),
      ),
    );
  }
}
