import 'package:flutter/material.dart';
import 'package:flutter_lkpd/pages/pengaturan.dart';
// import 'package:flutter_lkpd/pages/cashierPage.dart';
// import "pages/setting.dart";
// import 'package:get/get.dart';
// import 'controllers/theme_controller.dart';
import 'pages/navigator.dart';
import 'pages/pengaturan.dart';
import 'pages/tentang.dart';
import 'pages/bottomNavbar.dart';
void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      initialRoute: '/',
      routes: {
        '/': (context) => BottomNavbarPage(),
        '/pengaturan': (context) => Pengaturan(),
        '/tentang': (context) => Tentang(),
      }
    );
  }
}

// class MyApp extends StatelessWidget {
//   final ThemeController themeController = Get.put(ThemeController());

//   MyApp({super.key});

//   @override
//   Widget build(BuildContext context) {
//     // return Obx(() => Get
//     MaterialApp(
//       debugShowCheckedModeBanner: false,
//       // theme: themeController.themeData,
//       initialRoute: '/',
//       routes: {
//         '/': (context) => Navigatorpage(),
//       }
//     );
//     // )//
//   }
// }

