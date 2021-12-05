import 'package:event_app_mobile/entities/artist.dart';
import 'package:event_app_mobile/pages/dashboard_page.dart';
import 'package:event_app_mobile/pages/edit_artist_page.dart';
import 'package:event_app_mobile/services/artist_manager/delete_artist.dart';
import 'package:event_app_mobile/services/user_manager.dart';
import 'package:event_app_mobile/widgets/menu_item.dart';
import 'package:event_app_mobile/widgets/menu_items.dart';
import 'package:flutter/material.dart';

class ArtistPage extends StatefulWidget {
  final Artist artist;
  final bool isAdmin;

  ArtistPage({Key? key, required this.artist, required this.isAdmin})
      : super(key: key);

  _ArtistPageState createState() => _ArtistPageState(this.artist, this.isAdmin);
}

class _ArtistPageState extends State<ArtistPage> {
  Artist artist;
  bool isAdmin;
  _ArtistPageState(this.artist, this.isAdmin);

  PopupMenuItem<MenuItem> buildItem(MenuItem item) => PopupMenuItem<MenuItem>(
        value: item,
        child: Row(
          children: [
            Icon(item.icon, color: Colors.black, size: 20),
            const SizedBox(width: 12),
            Text(item.text),
          ],
        ),
      );

  Widget menu(BuildContext context) {
    return isAdmin
        ? PopupMenuButton<MenuItem>(
            onSelected: (item) => onSelected(context, item),
            itemBuilder: (context) => [
              ...MenuItems.itemsFirst.map(buildItem).toList(),
            ],
          )
        : Container();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.artist.username),
        actions: [
          menu(context),
        ],
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            CircleAvatar(
              backgroundImage: NetworkImage(widget.artist.artistAvatarUrl),
              radius: 80,
            ),
            const SizedBox(height: 40),
            Text(
              widget.artist.username,
              style: TextStyle(
                color: Colors.black,
                fontWeight: FontWeight.bold,
                fontSize: 28,
              ),
            ),
            const SizedBox(height: 10),
            Text(
              widget.artist.description,
              textAlign: TextAlign.center,
              style: TextStyle(
                color: Colors.black,
                fontSize: 16,
              ),
            ),
          ],
        ),
      ),
    );
  }

  Future<void> onSelected(BuildContext context, MenuItem item) async {
    switch (item) {
      case MenuItems.itemEdit:
        Navigator.of(context).push(
          MaterialPageRoute(
            builder: (context) => EditArtistPage(artist: widget.artist),
          ),
        );
        break;
      case MenuItems.itemDelete:
        await DeleteArtist.deleteArtist(widget.artist);
        Navigator.of(context).push(
          MaterialPageRoute(
            builder: (context) => DashboardPage(index: 1),
          ),
        );
        break;
    }
  }
}
