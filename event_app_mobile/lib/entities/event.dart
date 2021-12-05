import 'package:event_app_mobile/entities/artist.dart';

class Event {
  final String name;
  final String eventAvatarUrl;
  final String description;
  final int eventId;
  final List<Artist>? artists;

  Event({
    required this.name,
    required this.eventAvatarUrl,
    required this.description,
    required this.eventId,
    required this.artists,
  });

  static Event fromJson(json) {
    return Event(
      name: json['name'],
      eventAvatarUrl:
          'https://images.unsplash.com/photo-1492684223066-81342ee5ff30?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxzZWFyY2h8Mnx8ZXZlbnR8ZW58MHx8MHx8&auto=format&fit=crop&w=500&q=60',
      description: json['description'],
      eventId: json['id'],
      artists: json['attendees'].map<Artist>(Artist.fromJsonEvent).toList(),
    );
  }
}
