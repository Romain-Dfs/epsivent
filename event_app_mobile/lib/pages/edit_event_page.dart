import 'package:event_app_mobile/entities/event.dart';
import 'package:event_app_mobile/pages/dashboard_page.dart';
import 'package:event_app_mobile/services/event_manager/update_event.dart';
import 'package:event_app_mobile/widgets/button_widget.dart';
import 'package:flutter/material.dart';

class EditEventPage extends StatefulWidget {
  final Event event;

  const EditEventPage({Key? key, required this.event}) : super(key: key);

  @override
  State<EditEventPage> createState() => _EditEventPageState(this.event);
}

class _EditEventPageState extends State<EditEventPage> {
  final formKey = GlobalKey<FormState>();

  String eventName = "";
  String eventDescription = "";

  Event event;

  _EditEventPageState(this.event);

  Widget buildEventName() => TextFormField(
        initialValue: eventName,
        decoration: InputDecoration(
          labelText: 'Event name',
          border: OutlineInputBorder(),
        ),
        validator: (value) {
          if (value!.length < 1) {
            return 'Enter at least 1 character';
          } else {
            return null;
          }
        },
        onSaved: (value) => setState(() => eventName = value!),
      );

  Widget buildEventDescription() => TextFormField(
        initialValue: eventDescription,
        decoration: InputDecoration(
          labelText: 'Event description',
          border: OutlineInputBorder(),
        ),
        validator: (value) {
          if (value!.length < 1) {
            return 'Enter at least 1 character';
          } else {
            return null;
          }
        },
        onSaved: (value) => setState(() => eventDescription = value!),
      );

  Widget buildSubmit() => Builder(
        builder: (context) => ButtonWidget(
          text: 'Submit',
          onClicked: () async {
            final isValid = formKey.currentState!.validate();
            // FocusScope.of(context).unfocus();

            if (isValid) {
              formKey.currentState!.save();
              await UpdateEvent.updateEvent(
                eventName,
                eventDescription,
                event,
              );
              Navigator.of(context).push(MaterialPageRoute(
                builder: (BuildContext context) => DashboardPage(
                  index: 1,
                ),
              ));
            }
          },
        ),
      );

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Edit event'),
      ),
      body: Form(
        key: formKey,
        child: ListView(
          padding: EdgeInsets.all(16),
          children: [
            buildEventName(),
            const SizedBox(height: 16),
            buildEventDescription(),
            const SizedBox(height: 16),
            buildSubmit(),
          ],
        ),
      ),
    );
  }
}
