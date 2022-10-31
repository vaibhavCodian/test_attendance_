import 'package:bottom_bar/bottom_bar.dart';
import 'package:flutter/material.dart';
import 'package:test_attendance/AttendanceScreen.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int _currentPage = 0;
  final _pageController = PageController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: PageView(
        controller: _pageController,
        children: [
          AttendanceScreen(),
          // Container(color: Colors.red),
          Container(color: Colors.red),
          Container(color: Colors.greenAccent.shade700),
          Container(color: Colors.orange),
        ],
        onPageChanged: (index) {
          // Use a better state management solution
          // setState is used for simplicity
          setState(() => _currentPage = index);
        },
      ),
      bottomNavigationBar: BottomBar(
        selectedIndex: _currentPage,
        onTap: (int index) {
          _pageController.jumpToPage(index);
          setState(() => _currentPage = index);
        },
        items: <BottomBarItem>[
          BottomBarItem(
            icon: Icon(Icons.note_alt_sharp),
            title: Text('Attendance'),
            activeColor: Colors.blue,
          ),
          BottomBarItem(
            icon: Icon(Icons.view_comfy_alt_outlined),
            title: Text('View Attendance'),
            activeColor: Colors.red,
          ),
          BottomBarItem(
            icon: Icon(Icons.analytics_outlined),
            title: Text('Analytics'),
            activeColor: Colors.greenAccent.shade700,
          ),
          BottomBarItem(
            icon: Icon(Icons.account_box_outlined),
            title: Text('Facilitator'),
            activeColor: Colors.orange,
          ),
        ],
      ),
    );
  }
}
