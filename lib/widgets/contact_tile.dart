import 'package:flutter/material.dart';

import '../models/contact.dart';

class ConatctTile extends StatelessWidget {
  final Contact contact;
  final Function()? onDelete;
  final Function()? onTap;
  const ConatctTile({super.key, required this.contact, this.onDelete, this.onTap});

  @override
  Widget build(BuildContext context) {
    return ListTile(
      onTap:onTap ,
      title: Text(contact.name),
      subtitle: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
         const Icon(
            Icons.call,
            size: 14,
          ),
          Text(
            contact.phone,
            style:const TextStyle(color: Colors.grey, fontSize: 14),
          )
        ],
      ),
      trailing: IconButton(
        onPressed: onDelete,
        icon:const Icon(
          Icons.delete_outline,
        ),
      ),
    );
  }
}
