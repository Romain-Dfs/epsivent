import 'package:event_app_mobile/pages/dashboard_page.dart';
import 'package:event_app_mobile/services/artist_manager/create_artist.dart';
import 'package:event_app_mobile/widgets/button_widget.dart';
import 'package:flutter/material.dart';

class CreateArtistPage extends StatefulWidget {
  const CreateArtistPage({Key? key}) : super(key: key);

  @override
  _CreateArtistPageState createState() => _CreateArtistPageState();
}

class _CreateArtistPageState extends State<CreateArtistPage> {
  final formKey = GlobalKey<FormState>();

  String artistName = "";
  String artistDescription = "";

  Widget buildArtistName() => TextFormField(
        decoration: InputDecoration(
          labelText: 'Artist name',
          border: OutlineInputBorder(),
        ),
        validator: (value) {
          if (value!.length < 1) {
            return 'Enter at least 1 character';
          } else {
            return null;
          }
        },
        onSaved: (value) => setState(() => artistName = value!),
      );

  Widget buildArtistDescription() => TextFormField(
        decoration: InputDecoration(
          labelText: 'Artist description',
          border: OutlineInputBorder(),
        ),
        validator: (value) {
          if (value!.length < 1) {
            return 'Enter at least 1 character';
          } else {
            return null;
          }
        },
        onSaved: (value) => setState(() => artistDescription = value!),
      );

  Widget buildSubmit() => Builder(
        builder: (context) => ButtonWidget(
          text: 'Submit',
          onClicked: () async {
            final isValid = formKey.currentState!.validate();
            // FocusScope.of(context).unfocus();

            if (isValid) {
              formKey.currentState!.save();
              await CreateArtist.createArtist(artistName, artistDescription);
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
        title: Text('Create artist'),
      ),
      body: Form(
        key: formKey,
        child: ListView(
          padding: EdgeInsets.all(16),
          children: [
            buildArtistName(),
            const SizedBox(height: 16),
            buildArtistDescription(),
            const SizedBox(height: 16),
            buildSubmit(),
          ],
        ),
      ),
    );
  }
}
