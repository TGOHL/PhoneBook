import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'cubit/details_cubit.dart';
import 'cubit/new_contact_cubit.dart';

import 'config/router.dart';
import 'config/themes.dart';
import 'cubit/home_cubit.dart';

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
      child: BlocBuilder<HomeCubit, HomeState>(
        builder: (context, state) {
          return MaterialApp(
            title: 'Phone Book App',
            debugShowCheckedModeBanner: false,
            theme: AppThemes.lightTheme(context),
            darkTheme: AppThemes.darkTheme(context),
            themeMode: context.watch<HomeCubit>().isDarkMode
                ? ThemeMode.dark
                : ThemeMode.light,
            routes: AppRouter.router(),
          );
        },
      ),
    );
  }
}
