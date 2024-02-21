import 'package:bottom_navy_bar/bottom_navy_bar.dart';
import 'package:flutter/material.dart';
import 'package:key_stroke_wfh/features/add_job/add_job_page.dart';
import 'package:key_stroke_wfh/features/dashboard/pages/dashboard_pages.dart';
import 'package:key_stroke_wfh/features/jobs/pages/jobs_page.dart';

// Import your screen files here

class NavigationTabPages extends StatefulWidget {
  @override
  _NavigationTabPagesState createState() => _NavigationTabPagesState();
}

class _NavigationTabPagesState extends State<NavigationTabPages> {
  int _selectedIndex = 0;
  PageController _pageController = PageController();

  @override
  void initState() {
    super.initState();
    _pageController = PageController(initialPage: _selectedIndex);
  }

  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    List<Widget> _screens = [
      DashboardPage(),
      JobsPage(),
      AddNewJobScree(),
    ];

    return MaterialApp(
      home: Scaffold(
        body: PageView(
          controller: _pageController,
          children: _screens,
        ),
        bottomNavigationBar: BottomNavyBar(
          selectedIndex: _selectedIndex,
          onItemSelected: (index) {
            setState(() {
              _selectedIndex = index;
              _pageController.jumpToPage(index);
            });
          },
          items: [
            BottomNavyBarItem(
              icon: Icon(Icons.home),
              title: Text('Home'),
              activeColor: Colors.pink,
              inactiveColor: Colors.grey,
            ),
            BottomNavyBarItem(
              icon: Icon(Icons.work),
              title: Text('Job Service'),
              activeColor: Colors.blue,
              inactiveColor: Colors.grey,
            ),
            BottomNavyBarItem(
              icon: Icon(Icons.person),
              title: Text('Me'),
              activeColor: Colors.purple,
              inactiveColor: Colors.grey,
            ),
          ],
        ),
      ),
    );
  }
}
