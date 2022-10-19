import 'package:flutter/material.dart';
import 'package:get_storage/get_storage.dart';
import 'package:my_diary_app/my_tab_bar_view.dart';
import 'package:get/get.dart';

import 'models/locales.dart';

void main() async {
  await GetStorage.init();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        appBarTheme: AppBarTheme(backgroundColor: Colors.deepPurple),
        colorScheme: ColorScheme.fromSwatch(
          primarySwatch: Colors.lime,
        )
      ),
      home: DiaryTabBarView(),
      locale: Locale("en","US"),
      translations: Locales(),
    );
  }
}

