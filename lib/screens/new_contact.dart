import 'package:flutter/material.dart';

import '../models/contact.dart';
import '../services/database.dart';

class NewContactScreen extends StatefulWidget {
  static const String routeName = '/new-contact';
  final Contact? contact;
  bool get isNewContact => contact == null;
  const NewContactScreen({super.key, this.contact});

  @override
  State<NewContactScreen> createState() => _NewContactScreenState();
}

class _NewContactScreenState extends State<NewContactScreen> {
  final GlobalKey<FormState> _key = GlobalKey<FormState>();

  late TextEditingController _nameController;
  late TextEditingController _phoneController;

  @override
  void initState() {
    _nameController = TextEditingController(
      text: widget.isNewContact ? null : widget.contact?.name,
    );
    _phoneController = TextEditingController(
      text: widget.isNewContact ? null : widget.contact?.phone,
    );
    super.initState();
  }

  void _save() {
    if (!_key.currentState!.validate()) return;
    // TODO: Save Changes
    if (widget.isNewContact) {
      DatabaseServices.addContact(
        Contact(
          id: (int.parse(DatabaseServices.contacts.last.id) + 1).toString(),
          name: _nameController.text,
          phone: _phoneController.text,
        ),
      );
    } else {
      DatabaseServices.editContact(
        Contact(
          id: widget.contact!.id,
          name: _nameController.text,
          phone: _phoneController.text,
        ),
      );
    }
    Navigator.of(context).pop(true);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.isNewContact ? 'Add New Contact' : 'Modify Contact'),
      ),
      body: Form(
        key: _key,
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16),
          child: Column(
            children: [
              SizedBox(
                height: 36,
                width: MediaQuery.of(context).size.width,
              ),
              !widget.isNewContact && widget.contact!.hasImage
                  ? CircleAvatar(
                      backgroundImage: NetworkImage(widget.contact!.avatar!),
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
                height: 32,
              ),
              TextFormField(
                controller: _nameController,
                decoration: const InputDecoration(
                  labelText: 'Name',
                  border: OutlineInputBorder(),
                  contentPadding: EdgeInsets.symmetric(horizontal: 8),
                ),
                validator: (val) {
                  if (val == null) return 'required field';
                  if (val.isEmpty) return 'required field';
                  if (val.length > 20) return 'too long';
                  return null;
                },
              ),
              const SizedBox(
                height: 24,
              ),
              TextFormField(
                controller: _phoneController,
                decoration: const InputDecoration(
                  labelText: 'Phone',
                  border: OutlineInputBorder(),
                  contentPadding: EdgeInsets.symmetric(horizontal: 8),
                ),
                validator: (val) {
                  if (val == null) return 'required field';
                  if (val.isEmpty) return 'required field';
                  if (val.length < 11) return 'too short';
                  if (val.length > 11) return 'too long';
                  return null;
                },
              ),
              const SizedBox(
                height: 24,
              ),
              SizedBox(
                width: MediaQuery.of(context).size.width * 0.7,
                height: 48,
                child: ElevatedButton(
                  onPressed: _save,
                  child: const Text(
                    'Save Contact',
                    style: TextStyle(fontSize: 17),
                  ),
                ),
              ),
              TextButton(
                onPressed: Navigator.of(context).pop,
                child: Text(
                  'Cancel',
                  style: TextStyle(fontSize: 16),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
