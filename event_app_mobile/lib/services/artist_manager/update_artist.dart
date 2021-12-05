import 'dart:convert';

import 'package:event_app_mobile/entities/artist.dart';
import 'package:event_app_mobile/services/token_secure_storage.dart';
import 'package:http/http.dart' as http;

class UpdateArtist {
  static Future updateArtist(
      String username, String description, Artist artist) async {
    final url = 'http://10.0.2.2:8000/artist/' + artist.artistId.toString();
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
