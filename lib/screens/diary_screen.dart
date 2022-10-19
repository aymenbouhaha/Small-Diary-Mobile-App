import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:my_diary_app/controllers/diary_controller.dart';


class DiaryScreen extends StatelessWidget {
  const DiaryScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final DiaryController _diaryController = Get.find(tag: "diary_controller");
    return Center(
      child: Obx(()=> _diaryController.diariesList.isEmpty ? const Text("What's Up") :
         ListView.separated(
            itemBuilder: (context, index) {
              return Padding(
                padding: const EdgeInsets.all(15.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(_diaryController.diariesList[index].dateString, style: Get.textTheme.headline6,),
                        const SizedBox(height: 5,),
                        Text(_diaryController.diariesList[index].content, style: Get.textTheme.headline6,)
                      ],
                    ),
                    IconButton(
                        onPressed: (){
                            _diaryController.removeNote(index);
                        },
                        icon: Icon(Icons.remove_outlined ,color: Get.theme.errorColor, size: 30,)
                    ),
                  ],
                ),
              );
            },
            separatorBuilder: (context , index)=> const Divider(height: 5,),
            itemCount: _diaryController.diariesList.length,
        ),
      ),
    );
  }
}
