import 'package:event_app_mobile/entities/artist.dart';
import 'package:event_app_mobile/pages/artist_page.dart';
import 'package:event_app_mobile/pages/create_artist_page.dart';
import 'package:event_app_mobile/services/artist_manager/get_artist_list.dart';
import 'package:event_app_mobile/services/user_manager.dart';
import 'package:flutter/material.dart';

class ArtistListPage extends StatelessWidget {
  bool isAdmin = false;

  ArtistListPage() {
    _init();
  }

  Future _init() async {
    isAdmin = await UserManager.isAdmin();
  }

  Widget buildArtists(List<Artist> artists) => ListView.builder(
        physics: BouncingScrollPhysics(),
        itemCount: artists.length,
        itemBuilder: (context, index) {
          final artist = artists[index];

          return ListTile(
            onTap: () => Navigator.of(context).push(
              MaterialPageRoute(
                builder: (BuildContext context) => ArtistPage(
                  artist: artist,
                  isAdmin: isAdmin,
                ),
              ),
            ),
            leading: CircleAvatar(
              backgroundImage: NetworkImage(artist.artistAvatarUrl),
            ),
            title: Text(artist.username),
          );
        },
      );

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: FutureBuilder<List<Artist>>(
        future: GetArtistList.getArtistList(),
        builder: (context, snapshot) {
          final artists = snapshot.data;

          switch (snapshot.connectionState) {
            case ConnectionState.waiting:
              return const Center(child: CircularProgressIndicator());
            default:
              if (snapshot.hasError) {
                return const Center(child: Text('Some error occured!'));
              } else {
                return buildArtists(artists!);
              }
          }
        },
      ),
      floatingActionButton: createArtistButton(context),
    );
  }

  Widget createArtistButton(BuildContext context) {
    return isAdmin
        ? FloatingActionButton(
            child: Icon(Icons.add),
            onPressed: () {
              Navigator.of(context).push(
                MaterialPageRoute(
                  builder: (BuildContext context) => CreateArtistPage(),
                ),
              );
            },
          )
        : Container();
  }
}
