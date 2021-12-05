import 'package:meta/meta.dart';

class Artist {
  final String username;
  final String description;
  final String artistAvatarUrl;
  final int artistId;

  const Artist(
      {required this.username,
      required this.description,
      required this.artistId,
      required this.artistAvatarUrl});

  static Artist fromJson(json) => Artist(
        username: json['artistName'],
        description: json['artistDescription'],
        artistId: json['artistId'],
        artistAvatarUrl:
            'https://images.unsplash.com/photo-1492684223066-81342ee5ff30?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxzZWFyY2h8Mnx8ZXZlbnR8ZW58MHx8MHx8&auto=format&fit=crop&w=500&q=60',
      );

  static Artist fromJsonEvent(json) => Artist(
        username: json['name'],
        description: json['description'],
        artistId: json['id'],
        artistAvatarUrl:
            'https://images.unsplash.com/photo-1492684223066-81342ee5ff30?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxzZWFyY2h8Mnx8ZXZlbnR8ZW58MHx8MHx8&auto=format&fit=crop&w=500&q=60',
      );
}
