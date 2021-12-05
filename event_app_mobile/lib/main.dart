import 'package:event_app_mobile/pages/delayed_animation.dart';
import 'package:event_app_mobile/pages/welcome_page.dart';
import 'package:flutter/material.dart';

const d_red = const Color(0xFFE97170);

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Epsivent',
      debugShowCheckedModeBanner: false,
      home: WelcomePage()
    );
  }
}
