import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'new_contact_layout.dart';

import '../cubits/cubit/details_cubit.dart';
import '../cubits/cubit/home_cubit.dart';
import '../cubits/cubit/new_contact_cubit.dart';
import '../models/contact.dart';



part 'details_view.dart';

class DetailsScreen extends StatelessWidget {
   static const String routeName = '/details';

  const DetailsScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocListener<DetailsCubit, DetailsState>(
      listener: (context, state) {},
      child: const DetailsView(),
    );
  }
}
