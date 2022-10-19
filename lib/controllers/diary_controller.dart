import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:intl/intl.dart';
import 'package:my_diary_app/models/diary_entry_model.dart';
import 'package:intl/date_symbol_data_local.dart';

class DiaryController extends GetxController {

  final RxList<DiaryEntry> _diariesList = <DiaryEntry>[].obs;

  List<DiaryEntry> get diariesList => [..._diariesList].toList();

  final GetStorage _getStorage= GetStorage();

  String _entryText = "";

  @override
  void onInit() {
    final List<dynamic> list = _getStorage.read("diary") ?? [];

    List<DiaryEntry> data =[];
    for (var element in list) {
      data.add(DiaryEntry(content: element["content"], dateString: element["dateTime"]));
    }

    _diariesList.value=data;
    super.onInit();
  }

  void addDiaryEntry(){

    initializeDateFormatting();
    if (_entryText !=""){
      DateFormat format =DateFormat.yMMMMEEEEd(Get.locale.toString());
      String dateString = format.format(DateTime.now());
      _diariesList.add(DiaryEntry(content: _entryText, dateString: dateString));

      List data = [];
      for (var element in _diariesList) {
        data.add({
          "dateTime" : element.dateString,
          "content" : element.content
        });
      }

      _getStorage.write("diary", data);
    }
    _entryText = "";
  }

  void changeEntryText(String text){
    _entryText=text;
  }

  void removeNote(int index){
    _diariesList.removeAt(index);
    List data = [];
    for (var element in _diariesList) {
      data.add({
        "dateTime" : element.dateString,
        "content" : element.content
      });
    }

    _getStorage.write("diary", data);
  }

}