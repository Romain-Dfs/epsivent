import 'dart:ffi';

import 'package:flutter_secure_storage/flutter_secure_storage.dart';

class UserSecureStorage {
  static const _storage = FlutterSecureStorage();

  static const _keyRolesUser = "isUser";
  static const _keyRolesAdmin = "isAdmin";

  static Future setUserRoles(List $roles) async {
    for (var $role in $roles) {
      if ($role.contains("ROLE_USER")) {
        await _storage.write(key: _keyRolesUser, value: "true");
      } else {
        await _storage.write(key: _keyRolesUser, value: "false");
      }
      if ($role.contains("ROLE_ADMIN")) {
        await _storage.write(key: _keyRolesAdmin, value: "true");
      } else {
        await _storage.write(key: _keyRolesAdmin, value: "false");
      }
    }
  }

  static Future deconnect() async {
    await _storage.write(key: _keyRolesUser, value: "false");
    await _storage.write(key: _keyRolesAdmin, value: "false");

    const _keyAccessToken = "accessToken";
    const _keyRefreshToken = "refreshToken";

    await _storage.write(key: _keyAccessToken, value: "");
    await _storage.write(key: _keyRefreshToken, value: "");
  }

  static Future<String?> getUserAdminRole() async {
    return await _storage.read(key: _keyRolesAdmin);
  }
}
