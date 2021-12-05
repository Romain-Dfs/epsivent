import 'dart:convert';

import 'package:event_app_mobile/entities/artist.dart';
import 'package:event_app_mobile/services/token_secure_storage.dart';
import 'package:http/http.dart' as http;

class CreateEvent {
  static Future createEvent() async {
    const url = 'http://10.0.2.2:8000/event';
    final accessToken = await TokenSecureStorage.getAccessToken() ?? "";

    var body = {};

    final response = await http.post(
      Uri.parse(url),
      headers: {
        'Authorization': 'Bearer' + accessToken,
      },
      body: json.encode(body),
    );
  }
}
