import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:work_track/core/constants/app_colors.dart';
import 'package:work_track/core/constants/app_icons.dart';
import 'package:work_track/core/widgets/common_card_container.dart';

class ProfileNoReview extends StatelessWidget {
  const ProfileNoReview({super.key});

  @override
  Widget build(BuildContext context) {
    return CommonCardContainer(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: const [
          _Title(),
          SizedBox(height: 10),
          _NoReviewRow(),
          SizedBox(height: 6),
          _Description(),
        ],
      ),
    );
  }
}

class _Title extends StatelessWidget {
  const _Title();

  @override
  Widget build(BuildContext context) {
    return const Text(
      'Recent Client Reviews',
      style: TextStyle(
        fontSize: 17,
        fontWeight: FontWeight.w400,
        color: AppColors.kBlackColour,
      ),
    );
  }
}

class _NoReviewRow extends StatelessWidget {
  const _NoReviewRow();

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        SvgPicture.asset(
          AppIcons.starFilled,
          width: 18,
          height: 18,
          colorFilter: const ColorFilter.mode(
            AppColors.kYellowColour,
            BlendMode.srcIn,
          ),
        ),
        const SizedBox(width: 10),
        const Text(
          'No reviews yet',
          style: TextStyle(
            fontSize: 12,
            fontWeight: FontWeight.w400,
            color: AppColors.kBlackColour,
          ),
        ),
      ],
    );
  }
}

class _Description extends StatelessWidget {
  const _Description();

  @override
  Widget build(BuildContext context) {
    return const Text(
      'Your client reviews will appear here once you start receiving\nfeedback.',
      textAlign: TextAlign.center,
      style: TextStyle(
        fontSize: 8,
        fontWeight: FontWeight.w400,
        color: AppColors.kBlackColour,
      ),
    );
  }
}
