import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';
import 'package:work_track/core/constants/app_colors.dart';
import 'package:work_track/core/constants/app_icons.dart';
import 'package:work_track/features/attendance/controller/attendance_controller.dart';
import 'package:work_track/features/attendance/models/attendance_model.dart';

class AttendanceCard extends StatelessWidget {
  const AttendanceCard({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = context.watch<AttendanceController>();
    final attendance = controller.attendance;

    return Padding(
      padding: const EdgeInsets.all(15),
      child: Container(
        padding: const EdgeInsets.all(16),
        decoration: _buildCardDecoration(),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            _buildTitle(attendance),
            const SizedBox(height: 16),
            _AttendanceSwitch(controller: controller, attendance: attendance),
            const SizedBox(height: 14),
            _buildShiftTag(attendance.shiftName),
            const SizedBox(height: 16),
            _buildDateTimeActionRow(attendance),
            const SizedBox(height: 16),
            _buildDivider(),
            const SizedBox(height: 12),
            _buildAbsentButton(controller, attendance),
          ],
        ),
      ),
    );
  }

  BoxDecoration _buildCardDecoration() {
    return BoxDecoration(
      color: AppColors.kGreyWhiteColour,
      borderRadius: BorderRadius.circular(22),
      border: Border.all(
        color: AppColors.kBlackColour.withValues(alpha: 0.04),
        width: 1,
      ),
      boxShadow: [
        BoxShadow(
          color: AppColors.kBlackColour.withValues(alpha: 0.25),
          offset: const Offset(0, 1),
          blurRadius: 8,
          spreadRadius: 3,
        ),
      ],
    );
  }

  Widget _buildTitle(AttendanceModel attendance) {
    return Text(
      attendance.cardTitle,
      style: const TextStyle(
        color: AppColors.kBlackColour,
        fontSize: 17,
        fontWeight: FontWeight.w700,
      ),
    );
  }

  Widget _buildShiftTag(String shiftName) {
    return Container(
      padding: const EdgeInsets.all(10),
      decoration: BoxDecoration(
        color: AppColors.kGreenLight,
        borderRadius: BorderRadius.circular(20),
      ),
      child: Text(
        shiftName,
        style: TextStyle(
          color: AppColors.kGreenDark,
          fontSize: 10,
          fontWeight: FontWeight.w400,
        ),
      ),
    );
  }

  Widget _buildDateTimeActionRow(AttendanceModel attendance) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        _InfoChip(DateFormat('MMM d, yyyy').format(attendance.date)),
        const SizedBox(width: 8),
        _InfoChip(DateFormat('h:mm a').format(attendance.time)),
        const SizedBox(width: 8),
        _ActionButton(attendance: attendance),
      ],
    );
  }

  Widget _buildDivider() {
    return ClipRRect(
      borderRadius: BorderRadius.circular(6),
      child: const Divider(
        thickness: 2,
        color: AppColors.kSecondaryColour,
        height: 2,
      ),
    );
  }

  Widget _buildAbsentButton(
    AttendanceController controller,
    AttendanceModel attendance,
  ) {
    return Align(
      alignment: Alignment.center,
      child: DecoratedBox(
        decoration: _buildAbsentButtonDecoration(),
        child: ElevatedButton(
          onPressed: controller.markAbsent,
          style: _buildAbsentButtonStyle(),
          child: Text(
            attendance.absentButtonText,
            style: _buildAbsentButtonTextStyle(),
          ),
        ),
      ),
    );
  }

  BoxDecoration _buildAbsentButtonDecoration() {
    return BoxDecoration(
      borderRadius: BorderRadius.circular(12),
      gradient: const LinearGradient(
        begin: Alignment.topCenter,
        end: Alignment.bottomCenter,
        colors: [AppColors.kOrangeLight, AppColors.kOrangeDark],
      ),
    );
  }

  ButtonStyle _buildAbsentButtonStyle() {
    return ElevatedButton.styleFrom(
      backgroundColor: Colors.transparent,
      shadowColor: Colors.transparent,
      padding: const EdgeInsets.symmetric(horizontal: 18, vertical: 12),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
      tapTargetSize: MaterialTapTargetSize.shrinkWrap,
    );
  }

  TextStyle _buildAbsentButtonTextStyle() {
    return const TextStyle(
      fontSize: 16,
      fontWeight: FontWeight.w600,
      color: AppColors.kWhiteColour,
    );
  }
}

