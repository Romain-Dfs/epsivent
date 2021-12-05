import 'package:flutter_secure_storage/flutter_secure_storage.dart';

class TokenSecureStorage {
  static const _storage = FlutterSecureStorage();

  static const _keyAccessToken = "accessToken";
  static const _keyRefreshToken = "refreshToken";

  static Future setAccessToken(String accessToken) async =>
      await _storage.write(key: _keyAccessToken, value: accessToken);

  static Future<String?> getAccessToken() async =>
      await _storage.read(key: _keyAccessToken);

  static Future setRefreshToken(String refreshToken) async =>
      await _storage.write(key: _keyRefreshToken, value: refreshToken);

  static Future<String?> getRefreshToken() async =>
      await _storage.read(key: _keyRefreshToken);
}
