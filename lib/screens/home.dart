import 'package:flutter/material.dart';

import '../services/database.dart';
import '../widgets/contact_tile.dart';
import 'details.dart';
import 'new_contact.dart';

class MyHomePage extends StatefulWidget {
  static const String routeName = '/home';
  const MyHomePage({Key? key, required this.title}) : super(key: key);
  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  void _addContact() {
    // TODO navigate to new contact
    Navigator.of(context).pushNamed(NewContactScreen.routeName).then((value) {
      setState(() {});
    });
  }

  @override
  void initState() {
    DatabaseServices.initContacts();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: ListView.builder(
        itemCount: DatabaseServices.contacts.length,
        itemBuilder: (context, index) {
          return ConatctTile(
            contact: DatabaseServices.contacts[index],
            onTap: () {
              Navigator.of(context)
                  .pushNamed(DetailsScreen.routeName,
                      arguments: DatabaseServices.contacts[index])
                  .then((value) {
                setState(() {});
              });
            },
            onDelete: () {
              showAdaptiveDialog(
                context: context,
                builder: (context) {
                  return AlertDialog.adaptive(
                    title: const Text(
                      "Are you sure?",
                    ),
                    content: const Text(
                        "You cannot restore data that have been deleted."),
                    actions: [
                      ElevatedButton(
                        onPressed: () {
                          Navigator.of(context).pop();
                        },
                        style: ElevatedButton.styleFrom(
                          backgroundColor: Colors.white24,
                        ),
                        child: const Text(
                          "CANCEL",
                          style: TextStyle(
                            color: Colors.white,
                          ),
                        ),
                      ),
                      ElevatedButton(
                        onPressed: () {
                          Navigator.of(context).pop();
                          DatabaseServices.deleteContact(
                            DatabaseServices.contacts[index].id,
                          );
                          setState(() {});
                        },
                        style: ElevatedButton.styleFrom(
                          backgroundColor: Colors.red,
                        ),
                        child: const Text(
                          "Delete",
                          style: TextStyle(
                            color: Colors.white,
                          ),
                        ),
                      ),
                    ],
                  );
                },
              );
            },
          );
        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: _addContact,
        tooltip: 'add',
        child: const Icon(Icons.add),
      ),
    );
  }
}
