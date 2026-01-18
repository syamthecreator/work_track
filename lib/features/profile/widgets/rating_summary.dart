import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:work_track/core/constants/app_colors.dart';
import 'package:work_track/core/constants/app_icons.dart';

class RatingSummaryCard extends StatelessWidget {
  final double rating;
  final Map<int, double> ratingDistribution;

  const RatingSummaryCard({
    super.key,
    required this.rating,
    required this.ratingDistribution,
  });

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Container(
          padding: const EdgeInsets.fromLTRB(10, 16, 10, 10),
          decoration: BoxDecoration(
            color: AppColors.kWhiteColour,
            borderRadius: BorderRadius.circular(16),
          ),
          child: Row(
            children: [
              Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  ShaderMask(
                    shaderCallback: (bounds) {
                      return const LinearGradient(
                        begin: Alignment.topLeft,
                        end: Alignment.bottomRight,
                        colors: [AppColors.kBlueDark, AppColors.kBlueLight],
                      ).createShader(
                        Rect.fromLTWH(0, 0, bounds.width, bounds.height),
                      );
                    },
                    child: Text(
                      rating.toStringAsFixed(1),
                      style: const TextStyle(
                        fontSize: 36,
                        fontWeight: FontWeight.bold,
                        color: AppColors.kWhiteColour,
                      ),
                    ),
                  ),
                  const SizedBox(height: 8),
                  Row(
                    children: List.generate(
                      5,
                      (index) => Padding(
                        padding: const EdgeInsets.only(right: 2),
                        child: SvgPicture.asset(
                          AppIcons.star,
                          width: 15,
                          height: 15,
                          colorFilter: const ColorFilter.mode(
                            AppColors.kgrey3Colour,
                            BlendMode.srcIn,
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
              ),

              const SizedBox(width: 24),

              Expanded(
                child: Column(
                  children: List.generate(5, (index) {
                    final star = 5 - index;
                    final value = ratingDistribution[star] ?? 0.0;

                    return Row(
                      children: [
                        Row(
                          children: [
                            Text(
                              star.toString(),
                              style: const TextStyle(
                                fontSize: 12,
                                color: AppColors.kSecondaryColour,
                              ),
                            ),
                            SvgPicture.asset(
                              AppIcons.star,
                              width: 12,
                              height: 12,
                              colorFilter: const ColorFilter.mode(
                                AppColors.kgrey3Colour,
                                BlendMode.srcIn,
                              ),
                            ),
                          ],
                        ),
                        Expanded(
                          child: ClipRRect(
                            borderRadius: BorderRadius.circular(4),
                            child: LinearProgressIndicator(
                              value: value,
                              minHeight: 5,
                              backgroundColor: AppColors.kGreyWhiteColour,
                              valueColor: const AlwaysStoppedAnimation<Color>(
                                AppColors.kBlueDark,
                              ),
                            ),
                          ),
                        ),
                      ],
                    );
                  }),
                ),
              ),
            ],
          ),
        ),

        Positioned(
          top: 0,
          left: 0,
          right: 0,
          child: Container(
            height: 6,
            decoration: const BoxDecoration(
              gradient: LinearGradient(
                begin: Alignment.centerLeft,
                end: Alignment.centerRight,
                colors: [AppColors.kBlueDark, AppColors.kBlueLight],
              ),
              borderRadius: BorderRadius.only(
                topLeft: Radius.circular(16),
                topRight: Radius.circular(16),
              ),
            ),
          ),
        ),
      ],
    );
  }
}
