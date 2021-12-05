import 'dart:convert';

import 'package:event_app_mobile/entities/artist.dart';
import 'package:event_app_mobile/services/token_secure_storage.dart';
import 'package:http/http.dart' as http;

class GetArtistList {
  static Future<List<Artist>> getArtistList() async {
    const url = 'http://10.0.2.2:8000/artist';
    final accessToken = await TokenSecureStorage.getAccessToken() ?? '';

    final response = await http.get(
      Uri.parse(url),
      headers: {
        'Authorization': 'Bearer ' + accessToken,
      },
    );

    var body = json.decode(response.body);
    var artistList = body['artistList'];

    return artistList.map<Artist>(Artist.fromJson).toList();
  }
}
