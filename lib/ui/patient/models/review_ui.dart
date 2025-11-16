class ReviewUI {
  const ReviewUI({
    required this.name,
    required this.avatarUrl,
    required this.comment,
    required this.dateLabel,
    required this.rating,
    required this.badgeColor,
  });

  final String name;
  final String avatarUrl;
  final String comment;
  final String dateLabel;
  final double rating;
  final int badgeColor;
}
