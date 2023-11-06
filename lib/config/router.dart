import 'package:flutter/material.dart';

import '../screens/details_layout.dart';
import '../screens/home_layout.dart';
import '../screens/new_contact_layout.dart';





class AppRouter {
  static Map<String, Widget Function(dynamic)> router() {
    return {
      '/': (ctx) => const HomeScreen(),
      NewContactScreen.routeName: (ctx) => const NewContactScreen(),
      DetailsScreen.routeName: (ctx) => const DetailsScreen(),
    };
  }
}
