import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:meta/meta.dart';

import '../../models/contact.dart';

part 'home_state.dart';

class HomeCubit extends Cubit<HomeState> {
  HomeCubit() : super(HomeInitial());
  final TextEditingController _searchController = TextEditingController();

  bool _isDarkMode = false;

  bool get isDarkMode => _isDarkMode;

  int _nextID = 0;

  int get nextId => _nextID;
  TextEditingController get searchController => _searchController;

  void setDarkMode(bool isEnabled) {
    if (_isDarkMode == isEnabled) return;
    _isDarkMode = isEnabled;
    emit(HomeContactModeChanged());
  }

  final List<Contact> _contacts = [];

  List<Contact> get contactsFull => [..._contacts];
  List<Contact> contacts = [];

  void initContacts() {
    Contact c1 = Contact(
      id: "1",
      name: "Alice Johnson",
      phone: "+1234567890",
      avatar: "https://picsum.photos/200/300",
    );

    Contact c2 = Contact(
        id: "2",
        name: "Bob Smith",
        phone: "+0987654321",
        avatar: "https://picsum.photos/200/300");

    Contact c3 = Contact(
        id: "3",
        name: "Charlie Brown",
        phone: "+1122334455",
        avatar: "https://picsum.photos/200/300");

    Contact c4 = Contact(
      id: "4",
      name: "David Williams",
      phone: "+5566778899",
      avatar: "https://picsum.photos/200/300",
    );

    Contact c5 = Contact(
      id: "5",
      name: "Eva Green",
      phone: "+2244668800",
      avatar: "https://picsum.photos/200/300",
    );

    _contacts.addAll([c1, c2, c3, c4, c5]);
    contacts.addAll([c1, c2, c3, c4, c5]);
    _nextID = 6;
    emit(HomeContactsInit());
  }

  void addContact(Contact contact) {
    _contacts.add(contact);
    _nextID++;
    _search(searchController.text);
    emit(HomeContactAdded());
  }

  void editContact(Contact contact) {
    int index = _contacts.indexWhere((element) => element.id == contact.id);
    _contacts[index].name = contact.name;
    _contacts[index].phone = contact.phone;
    _search(searchController.text);
    emit(HomeContactEdited());
  }

  Contact getContactById(String id) {
    return _contacts.firstWhere((e) => e.id == id);
  }

  void deleteContact(String id) {
    _contacts.removeWhere((e) => e.id == id);
    _search(searchController.text);
    emit(HomeContactRemoved());
  }

  void search(String name) {
    _search(name);
    emit(HomeContactSearched());
  }

  void _search(String name) {
    contacts = contactsFull;
    contacts = contacts
        .where((element) => element.name
            .toLowerCase()
            .contains(searchController.text.toLowerCase()))
        .toList();
  }
}
