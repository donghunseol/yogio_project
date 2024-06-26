import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:yogi_project/_core/constants/size.dart';
import 'package:yogi_project/_core/constants/style.dart';
import 'package:yogi_project/data/dtos/reservation_request.dart';
import 'package:yogi_project/data/store/session_store.dart';
import 'package:yogi_project/ui/pages/my/pay/widgets/pay_button.dart';
import 'package:yogi_project/ui/pages/my/reservation/my_reservation_page.dart';

class PayPage extends ConsumerWidget {
  final ReservationSaveReqDTO reservations;
  final int reservationId; // 예약 아이디 추가
  final int numberOfNights;

  const PayPage({
    Key? key,
    required this.reservations,
    required this.reservationId, // 예약 아이디 추가
    required this.numberOfNights,
  }) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final sessionStore = ref.read(sessionProvider);

    void onPaymentDone() {
      Future.delayed(Duration(seconds: 2), () {
        Navigator.pushAndRemoveUntil(
          context,
          MaterialPageRoute(
            builder: (context) => MyReservationPage(),
          ),
          (Route<dynamic> route) => false,
        );
      });
    }

    return Scaffold(
      appBar: AppBar(
        title: Text('결제 페이지'),
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: Text(
                "결제 방법",
                style: h5(),
              ),
            ),
            Center(
              child: Text(
                "신용카드/페이코/카카오페이/네이버페이",
                style: TextStyle(
                  fontFamily: 'Pretendard',
                  fontWeight: FontWeight.bold,
                  fontSize: 20,
                ),
              ),
            ),
            SizedBox(height: gap_l),
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: SizedBox(
                width: double.infinity,
                child: PayButton(
                  id: reservationId, // 예약 아이디를 결제 페이지로 전달
                  reservations: reservations,
                  onPaymentDone: onPaymentDone,
                  numberOfNights: numberOfNights,
                ),
              ),
            ),
            SizedBox(height: 140),
            Container(
              color: Colors.grey.shade100,
              child: Padding(
                padding: const EdgeInsets.all(16.0),
                child: Text(
                  '''(주)여어떻노\n\n주소 : 부산광역시 중앙대로 749, 범향빌딩 3층\n대표이사 : 최주호 \n사업자등록번호: 122-83-00279 사업자정보확인\n
전자우편주소 : help@ssar.kr\n통신판매번호 : 2024-부산여기-12345 \n관광사업자 등록번호: 제123-12호 \n전화번호 : 1234-5678 \n호스팅서비스제공자의 상호 표시: (주)여어떻노
\n(주)여어떻노는 통신판매중개자로서 통신판매의 당사자가 아니며, 상품의 예약, 이용 및 환불 등과 관련한 의무와 책임은 각 판매자에게 있습니다.''',
                  style: TextStyle(
                      fontFamily: 'Pretendard',
                      fontWeight: FontWeight.bold,
                      fontSize: 15),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
