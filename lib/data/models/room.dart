class Room {
  final int  roomId;
  final String roomImgTitle; // 룸 이미지 제목
  final String roomName; // 룸 이름
  final String roomInfo; // 룸 정보
  final String personCount; // 룸 정보
  final String amenities; // 룸
  final String checkInDate; // 체크인 날짜
  final String checkOutDate; // 체크아웃 날짜
  final String checkInTime; // 입실
  final String checkOutTime; // 퇴실
  final int price; // 가격
  final int? specialPrice; // 할인된 가격 (null일 수 있음)
  final String notice; // 여어떻노 공지

  Room({
    required this.roomId,
    required this.roomImgTitle,
    required this.roomName,
    required this.roomInfo,
    required this.personCount,
    required this.amenities,
    required this.checkInDate,
    required this.checkOutDate,
    required this.checkInTime,
    required this.checkOutTime,
    required this.price,
    required this.specialPrice,
    required this.notice,
  });

  factory Room.fromJson(Map<String, dynamic> json) {
    return Room(
      roomId: json["roomId"],
      roomImgTitle: json["roomImgTitle"],
      roomName: json["roomName"],
      roomInfo: json["roomInfo"],
      personCount: json["personCount"],
      amenities: json["amenities"],
      checkInDate: json["checkInDate"],
      checkOutDate: json["checkOutDate"],
      checkInTime: json["checkInTime"],
      checkOutTime: json["checkOutTime"],
      price: int.parse(json["price"]),
      specialPrice: int.parse(json["specialPrice"]),
      notice: json["notice"],
    );
  }

}