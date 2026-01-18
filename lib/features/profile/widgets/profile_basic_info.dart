import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:work_track/core/constants/app_colors.dart';
import 'package:work_track/core/constants/app_icons.dart';

class ProfileBasicInfo extends StatelessWidget {
  final String name;
  final String id;
  final String email;
  final String gender;
  final String phone;

  const ProfileBasicInfo({
    super.key,
    required this.name,
    required this.id,
    required this.email,
    required this.gender,
    required this.phone,
  });

  static const _titleStyle = TextStyle(
    fontSize: 18,
    fontWeight: FontWeight.w400,
    color: AppColors.kSecondaryColour,
  );

  static const _subTitleStyle = TextStyle(
    fontSize: 14,
    fontWeight: FontWeight.w400,
    color: AppColors.kSecondaryColour,
  );

  static const double _rowSpacing = 10;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 25),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Text(name, style: _titleStyle),
          const SizedBox(height: _rowSpacing),

          Text('ID: $id', style: _subTitleStyle),
          const SizedBox(height: _rowSpacing),

          _ProfileRow(icon: AppIcons.email, text: email),
          const SizedBox(height: _rowSpacing),

          _ProfileRow(icon: AppIcons.user, text: gender),
          const SizedBox(height: _rowSpacing),

          _ProfileRow(icon: AppIcons.telephone, text: phone),
        ],
      ),
    );
  }
}

class _ProfileRow extends StatelessWidget {
  final String icon;
  final String text;

  const _ProfileRow({required this.icon, required this.text});

  static const _textStyle = TextStyle(
    fontSize: 14,
    fontWeight: FontWeight.w400,
    color: AppColors.kSecondaryColour,
  );

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        SvgPicture.asset(
          icon,
          width: 16,
          height: 16,
          colorFilter: const ColorFilter.mode(
            AppColors.kSecondaryColour,
            BlendMode.srcIn,
          ),
        ),
        const SizedBox(width: 10),
        Text(text, style: _textStyle),
      ],
    );
  }
}
