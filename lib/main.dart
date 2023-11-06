import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'cubits/cubit/details_cubit.dart';
import 'cubits/cubit/new_contact_cubit.dart';

import 'config/router.dart';
import 'config/themes.dart';
import 'cubits/cubit/home_cubit.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(create: (_) => HomeCubit()..initContacts()),
        BlocProvider(create: (_) => DetailsCubit()),
        BlocProvider(create: (_) => NewContactCubit()),
      ],
      child: MaterialApp(
        title: 'Phone Book App',
        debugShowCheckedModeBanner: false,
        theme: AppThemes.lightTheme(context),
        darkTheme: AppThemes.darkTheme(context),
        themeMode: ThemeMode.light,
        routes: AppRouter.router(),
      ),
    );
  }
}
