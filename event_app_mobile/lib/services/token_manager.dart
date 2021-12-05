import 'dart:convert';

import 'package:event_app_mobile/services/token_secure_storage.dart';
import 'package:http/http.dart' as http;

class TokenManager {
  static Future<http.Response> refreshToken() async {
    final refreshToken = await TokenSecureStorage.getRefreshToken() ?? '';

    var response = await http.post(
      Uri.parse(
          'http://10.0.2.2:28080/auth/realms/master/protocol/openid-connect/token'),
      headers: <String, String>{
        'Content-Type': 'application/x-www-form-urlencoded',
      },
      body: {
        'client_id': 'epsivent',
        'grant_type': 'refresh_token',
        'client_secret': '2cf4bf35-f29e-45c1-be0f-d4e5b77d850b',
        'refresh_token': refreshToken,
      },
    );

    if (response.statusCode == 200) {
      var responseContent = jsonDecode(response.body);
      TokenSecureStorage.setRefreshToken(responseContent['refresh_token']);
      TokenSecureStorage.setAccessToken(responseContent['access_token']);
    }

    return response;
  }

  static Future<bool> canConnect() async {
    var response = await refreshToken();
    return response.statusCode == 200 ? true : false;
  }
}
