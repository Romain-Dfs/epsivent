import 'package:event_app_mobile/pages/artists_page.dart';
import 'package:event_app_mobile/pages/events_page.dart';
import 'package:event_app_mobile/pages/logout_page.dart';
import 'package:event_app_mobile/services/token_manager.dart';
import 'package:flutter/material.dart';

class DashboardPage extends StatefulWidget {
  final int index;
  const DashboardPage({Key? key, required this.index}) : super(key: key);

  @override
  _DashboardPageState createState() => _DashboardPageState(this.index);
}

class _DashboardPageState extends State<DashboardPage> {
  int currentIndex = 0;
  _DashboardPageState(this.currentIndex);

  final screens = [
    EventsPage(),
    ArtistListPage(),
    LogoutPage(),
  ];

  @override
  void initState() {
    super.initState();

    init();
  }

  Future init() async {
    final userCanConnect = await TokenManager.canConnect();
    setState() {}
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: screens[currentIndex],
      bottomNavigationBar: BottomNavigationBar(
        type: BottomNavigationBarType.fixed,
        backgroundColor: Colors.blue,
        selectedItemColor: Colors.white,
        unselectedItemColor: Colors.white70,
        currentIndex: currentIndex,
        onTap: (index) => setState(() => currentIndex = index),
        items: const [
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: 'Events',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: 'Artists',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: 'Profile',
          ),
        ],
      ),
    );
  }
}
