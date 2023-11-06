import '../models/contact.dart';

class DatabaseServices {
  static final List<Contact> _contacts = [];

  static List<Contact> get contacts => [..._contacts];

  static void initContacts() {
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
  }

  static void addContact(Contact contact) {
    _contacts.add(contact);
  }

  static void editContact(Contact contact) {
    int index = _contacts.indexWhere((element) => element.id == contact.id);
    _contacts[index].name = contact.name;
    _contacts[index].phone = contact.phone;

  }

  static Contact getContactById(String id) {
    return _contacts.firstWhere((e) => e.id == id);
  }

  static void deleteContact(String id) {
    _contacts.removeWhere((e) => e.id == id);
  }
}
