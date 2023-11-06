import 'package:flutter/material.dart';

import '../screens/details.dart';
import '../screens/home.dart';
import '../screens/new_contact.dart';



class AppRouter {
  static Map<String, Widget Function(dynamic)> router() {
    return {
      '/': (ctx) => const MyHomePage(title: 'Phone Book App'),
      NewContactScreen.routeName: (ctx) => const NewContactScreen(),
      DetailsScreen.routeName: (ctx) => const DetailsScreen(),
    };
  }
}
