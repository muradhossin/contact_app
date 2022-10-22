import 'package:contact_app/models/contact_model.dart';
import 'package:contact_app/pages/details_page.dart';
import 'package:flutter/material.dart';

class ContactItem extends StatelessWidget {
  final ContactModel contact;
  const ContactItem({Key? key, required this.contact}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListTile(
      onTap: (){
        Navigator.pushNamed(context, DetailsPage.routeName, arguments: contact);
      },
      leading: CircleAvatar(
        backgroundImage: AssetImage(contact.image!),
      ),
      title: Text(contact.name),
      subtitle: Text(contact.mobile),
      trailing: IconButton(
        icon: Icon(contact.favorite? Icons.favorite : Icons.favorite_border),
        onPressed: (){

        },
      ),
    );
  }
}
