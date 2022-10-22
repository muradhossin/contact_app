import 'package:contact_app/models/contact_model.dart';
import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher_string.dart';

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
                    callContact(contact.mobile);
                  },
                  icon: Icon(Icons.call),
                ),
                IconButton(
                  onPressed: () {
                    smsContact(contact.mobile);
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
                    emailContact(contact.email);
                  },
                  icon: Icon(contact.email != null ? Icons.email : Icons.edit),
                ),
          ),
          ListTile(
            title: Text(contact.streetAddress ?? 'Address not set yet'),
            trailing:
                IconButton(
                  onPressed: () {
                    streetAddressContact(contact.streetAddress);
                  },
                  icon: Icon(contact.streetAddress != null ? Icons.location_on : Icons.edit),
                ),
          ),
          ListTile(
            title: Text(contact.website ?? 'Website not set yet'),
            trailing:
                IconButton(
                  onPressed: () {
                    websiteContact(contact.website);
                  },
                  icon: Icon(contact.website != null ? Icons.web : Icons.edit),
                ),
          ),
        ],
      ),
    );
  }

  void callContact(String mobile) async{
    final urlString = 'tel:$mobile';
    if(await canLaunchUrlString(urlString)){
      await launchUrlString(urlString);
    }else{
      throw 'cannot perform this opeartion';
    }
  }

  void smsContact(String mobile) async{
    final urlString = 'sms:$mobile';
    if(await canLaunchUrlString(urlString)){
      await launchUrlString(urlString);
    } else {
      throw 'cannot perform this operation';
    }
  }

  void emailContact(String? email) async{
    final urlString = 'mailto:$email';
    if(await canLaunchUrlString(urlString)){
      await launchUrlString(urlString);
    } else {
      throw 'cannot perform this operation';
    }
  }

  void streetAddressContact(String? streetAddress) async{
    final urlString = 'geo:0,0?q=$streetAddress';
    if(await canLaunchUrlString(urlString)){
      await launchUrlString(urlString);
    } else {
      throw 'cannot perform this operation';
    }
  }

  void websiteContact(String? website) async{
    final urlString = 'https:$website';
    if(await canLaunchUrlString(urlString)){
      await launchUrlString(urlString);
    } else {
      throw 'cannot perform this operation';
    }
  }
}
