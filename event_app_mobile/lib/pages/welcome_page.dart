import 'package:event_app_mobile/pages/dashboard_page.dart';
import 'package:event_app_mobile/pages/delayed_animation.dart';
import 'package:event_app_mobile/pages/events_page.dart';
import 'package:event_app_mobile/pages/login_page.dart';
import 'package:event_app_mobile/services/token_manager.dart';
import 'package:event_app_mobile/services/token_secure_storage.dart';
import 'package:flutter/material.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:event_app_mobile/main.dart';

class WelcomePage extends StatefulWidget {
  @override
  State<WelcomePage> createState() => _WelcomePageState();
}

class _WelcomePageState extends State<WelcomePage> {
  @override
  void initState() {
    super.initState();

    init();
  }

  Future init() async {
    final userCanConnect = await TokenManager.canConnect();

    if (userCanConnect) {
      Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) => DashboardPage(index: 0),
        ),
      );
    }

    setState() {}
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Center(
        child: Container(
          margin: EdgeInsets.symmetric(
            vertical: 60,
            horizontal: 30,
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              DelayedAnimation(
                  child: Container(
                    height: 200,
                    child: Image.asset('assets/img/event.jpeg'),
                  ),
                  delay: 2500),
              DelayedAnimation(
                  child: Container(
                    margin: EdgeInsets.only(top: 100, bottom: 20),
                    child: Text(
                      "Get filter, stronger, and embrasse a helthier lifestyle",
                      textAlign: TextAlign.center,
                      style:
                          GoogleFonts.poppins(color: Colors.grey, fontSize: 16),
                    ),
                  ),
                  delay: 3500),
              DelayedAnimation(
                  child: Container(
                    width: double.infinity,
                    child: ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        primary: d_red,
                        shape: StadiumBorder(),
                        padding: EdgeInsets.all(13),
                      ),
                      child: Text('GET STARTED'),
                      onPressed: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => LoginPage(),
                          ),
                        );
                      },
                    ),
                  ),
                  delay: 4500),
            ],
          ),
        ),
      ),
    );
  }
}
