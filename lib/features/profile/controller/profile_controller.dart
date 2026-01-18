import 'package:flutter/material.dart';
import 'package:work_track/features/profile/models/client_review_model.dart';
import 'package:work_track/features/profile/models/profile_model.dart';
import 'package:work_track/core/constants/app_images.dart';

class ProfileController extends ChangeNotifier {
  late ProfileModel profile;
  late ClientReviewSectionModel reviewSection;

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
      address: 'Dubai, UAE',
      status: 'Active',
      memberSince: 'Jul 5, 2025',
      language: 'En',
      role: 'Employee',
    );

    reviewSection = ClientReviewSectionModel(
      reviews: [
        ClientReviewModel(
          clientName: 'Sara Kurian',
          profileImage: AppImages.profileImage,
          rating: 5,
          reviewedAt: DateTime(2025, 7, 9, 14, 26),
          comment: 'Really good...!',
        ),
      ],
    );

    notifyListeners();
  }

  /// Optional: clear reviews
  void clearReviews() {
    reviewSection = const ClientReviewSectionModel(reviews: []);
    notifyListeners();
  }
}
