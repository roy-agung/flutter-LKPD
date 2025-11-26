import 'package:get/get.dart';
import 'package:flutter/material.dart';

class ThemeController extends GetxController {
  var isDark = false.obs;

  void toggleTheme() {
    isDark.value = !isDark.value;
  }

  ThemeData get themeData =>
      isDark.value ? ThemeData.dark() : ThemeData.light();
}