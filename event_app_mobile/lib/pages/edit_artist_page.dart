import 'package:event_app_mobile/entities/artist.dart';
import 'package:event_app_mobile/pages/dashboard_page.dart';
import 'package:event_app_mobile/services/artist_manager/update_artist.dart';
import 'package:event_app_mobile/widgets/button_widget.dart';
import 'package:flutter/material.dart';

class EditArtistPage extends StatefulWidget {
  final Artist artist;

  const EditArtistPage({Key? key, required this.artist}) : super(key: key);

  @override
  State<EditArtistPage> createState() => _EditArtistPageState(
      this.artist, this.artist.username, this.artist.description);
}

class _EditArtistPageState extends State<EditArtistPage> {
  final formKey = GlobalKey<FormState>();

  String artistName = "";
  String artistDescription = "";

  Artist artist;

  _EditArtistPageState(this.artist, this.artistName, this.artistDescription);

  Widget buildArtistName() => TextFormField(
        initialValue: artistName,
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
        initialValue: artistDescription,
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
              await UpdateArtist.updateArtist(
                  artistName, artistDescription, artist);
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
        title: Text('Edit artist'),
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
