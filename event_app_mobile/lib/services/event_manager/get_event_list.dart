import 'package:event_app_mobile/entities/event.dart';
import 'package:event_app_mobile/services/token_secure_storage.dart';
import 'package:flutter/cupertino.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class GetEventList {
  static Future<List<Event>> getEventList() async {
    const url = 'http://10.0.2.2:8000/event';
    final accessToken = await TokenSecureStorage.getAccessToken() ?? '';

    final response = await http.get(
      Uri.parse(url),
      headers: {
        'Authorization': 'Bearer ' + accessToken,
      },
    );

    var body = json.decode(response.body);
    var artistList = body['eventList'];

    return artistList.map<Event>(Event.fromJson).toList();
  }
}
