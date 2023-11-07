import 'package:flutter/material.dart';

final darkTheme = ThemeData(
    appBarTheme: const AppBarTheme(
        backgroundColor: Color.fromARGB(255, 31, 8, 58),
        elevation: 0,
        titleTextStyle: TextStyle(
          color: Colors.white,
          fontWeight: FontWeight.w700,
          fontSize: 20,
        )),
    colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
    scaffoldBackgroundColor: const Color.fromARGB(255, 31, 8, 58),
    //TODO: divider color not applayed
    dividerColor: Colors.red,
    listTileTheme: const ListTileThemeData(iconColor: Colors.white),
    useMaterial3: true,
    textTheme: TextTheme(
        bodyMedium: const TextStyle(
            color: Colors.white, fontWeight: FontWeight.w700, fontSize: 18),
        labelSmall: TextStyle(
            color: Colors.white.withOpacity(0.6),
            fontWeight: FontWeight.w700,
            fontSize: 14)));