class _AttendanceSwitch extends StatelessWidget {
  final AttendanceController controller;
  final AttendanceModel attendance;

  const _AttendanceSwitch({required this.controller, required this.attendance});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(30),
        border: Border.all(color: AppColors.kSecondaryColour),
      ),
      child: Row(
        children: [
          _SwitchItem(
            title: attendance.checkInLabel,
            isSelected: controller.isCheckInTab,
            onTap: () => controller.switchTab(true),
          ),

          _SwitchItem(
            title: attendance.checkOutLabel,
            isSelected: !controller.isCheckInTab,
            onTap: () => controller.switchTab(false),
          ),
        ],
      ),
    );
  }
}

class _SwitchItem extends StatelessWidget {
  final String title;
  final bool isSelected;
  final VoidCallback onTap;

  const _SwitchItem({
    required this.title,
    required this.isSelected,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: GestureDetector(
        onTap: onTap,
        child: Container(
          padding: const EdgeInsets.symmetric(vertical: 10),
          decoration: _buildSwitchItemDecoration(),
          alignment: Alignment.center,
          child: Text(title, style: _buildSwitchItemTextStyle()),
        ),
      ),
    );
  }

  BoxDecoration _buildSwitchItemDecoration() {
    return BoxDecoration(
      color: isSelected ? AppColors.kSecondaryColour : Colors.transparent,
      borderRadius: BorderRadius.circular(25),
    );
  }

  TextStyle _buildSwitchItemTextStyle() {
    return TextStyle(
      color: isSelected ? AppColors.kWhiteColour : AppColors.kSecondaryColour,
      fontWeight: FontWeight.w400,
      fontSize: 17,
    );
  }
}

class _InfoChip extends StatelessWidget {
  final String text;

  const _InfoChip(this.text);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 10),
      decoration: _buildInfoChipDecoration(),
      child: Text(
        text,
        textAlign: TextAlign.center,
        style: _buildInfoChipTextStyle(),
      ),
    );
  }

  BoxDecoration _buildInfoChipDecoration() {
    return BoxDecoration(
      color: AppColors.kgrey4Colour,
      borderRadius: BorderRadius.circular(10),
    );
  }

  TextStyle _buildInfoChipTextStyle() {
    return const TextStyle(
      fontWeight: FontWeight.w400,
      fontSize: 15,
      color: AppColors.kSecondaryColour,
    );
  }
}

class _ActionButton extends StatelessWidget {
  final AttendanceModel attendance;

  const _ActionButton({required this.attendance});

  @override
  Widget build(BuildContext context) {
    return DecoratedBox(
      decoration: _buildActionButtonDecoration(),
      child: ElevatedButton(
        onPressed: () {},
        style: _buildActionButtonStyle(),
        child: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            _buildTimerIcon(),
            const SizedBox(width: 6),
            _buildButtonText(attendance.actionButtonText),
          ],
        ),
      ),
    );
  }

  BoxDecoration _buildActionButtonDecoration() {
    return BoxDecoration(
      gradient: const LinearGradient(
        begin: Alignment.centerLeft,
        end: Alignment.centerRight,
        colors: [AppColors.kGreenButtonLight, AppColors.kGreenButtonDark],
      ),
      borderRadius: BorderRadius.circular(10),
    );
  }

  ButtonStyle _buildActionButtonStyle() {
    return ElevatedButton.styleFrom(
      backgroundColor: Colors.transparent,
      shadowColor: Colors.transparent,
      padding: const EdgeInsets.all(10),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
      tapTargetSize: MaterialTapTargetSize.shrinkWrap,
      minimumSize: Size.zero,
    );
  }

  Widget _buildTimerIcon() {
    return SvgPicture.asset(
      AppIcons.timer,
      width: 14,
      height: 14,
      colorFilter: const ColorFilter.mode(
        AppColors.kWhiteColour,
        BlendMode.srcIn,
      ),
    );
  }

  Widget _buildButtonText(String text) {
    return Text(
      text,
      style: const TextStyle(
        color: AppColors.kWhiteColour,
        fontWeight: FontWeight.w500,
        fontSize: 14,
      ),
    );
  }
}
