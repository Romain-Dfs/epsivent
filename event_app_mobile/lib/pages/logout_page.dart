import 'package:event_app_mobile/pages/welcome_page.dart';
import 'package:event_app_mobile/services/user_manager.dart';
import 'package:event_app_mobile/services/user_secure_storage.dart';
import 'package:event_app_mobile/widgets/button_widget.dart';
import 'package:flutter/material.dart';

class LogoutPage extends StatelessWidget {
  const LogoutPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Profile'),
      ),
      body: Center(
        child: ButtonWidget(
          text: 'Log out',
          onClicked: () async {
            await UserSecureStorage.deconnect();
            Navigator.of(context).push(
              MaterialPageRoute(
                builder: (BuildContext context) => WelcomePage(),
              ),
            );
          },
        ),
      ),
    );
  }
}
