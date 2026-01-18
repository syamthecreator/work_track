import 'package:flutter/material.dart';
import 'package:work_track/core/constants/app_colors.dart';

class CommonCardContainer extends StatelessWidget {
  final Widget child;
  final EdgeInsetsGeometry? margin;
  final EdgeInsetsGeometry? padding;

  const CommonCardContainer({
    super.key,
    required this.child,
    this.margin,
    this.padding,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: margin ?? const EdgeInsets.symmetric(horizontal:  14,vertical: 10),
      padding: padding ?? const EdgeInsets.all(12),
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
      child: child,
    );
  }
}
