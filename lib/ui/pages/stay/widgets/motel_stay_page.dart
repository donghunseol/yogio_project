import 'package:flutter/material.dart';

class ModelStayPage extends StatelessWidget {
  const ModelStayPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar( // 상단 앱바(페이지 제목)
          title: Text('모텔')
      ),
    );
  }
}
