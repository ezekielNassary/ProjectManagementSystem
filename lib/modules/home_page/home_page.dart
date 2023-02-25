import 'package:flutter/material.dart';
import 'package:bottom_navy_bar/bottom_navy_bar.dart';
import 'package:project_management_system/modules/manage_projects_page/manage_projects_controller.dart';
import 'package:project_management_system/themes/color_scheme.dart';
import 'package:project_management_system/utils/constants.dart';

import '../dashboard/dashboard_page.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int currentIndex = 0;
  int counter = 0;
  late PageController pageController;

  @override
  void initState() {
    pageController = PageController();
    super.initState();
  }

  @override
  void dispose() {
    pageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ThemeColor.white,
      appBar: AppBar(
        backgroundColor: ThemeColor.white,
        iconTheme: const IconThemeData(color: ThemeColor.primaryBlue),
        title: Text(
          'PMS',
          style: headingstyle,
        ),
        centerTitle: true,
        elevation: 0,
      ),
      drawer: Drawer(),
      body: SizedBox.expand(
        child: PageView(
          controller: pageController,
          onPageChanged: (index) {
            setState(() => currentIndex = index);
          },
          children: <Widget>[
            const DashboardPage(),
            const ManageProjects(),
            Container(
              color: Colors.red,
            ),
            Container(
              color: Colors.yellow,
            ),
          ],
        ),
      ),
      bottomNavigationBar: BottomNavyBar(
        selectedIndex: currentIndex,
        showElevation: true,
        itemCornerRadius: 50,
        curve: Curves.bounceIn,
        onItemSelected: (index) => setState(() {
          currentIndex = index;
          pageController.animateToPage(index,
              duration: Duration(milliseconds: 300), curve: Curves.ease);
        }),
        items: <BottomNavyBarItem>[
          BottomNavyBarItem(
            icon: const Icon(Icons.apps),
            title: const Text('Home'),
            activeColor: Color.fromARGB(255, 156, 174, 246),
            textAlign: TextAlign.center,
          ),
          BottomNavyBarItem(
            icon: const Icon(Icons.accessibility),
            title: const Text('Projects'),
            activeColor: Color.fromARGB(255, 156, 174, 246),
            textAlign: TextAlign.center,
          ),
          BottomNavyBarItem(
            icon: const Icon(Icons.chat),
            title: const Text(
              'Chat',
            ),
            activeColor: Color.fromARGB(255, 156, 174, 246),
            textAlign: TextAlign.center,
          ),
          BottomNavyBarItem(
            icon: const Icon(Icons.settings),
            title: const Text('Settings'),
            activeColor: Color.fromARGB(255, 156, 174, 246),
            textAlign: TextAlign.center,
          ),
        ],
      ),
    );
  }
}
