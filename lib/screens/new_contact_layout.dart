import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../cubit/home_cubit.dart';
import '../cubit/new_contact_cubit.dart';

import '../cubit/details_cubit.dart';
import '../models/contact.dart';

part 'new_contact_view.dart';

class NewContactScreen extends StatelessWidget {
  static const String routeName = '/new_contact';

  const NewContactScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocListener<NewContactCubit, NewContactState>(
      listener: (context, state) {
        if (state is NewContactSaved) {
          if (context.read<NewContactCubit>().isNewContact) {
            context.read<HomeCubit>().addContact(
                  Contact(
                    id: context.read<HomeCubit>().nextId.toString(),
                    name: context.read<NewContactCubit>().nameController.text,
                    phone:
                        context.read<NewContactCubit>().phoneController.text,
                  ),
                );
          } else {
            final contact = Contact(
              id: context.read<NewContactCubit>().contact!.id,
              name: context.read<NewContactCubit>().nameController.text,
              phone: context.read<NewContactCubit>().phoneController.text,
            );
            context.read<HomeCubit>().editContact(contact);
            context.read<DetailsCubit>().editContact(contact);
          }
          Navigator.of(context).pop();
        }
      },
      child: const NewContactView(),
    );
  }
}
