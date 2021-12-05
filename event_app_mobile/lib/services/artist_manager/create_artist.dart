import 'dart:convert';

import 'package:event_app_mobile/entities/artist.dart';
import 'package:event_app_mobile/services/token_secure_storage.dart';
import 'package:http/http.dart' as http;

class CreateArtist {
  static Future createArtist(String username, String description) async {
    const url = 'http://10.0.2.2:8000/artist';
    final accessToken = await TokenSecureStorage.getAccessToken() ?? "";

    var body = {
      'name': username,
      'description': description,
    };

    final response = await http.post(
      Uri.parse(url),
      headers: {
        'Authorization': 'Bearer' + accessToken,
      },
      body: json.encode(body),
    );
  }
}
