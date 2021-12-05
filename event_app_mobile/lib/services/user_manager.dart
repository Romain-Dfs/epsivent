import 'dart:convert';

import 'package:event_app_mobile/services/token_secure_storage.dart';
import 'package:event_app_mobile/services/user_secure_storage.dart';
import 'package:http/http.dart' as http;

class UserManager {
  static Future setUserRoles() async {
    final accessToken = await TokenSecureStorage.getAccessToken() ?? '';

    var response = await http.get(
      Uri.parse('http://10.0.2.2:8000/userinfo'),
      headers: <String, String>{
        'Authorization': 'Bearer ' + accessToken,
      },
    );

    if (response.statusCode == 200) {
      var responseContent = jsonDecode(response.body);
      await UserSecureStorage.setUserRoles(responseContent['roles']);
    }
  }

  static Future<bool> isAdmin() async {
    var response = await UserSecureStorage.getUserAdminRole();
    return response!.contains("true");
  }
}
