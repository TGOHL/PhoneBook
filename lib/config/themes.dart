import 'package:flutter/material.dart';

class AppThemes {
  static const Color main = Color(0xFF141416);
  static const Color mainDark = Color.fromARGB(255, 10, 10, 10);
  static const Color mainLight = Color.fromARGB(255, 29, 29, 36);
  static const Color scaffold = mainLight;

  static const Color secondaryLight = Color(0xFFEB8729);
  static const Color secondaryDark = Color(0xFFD0491C);

  static const Color gray = Color(0xFFA0A0A0);
  static const Color whiteLight = Color(0xFFECECEC);

  static const Color font = Color(0xFFFFFFFF);


  static lightTheme(BuildContext context) => ThemeData(
        brightness: Brightness.light,
        scaffoldBackgroundColor: Colors.white,
        primaryColor: Colors.blue,
        appBarTheme: AppBarTheme.of(context).copyWith(
          color: Colors.blue,
          titleTextStyle: const TextStyle(
            color: Colors.white,
            fontSize: 18,
            fontWeight: FontWeight.bold,
          ),
        ),
        textTheme: const TextTheme(
          bodyMedium: TextStyle(
            color: Colors.black,
            fontSize: 14,
          ),
          titleLarge: TextStyle(color: gray,),
          titleMedium: TextStyle(color: Colors.black,),
          titleSmall: TextStyle(color: gray,),
        ),
        visualDensity: VisualDensity.adaptivePlatformDensity,
      );

  static darkTheme(BuildContext context) => ThemeData(
        brightness: Brightness.dark,
        
        scaffoldBackgroundColor: scaffold,
        primaryColor: Colors.blue,
        appBarTheme: AppBarTheme.of(context).copyWith(
          color: main,
          titleTextStyle: const TextStyle(
            color: Colors.white,
            fontSize: 18,
            
            fontWeight: FontWeight.bold,
          ),
        ),
        textTheme: const TextTheme(
          bodyMedium: TextStyle(
            color: font,
            
            fontSize: 14,
          ),
          titleLarge: TextStyle(color: gray, ),
          titleMedium: TextStyle(color: font, ),
          titleSmall: TextStyle(color: gray, ),
        ),
        visualDensity: VisualDensity.adaptivePlatformDensity,
      );

}
