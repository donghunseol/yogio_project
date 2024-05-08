class Review {
  final double rating; // 별점
  final String comment; // 코멘트
  final String userName; // 사용자 이름
  final String userImgTitle; // 사용자 아바타 이미지 URL
  List<Review> replies; // 대댓글 목록

  Review({
    required this.rating,
    required this.comment,
    required this.userName,
    required this.userImgTitle,
    this.replies = const [], // 대댓글 목록 초기화
  });

  // Review 객체를 JSON으로 변환
  Map<String, dynamic> toJson() {
    return {
      "rating": rating,
      "comment": comment,
      "userName": userName,
      "userImgTitle": userImgTitle,
      "replies": replies.map((reply) => reply.toJson()).toList(),
      // 대댓글 목록을 JSON으로 변환
    };
  }

  // JSON 데이터를 Review 객체로 변환
  factory Review.fromJson(Map<String, dynamic> json) {
    return Review(
      rating: json['rating'],
      comment: json['comment'],
      userName: json['userName'],
      userImgTitle: json['userImgTitle'],
      replies: (json['replies'] as List<dynamic>?)
          ?.map((replyJson) => Review.fromJson(replyJson))
          .toList() ?? [],
    );
  }
}
