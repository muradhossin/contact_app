import 'package:flutter/material.dart';

import '../models/contact_model.dart';

class ContactProvider extends ChangeNotifier {
  List<ContactModel> contactList = [
    ContactModel(
      id: 1,
      name: 'Murad Hossin',
      mobile: '01644086750',
      website: 'www.muradhossin.me',
      streetAddress: 'Ashulia',
      image: 'images/personicon.png',

    ),
    ContactModel(
      id: 2,
      name: 'Rahim',
      mobile: '01644086300',
      email: 'rahim@diu.edu.bd',
      website: 'www.rahim.me',
      streetAddress: 'Mirpur',
      image: 'images/personicon.png',
    ),
    ContactModel(
      id: 3,
      name: 'Karim',
      mobile: '01744086750',
      email: 'karim@diu.edu.bd',
      website: 'www.karim.me',
      streetAddress: 'Uttara',
      image: 'images/personicon.png',
    ),
    ContactModel(
      id: 4,
      name: 'Kader',
      mobile: '01544086750',
      email: 'kader@diu.edu.bd',
      website: 'www.kader.me',
      streetAddress: 'Baridhara',
      image: 'images/personicon.png',
    ),
    ContactModel(
      id: 5,
      name: 'Sajib',
      mobile: '01344086750',
      email: 'sajib@diu.edu.bd',
      website: 'www.sajib.me',
      streetAddress: 'Dhanmondi',
      image: 'images/personicon.png',
    ),
    ContactModel(
      id: 6,
      name: 'Rana',
      mobile: '01944086752',
      email: 'rana@diu.edu.bd',
      website: 'www.rana.me',
      streetAddress: 'Savar',
      image: 'images/personicon.png',
    ),
  ];

  void updateFavorite(int id){
    final contact = contactList.firstWhere((element) => element.id == id);
    final index = contactList.indexOf(contact);
    contactList[index].favorite = !contactList[index].favorite;
    notifyListeners();
  }
}
