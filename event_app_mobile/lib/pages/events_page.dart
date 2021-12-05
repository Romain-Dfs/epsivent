import 'package:event_app_mobile/entities/event.dart';
import 'package:event_app_mobile/pages/create_event_page.dart';
import 'package:event_app_mobile/pages/event_page.dart';
import 'package:event_app_mobile/services/event_manager/get_event_list.dart';
import 'package:event_app_mobile/services/token_manager.dart';
import 'package:event_app_mobile/services/token_secure_storage.dart';
import 'package:event_app_mobile/services/user_manager.dart';
import 'package:flutter/material.dart';

class EventsPage extends StatelessWidget {
  bool isAdmin = false;

  EventsPage() {
    _init();
  }

  Future _init() async {
    isAdmin = await UserManager.isAdmin();
  }

  Widget buildEvents(List<Event> events) => ListView.builder(
        physics: BouncingScrollPhysics(),
        itemCount: events.length,
        itemBuilder: (context, index) {
          final event = events[index];

          return ListTile(
            onTap: () => Navigator.of(context).push(MaterialPageRoute(
                builder: (BuildContext context) => EventPage(
                      event: event,
                      isAdmin: isAdmin,
                    ))),
            leading: CircleAvatar(
              backgroundImage: NetworkImage(event.eventAvatarUrl),
            ),
            title: Text(event.name),
          );
        },
      );

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: FutureBuilder<List<Event>>(
        future: GetEventList.getEventList(),
        builder: (context, snapshot) {
          final events = snapshot.data;

          switch (snapshot.connectionState) {
            case ConnectionState.waiting:
              return const Center(child: CircularProgressIndicator());
            default:
              if (snapshot.hasError) {
                return const Center(child: Text('Some error occured!'));
              } else {
                return buildEvents(events!);
              }
          }
        },
      ),
      floatingActionButton: createEventButton(context),
    );
  }

  Widget createEventButton(BuildContext context) {
    return isAdmin
        ? FloatingActionButton(
            child: Icon(Icons.add),
            onPressed: () {
              Navigator.of(context).push(
                MaterialPageRoute(
                  builder: (BuildContext context) => CreateEventPage(),
                ),
              );
            },
          )
        : Container();
  }
}
