import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';

import '../../models/contact.dart';

part 'new_contact_state.dart';

class NewContactCubit extends Cubit<NewContactState> {
  NewContactCubit() : super(NewContactInitial());
  final GlobalKey<FormState> _key = GlobalKey<FormState>();

  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _phoneController = TextEditingController();
  Contact? _contact;

  bool get isNewContact => _contact == null;

  GlobalKey<FormState> get key => _key;
  Contact? get contact => _contact;
  TextEditingController get nameController => _nameController;
  TextEditingController get phoneController => _phoneController;

  void setContact(Contact? cont) {
    _contact = cont;
    if (_contact != null) {
      _nameController.text = _contact!.name;
      _phoneController.text = _contact!.phone;
    }else{
       _nameController.text = '';
      _phoneController.text = '';
    }
  }

  void save() {
    if (!_key.currentState!.validate()) return;
    emit(NewContactSaved());
  }
}
