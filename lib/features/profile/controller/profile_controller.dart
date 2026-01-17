import 'package:flutter/material.dart';
import 'package:work_track/features/profile/models/profile_model.dart';
import 'package:work_track/core/constants/app_images.dart';

class ProfileController extends ChangeNotifier {
  late ProfileModel profile;

  ProfileController() {
    loadProfile();
  }

  void loadProfile() {
    profile = ProfileModel(
      name: 'Sarah Johnson',
      id: '656316446ksjdvbskj5',
      email: 'sarah.johnson@spa.com',
      gender: 'Female',
      phone: '+971501234567',
      profileImage: AppImages.profileImage,
    );
  }
}
