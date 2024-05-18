import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:yogi_project/_core/constants/size.dart';
import 'package:yogi_project/data/store/session_store.dart';
import 'package:yogi_project/ui/pages/scrap/scrap_list_view_model.dart';
import 'package:yogi_project/ui/pages/scrap/widgets/scrap_result_list.dart';

class ScrapListPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('찜한 숙소'),
      ),
      body: Padding(
        padding: const EdgeInsets.only(bottom: gap_m),
        child: ScrapResultList(), // ScrapResultList 위젯을 불러와서 사용
      ),
    );
  }
}
