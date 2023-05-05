import 'package:brush_teeth/screens/activity_screen.dart';
import 'package:brush_teeth/screens/setting_screen.dart';
import 'package:flutter/material.dart';

import '../colors.dart';
import 'home_screen.dart';


class BottomNavBar extends StatefulWidget {
  const BottomNavBar({Key? key}) : super(key: key);

  @override
  State<BottomNavBar> createState() => _BottomNavBarState();
}

class _BottomNavBarState extends State<BottomNavBar> {
  int _currentIndex = 0;
  final List<Widget> _pages = [
   const HomeScreen(),
    const HistoryScreen(),
    const SettingScreen(),
  ];
  @override
  Widget build(BuildContext context) {
    return  SafeArea(child: Scaffold(
      body: _pages[_currentIndex],
      bottomNavigationBar: BottomNavigationBar(
        onTap: (index){
          setState(() {
            _currentIndex = index;
          });
        },
        backgroundColor: blueColor,
        selectedItemColor: whiteColor,
        unselectedItemColor: blackColor,
        currentIndex: _currentIndex,
        items: const [
          BottomNavigationBarItem(icon: Icon(Icons.access_alarms_outlined),label: "Timer"),
          BottomNavigationBarItem(icon: Icon(Icons.work_history_outlined),label: "Activity"),
          BottomNavigationBarItem(icon: Icon(Icons.settings),label: "Setting"),
        ],
      ),
    ),);
  }
}
