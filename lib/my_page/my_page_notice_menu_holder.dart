import 'package:flutter/material.dart';

// 마이페이지 공지사항
class MyPageNoticeMenuHolder extends StatelessWidget {
  const MyPageNoticeMenuHolder({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        ListTile(
          title: Text('공지사항'),
          trailing: Icon(Icons.arrow_forward_ios),
          onTap: () {

          },
        ),
        ListTile(
          title: Text('설정'),
          trailing: Icon(Icons.arrow_forward_ios),
          onTap: () {

          },
        ),
      ],
    );
  }
}
