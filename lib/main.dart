import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:plus_web/main_page.dart';

void main() {
  runApp(const MyApp());
}

class AppScrollBehavior extends MaterialScrollBehavior {
  @override
  Set<PointerDeviceKind> get dragDevices => {
        PointerDeviceKind.touch,
        PointerDeviceKind.mouse,
      };
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      scrollBehavior: AppScrollBehavior(),
      title: '입주 플러스', //타이틀
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const MainPage(),
      getPages: [
        GetPage(
            name: '/', page: () => const MainPage()), //관리자 페이지에서 홈페이지로 하기위한 페이징
      ],
    );
  }
}
