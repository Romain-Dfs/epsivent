import 'package:event_app_mobile/pages/dashboard_page.dart';
import 'package:event_app_mobile/pages/delayed_animation.dart';
import 'package:event_app_mobile/pages/events_page.dart';
import 'package:event_app_mobile/services/token_secure_storage.dart';
import 'package:event_app_mobile/services/user_manager.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:webview_flutter/webview_flutter.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';

class LoginPage extends StatefulWidget {
  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  late WebViewController controller;

  void readResponse() async {
    setState(() {
      controller.currentUrl().then((value) async {
        if (value != null &&
            value.contains("/tokeninfo?access_token") &&
            value.contains("refresh_token")) {
          var response = value.split("?")[1];
          var accessToken = response.split("&")[0].split("=")[1];
          var refreshToken = response.split("&")[1].split("=")[1];

          await TokenSecureStorage.setAccessToken(accessToken);
          await TokenSecureStorage.setRefreshToken(refreshToken);
          await UserManager.setUserRoles();

          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => DashboardPage(index: 0),
            ),
          );
        }
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.white.withOpacity(0),
        leading: IconButton(
          icon: const Icon(
            Icons.arrow_back,
            color: Colors.black,
            size: 30,
          ),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
      ),
      body: SafeArea(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[
            Expanded(
              child: DelayedAnimation(
                child: WebView(
                  javascriptMode: JavascriptMode.unrestricted,
                  initialUrl: 'http://10.0.2.2:8000/login',
                  onWebViewCreated: (controller) {
                    this.controller = controller;
                  },
                  onPageFinished: (_) {
                    readResponse();
                  },
                ),
                delay: 2000,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
