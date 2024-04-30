import 'package:flutter/material.dart';
import '../../../../data/dtos/book_request.dart';
import '../book_list_page.dart';

class OverseasBookList extends StatelessWidget {
  final List<Book> overseasbookList;

  const OverseasBookList({Key? key, required this.overseasbookList})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    List<Book> overseasbookList = [
      Book(
        stayName: '두짓타니 괌 리조트',
        roomImgTitle: 'overseas/overseas1.png',
        roomName: '괌숙소',
        location: '1227 Pale San Vitores Road, Tumon, 투몬 베이, 괌, 괌, 96913',
        checkInDate: DateTime(2024, 5, 1, 18, 0),
        // 체크인 날짜와 시간
        checkOutDate: DateTime(2024, 5, 6, 12, 0),
        // 체크아웃 날짜와 시간
        price: 300000,
        bookName: '설동훈',
        bookTel: '010-1234-5678',
        way: '카드결제',
        payAt: DateTime.parse('2024-04-20'), // 문자열을 DateTime으로 변환
      ),
      Book(
        stayName: '두짓타니 괌 리조트',
        roomImgTitle: 'overseas/overseas1.png',
        roomName: '괌숙소',
        location: '1227 Pale San Vitores Road, Tumon, 투몬 베이, 괌, 괌, 96913',
        checkInDate: DateTime(2024, 5, 1, 18, 0),
        // 체크인 날짜와 시간
        checkOutDate: DateTime(2024, 5, 6, 12, 0),
        // 체크아웃 날짜와 시간
        price: 300000,
        bookName: '설동훈',
        bookTel: '010-1234-5678',
        way: '카드결제',
        payAt: DateTime.parse('2024-04-20'), // 문자열을 DateTime으로 변환
      ),
    ];
    return BookListPage(bookList: overseasbookList, appBarText: '해외 예약내역');
  }
}
