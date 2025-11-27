import 'package:flutter/material.dart';
import 'history.dart';
import 'profile.dart';
import 'navigator.dart';
class BottomNavbarPage extends StatefulWidget {
  const BottomNavbarPage({super.key});

  @override
  State<BottomNavbarPage> createState() => _BottomnNavbarState();
}

class _BottomnNavbarState extends State<BottomNavbarPage> {

  int bottomIndex = 0;

  final pages = [
    Navigatorpage(),
    HistoryPage(),
    ProfilePage(),
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
       body: pages[bottomIndex],
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: bottomIndex,
        onTap: (i) => setState(() =>
          bottomIndex = i
        ),
        items: [
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: "Home",
          ),
          BottomNavigationBarItem(
            icon:Icon(Icons.history),
            label: "History",),
          BottomNavigationBarItem(
            icon: Icon(Icons.person),
            label: "Profile",
          ),
        ]
        ),
    );
  }
}