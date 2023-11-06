import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../cubits/cubit/new_contact_cubit.dart';

import '../cubits/cubit/details_cubit.dart';
import '../cubits/cubit/home_cubit.dart';
import '../widgets/contact_tile.dart';
import 'details_layout.dart';
import 'new_contact_layout.dart';

part 'home_view.dart';

class HomeScreen extends StatelessWidget {
   static const String routeName = '/home';

  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    
    return BlocListener<HomeCubit, HomeState>(
      listener: (context, state) {},
      child: const HomeView(),
    );
  }
}
