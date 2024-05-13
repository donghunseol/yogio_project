import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:yogi_project/_core/constants/move.dart';
import 'package:yogi_project/_core/constants/size.dart';
import 'package:yogi_project/_core/constants/style.dart';
import 'package:yogi_project/data/models/room.dart';
import 'package:yogi_project/main.dart';
import 'package:yogi_project/ui/pages/my/reservation/reservation_page.dart';
import 'package:yogi_project/ui/room/room_detail_view_model.dart';

class RoomDetailPage extends ConsumerWidget {
  final Room rooms;

  const RoomDetailPage({required this.rooms});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    int roomId = rooms.roomId;
    RoomDetailModel? model = ref.watch(roomDetailProvider(roomId));
    late DateTime _selectedStartDate = DateTime.now();
    late DateTime _selectedEndDate = DateTime.now().add(Duration(days: 1));
    int _numberOfNights = _selectedEndDate.difference(_selectedStartDate).inDays;

    return Scaffold(
      appBar: AppBar(
        title: Text('${model?.roomOption.imageName}'),
      ),
      body: Column(
        children: [
          Expanded(
            child: ListView(
              children: [
                Padding(
                  padding: const EdgeInsets.all(gap_m),
                  child: Container(
                    padding: EdgeInsets.all(gap_m),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(gap_s),
                      border: Border.all(color: Colors.grey),
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        ClipRRect(
                          borderRadius: BorderRadius.circular(gap_s),
                          child: Image.asset(
                            'assets/images/${model?.roomOption.imageName}',
                            width: double.infinity,
                            height: 200,
                            fit: BoxFit.cover,
                          ),
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                SizedBox(height: gap_m),
                                Text('이용날짜', style: TextStyle(fontSize: gap_m)),
                                SizedBox(height: gap_xs),
                                GestureDetector(
                                  onTap: () => _selectDateRange(ref),
                                  child: Container(
                                    padding: EdgeInsets.all(gap_s),
                                    decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(gap_s),
                                      border: Border.all(color: Colors.black, width: 2.0),
                                    ),
                                    child: Row(
                                      children: [
                                        SizedBox(width: gap_xx),
                                        Icon(Icons.calendar_today),
                                        SizedBox(width: gap_s),
                                        Text(
                                          '${formatDate(_selectedStartDate)}  ~  ${formatDate(_selectedEndDate)}',
                                          style: h6(),
                                        ),
                                        SizedBox(width: gap_xs),
                                      ],
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ],
                        ),
                        SizedBox(height: gap_m),
                        Text(
                            '숙박기간 : ${_numberOfNights+1} 박 ${_numberOfNights + 2} 일',
                            style: TextStyle(fontSize: gap_m)),
                        SizedBox(height: gap_s),
                        Divider(),
                        SizedBox(height: gap_s),
                        Text('기본정보\n\n${model?.roomOption.information}'),
                        SizedBox(height: gap_s),
                        Divider(),
                        SizedBox(height: gap_s),
                        Text('편의시설\n\n${model?.roomOption.options}'),
                        SizedBox(height: gap_s),
                        Divider(),
                        SizedBox(height: gap_s),
                        Text('공지\n\n${model?.roomOption.tier}'),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
          Padding(
            padding: EdgeInsets.all(gap_m),
            child: Center(
              child: SizedBox(
                width: double.infinity,
                child: ElevatedButton(
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => ReservationPage(rooms: rooms)),
                    );
                  },
                  style: ElevatedButton.styleFrom(
                    foregroundColor: Colors.white,
                    backgroundColor: Colors.redAccent,
                  ),
                  child: Text(
                    '예약하기',
                    style: TextStyle(fontSize: 18.0),
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Future<void> _selectDateRange(WidgetRef ref) async {
    late DateTime _selectedStartDate = DateTime.now();
    late DateTime _selectedEndDate = DateTime.now().add(Duration(days: 1));
    int _numberOfNights = _selectedEndDate.difference(_selectedStartDate).inDays;

    final DateTimeRange? pickedDateRange = await showDateRangePicker(
      context: ref.read(navigatorKey as ProviderListenable).currentContext!,
      firstDate: DateTime.now(),
      lastDate: DateTime(2101),
      initialDateRange: DateTimeRange(start: _selectedStartDate, end: _selectedEndDate),
    );

    if (pickedDateRange != null) {
      _selectedStartDate = pickedDateRange.start;
      _selectedEndDate = pickedDateRange.end;
      // Recalculate number of nights
      _numberOfNights = _selectedEndDate.difference(_selectedStartDate).inDays;
    }
  }


  String formatDate(DateTime dateTime) {
    return '${dateTime.year}-${dateTime.month.toString().padLeft(2, '0')}-${dateTime.day.toString().padLeft(2, '0')}';
  }
}
