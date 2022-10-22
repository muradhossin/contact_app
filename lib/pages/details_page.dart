import 'package:contact_app/models/contact_model.dart';
import 'package:flutter/material.dart';

class DetailsPage extends StatelessWidget {
  const DetailsPage({Key? key}) : super(key: key);
  static const String routeName = '/details';

  @override
  Widget build(BuildContext context) {
    final contact = ModalRoute.of(context)!.settings.arguments as ContactModel;
    return Scaffold(
      appBar: AppBar(
        title: Text(contact.name),
      ),
      body: ListView(
        children: [
          Image.asset(
            contact.image!,
            width: double.infinity,
            height: 200,
            fit: BoxFit.fill,
          ),
          ListTile(
            title: Text(contact.mobile),
            trailing: Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                IconButton(
                  onPressed: () {
                    
                  },
                  icon: Icon(Icons.call),
                ),
                IconButton(
                  onPressed: () {

                  },
                  icon: Icon(Icons.sms),
                ),
              ],
            ),
          ),
          ListTile(
            title: Text(contact.email ?? 'Email not set yet'),
            trailing:
                IconButton(
                  onPressed: () {

                  },
                  icon: Icon(contact.email != null ? Icons.email : Icons.edit),
                ),
          ),
          ListTile(
            title: Text(contact.streetAddress ?? 'Address not set yet'),
            trailing:
                IconButton(
                  onPressed: () {

                  },
                  icon: Icon(contact.streetAddress != null ? Icons.location_on : Icons.edit),
                ),
          ),
          ListTile(
            title: Text(contact.website ?? 'Website not set yet'),
            trailing:
                IconButton(
                  onPressed: () {

                  },
                  icon: Icon(contact.website != null ? Icons.web : Icons.edit),
                ),
          ),
        ],
      ),
    );
  }
}
