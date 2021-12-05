import 'package:event_app_mobile/entities/event.dart';
import 'package:event_app_mobile/services/token_secure_storage.dart';
import 'package:http/http.dart' as http;

class DeleteEvent {
  static Future deleteEvent(Event event) async {
    final url = 'http://10.0.2.2:8000/event/' + event.eventId.toString();
    final accessToken = await TokenSecureStorage.getAccessToken() ?? "";

    final response = await http.delete(
      Uri.parse(url),
      headers: {
        'Authorization': 'Bearer' + accessToken,
      },
    );
  }
}
