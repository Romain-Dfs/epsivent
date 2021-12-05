import 'package:event_app_mobile/entities/artist.dart';
import 'package:event_app_mobile/services/token_secure_storage.dart';
import 'package:http/http.dart' as http;

class DeleteArtist {
  static Future deleteArtist(Artist artist) async {
    final url = 'http://10.0.2.2:8000/artist/' + artist.artistId.toString();
    final accessToken = await TokenSecureStorage.getAccessToken() ?? "";

    final response = await http.delete(
      Uri.parse(url),
      headers: {
        'Authorization': 'Bearer' + accessToken,
      },
    );
  }
}
