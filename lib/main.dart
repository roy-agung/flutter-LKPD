import 'package:flutter/material.dart';
import 'package:flutter_lkpd/pages/cashierPage.dart';
import "pages/setting.dart";
import 'package:get/get.dart';
import 'controllers/theme_controller.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  final ThemeController themeController = Get.put(ThemeController());

  MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return Obx(() => GetMaterialApp(
      debugShowCheckedModeBanner: false,
      theme: themeController.themeData,
      home: SettingPage(),
    )
    );
  }
}

