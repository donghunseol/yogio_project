import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:yogi_project/data/dtos/response_dto.dart';
import 'package:yogi_project/data/models/stay.dart';
import 'package:yogi_project/data/repositories/stay_repository.dart';
import 'package:yogi_project/main.dart';

class CampingStayListModel {
  List<Stay> stay;

  CampingStayListModel(this.stay);
}

class CampingStayListViewModel extends StateNotifier<CampingStayListModel?> {
  final mContext = navigatorKey.currentContext;
  Ref ref;

  CampingStayListViewModel(super.state, this.ref);

  Future<void> notifyInit() async {
    // 통신하기
    ResponseDTO responseDTO = await StayRepository().fetchCampingStayList();
    // 상태값 갱신 (새로 new해서 넣어줘야 한다)
    // 여기는 리스트로 받아서 이렇게 설정
    state = responseDTO.body;
  }
}

final campingStayListProvider =
    StateNotifierProvider<CampingStayListViewModel, CampingStayListModel?>((ref) {
  return CampingStayListViewModel(null, ref)..notifyInit();
});
