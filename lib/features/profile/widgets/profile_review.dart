import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:work_track/core/constants/app_colors.dart';
import 'package:work_track/core/constants/app_icons.dart';
import 'package:work_track/core/widgets/common_card_container.dart';
import 'package:intl/intl.dart';
import 'package:work_track/features/profile/models/client_review_model.dart';

class RecentReview extends StatelessWidget {
  final ClientReviewSectionModel reviewSection;

  const RecentReview({super.key, required this.reviewSection});

  @override
  Widget build(BuildContext context) {
    final review = reviewSection.reviews.first;
    final formattedDate = DateFormat(
      'dd/MM/yyyy hh:mm:ss a',
    ).format(review.reviewedAt);

    return CommonCardContainer(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Center(
            child: Text(
              'Recent Client Reviews',
              style: TextStyle(
                fontSize: 17,
                fontWeight: FontWeight.w400,
                color: AppColors.kBlackColour,
              ),
            ),
          ),

          const SizedBox(height: 16),

          Text(
            'All reviews (${reviewSection.totalReviews})',
            style: const TextStyle(
              fontSize: 12,
              fontWeight: FontWeight.w400,
              color: AppColors.kBlackColour,
            ),
          ),

          const SizedBox(height: 14),

          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              CircleAvatar(
                radius: 20,
                backgroundImage: AssetImage(review.profileImage),
              ),

              const SizedBox(width: 12),

              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      review.clientName,
                      style: const TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.w400,
                        color: AppColors.kBlackColour,
                      ),
                    ),

                    const SizedBox(height: 6),

                    Row(
                      children: [
                        Row(
                          children: List.generate(
                            5,
                            (index) => Padding(
                              padding: const EdgeInsets.only(right: 2),
                              child: SvgPicture.asset(
                                AppIcons.starFilled,
                                width: 10,
                                height: 10,
                                colorFilter: ColorFilter.mode(
                                  index < review.rating
                                      ? AppColors.kYellowColour
                                      : AppColors.kBlackColour.withValues(
                                          alpha: 0.2,
                                        ),
                                  BlendMode.srcIn,
                                ),
                              ),
                            ),
                          ),
                        ),

                        const SizedBox(width: 8),

                        Text(
                          formattedDate,
                          style: const TextStyle(
                            fontSize: 12,
                            fontWeight: FontWeight.w400,
                            color: AppColors.kBlackColour,
                          ),
                        ),
                      ],
                    ),

                    const SizedBox(height: 10),

                    Text(
                      review.comment,
                      style: const TextStyle(
                        fontSize: 14,
                        fontWeight: FontWeight.w400,
                        color: AppColors.kBlackColour,
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
