import 'package:flutter/material.dart';

import 'config/router.dart';
import 'config/themes.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Phone Book App',
      debugShowCheckedModeBanner: false,
      theme: AppThemes.lightTheme(context),
      darkTheme: AppThemes.darkTheme(context),
      themeMode: ThemeMode.light,
      routes: AppRouter.router(),
    );
  }
}
