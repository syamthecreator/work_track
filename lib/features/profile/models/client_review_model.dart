class ClientReviewModel {
  final String clientName;
  final String profileImage;
  final int rating;
  final DateTime reviewedAt;
  final String comment;

  ClientReviewModel({
    required this.clientName,
    required this.profileImage,
    required this.rating,
    required this.reviewedAt,
    required this.comment,
  });
}

class ClientReviewSectionModel {
  final List<ClientReviewModel> reviews;

  const ClientReviewSectionModel({required this.reviews});

  bool get hasReviews => reviews.isNotEmpty;

  int get totalReviews => reviews.length;
}
