import 'dart:convert';

import 'package:event_app_mobile/entities/artist.dart';
import 'package:event_app_mobile/entities/event.dart';
import 'package:event_app_mobile/services/token_secure_storage.dart';
import 'package:http/http.dart' as http;

class UpdateEvent {
  static Future updateEvent(
      String username, String description, Event event) async {
    final url = 'http://10.0.2.2:8000/event/' + event.eventId.toString();
    final accessToken = await TokenSecureStorage.getAccessToken() ?? "";

    var body = {
      'artistName': username,
      'artistDescription': description,
    };

    final response = await http.put(
      Uri.parse(url),
      headers: {
        'Authorization': 'Bearer' + accessToken,
      },
      body: json.encode(body),
    );
  }
}
