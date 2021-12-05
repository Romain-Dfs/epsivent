import 'package:event_app_mobile/entities/artist.dart';
import 'package:event_app_mobile/entities/event.dart';
import 'package:event_app_mobile/pages/artist_page.dart';
import 'package:event_app_mobile/pages/dashboard_page.dart';
import 'package:event_app_mobile/pages/edit_event_page.dart';
import 'package:event_app_mobile/services/event_manager/delete_event.dart';
import 'package:event_app_mobile/services/user_manager.dart';
import 'package:event_app_mobile/widgets/menu_item.dart';
import 'package:event_app_mobile/widgets/menu_items.dart';
import 'package:flutter/material.dart';

class EventPage extends StatelessWidget {
  final Event event;
  bool isAdmin;

  EventPage({Key? key, required this.event, required this.isAdmin})
      : super(key: key);

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

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(event.name),
        actions: [
          isAdmin
              ? PopupMenuButton<MenuItem>(
                  onSelected: (item) => onSelected(context, item),
                  itemBuilder: (context) => [
                    ...MenuItems.itemsFirst.map(buildItem).toList(),
                  ],
                )
              : Container(),
        ],
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            CircleAvatar(
              backgroundImage: NetworkImage(event.eventAvatarUrl),
              radius: 80,
            ),
            const SizedBox(height: 40),
            Text(
              event.name,
              style: TextStyle(
                color: Colors.black,
                fontWeight: FontWeight.bold,
                fontSize: 28,
              ),
            ),
            const SizedBox(height: 10),
            Text(
              event.description,
              textAlign: TextAlign.center,
              style: TextStyle(
                color: Colors.black,
                fontSize: 16,
              ),
            ),
            const SizedBox(height: 10),
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
            builder: (context) => EditEventPage(
              event: event,
            ),
          ),
        );
        break;
      case MenuItems.itemDelete:
        await DeleteEvent.deleteEvent(event);
        Navigator.of(context).push(
          MaterialPageRoute(
            builder: (context) => DashboardPage(index: 0),
          ),
        );
        break;
    }
  }
}
