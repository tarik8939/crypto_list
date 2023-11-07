import 'package:flutter/material.dart';
import 'package:crypto_list/router/router.dart';
import 'package:crypto_list/theme/theme.dart';

class CryptoListApp extends StatelessWidget {
  const CryptoListApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      routes: routes,
      theme: darkTheme,
    );
  }
}
