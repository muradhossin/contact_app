import 'package:contact_app/customwidgets/contact_item.dart';
import 'package:contact_app/provider/contact_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);
  static const String routeName = '/home';
  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Contact List'),
      ),
      body: Consumer<ContactProvider>(
        builder: (context, provider, child) =>
        ListView.builder(
          itemCount: provider.contactList.length,
          itemBuilder: (context, index){
            final contact = provider.contactList[index];
            return ContactItem(contact: contact);
          },
        ),
      ),
    );
  }
}
