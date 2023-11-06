import 'package:flutter/material.dart';

import '../models/contact.dart';
import '../services/database.dart';
import 'new_contact.dart';

class DetailsScreen extends StatefulWidget {
  static const String routeName = '/details';
  const DetailsScreen({
    super.key,
  });

  @override
  State<DetailsScreen> createState() => _DetailsScreenState();
}

class _DetailsScreenState extends State<DetailsScreen> {
  Contact? contact;
  @override
  Widget build(BuildContext context) {
    contact ??= ModalRoute.of(context)!.settings.arguments as Contact;
    return Scaffold(
      appBar: AppBar(
        title: const Text('Details'),
        actions: [
          IconButton(
            onPressed: () {
              Navigator.of(context)
                  .push(MaterialPageRoute<void>(
                builder: (_) => NewContactScreen(contact: contact),
              ))
                  .then((val) {
                setState(() {
                  contact = DatabaseServices.getContactById(contact!.id);
                });
              });
            },
            icon: Icon(Icons.edit),
          ),
        ],
      ),
      body: Column(
        children: [
          SizedBox(
            height: 36,
            width: MediaQuery.of(context).size.width,
          ),
          contact!.hasImage
              ? CircleAvatar(
                  backgroundImage: NetworkImage(contact!.avatar!),
                  radius: 56,
                )
              : Container(
                  padding: const EdgeInsets.all(12),
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    border: Border.all(width: 3, color: Colors.black54),
                  ),
                  child: const Icon(
                    Icons.person_outline_rounded,
                    color: Colors.black54,
                    size: 86,
                  ),
                ),
          const SizedBox(
            height: 16,
          ),
          Text(
            contact!.name,
            style: const TextStyle(fontSize: 20, fontWeight: FontWeight.w500),
          ),
          const SizedBox(
            height: 36,
          ),
          Row(
            children: [
              Container(
                margin: EdgeInsets.fromLTRB(16, 0, 6, 0),
                padding: const EdgeInsets.all(6),
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  color: Colors.green,
                ),
                child: const Icon(
                  Icons.call,
                  color: Colors.white,
                ),
              ),
              Text(
                contact!.phone,
                style: const TextStyle(fontSize: 20),
              ),
            ],
          ),
          Spacer(),
          SizedBox(
            width: MediaQuery.of(context).size.width * 0.7,
            height: 48,
            child: ElevatedButton(
              onPressed: () {},
              style: ElevatedButton.styleFrom(backgroundColor: Colors.red),
              child: const Text(
                'Delete Contact',
                style: TextStyle(fontSize: 17),
              ),
            ),
          ),
          const SizedBox(
            height: 24,
          ),
        ],
      ),
    );
  }
}
