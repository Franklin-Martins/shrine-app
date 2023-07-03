import 'package:flutter/material.dart';

import 'home.dart';
import 'login.dart';

class ShrineApp extends StatelessWidget {
  const ShrineApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'shrine',
      initialRoute: '/login',
      routes: {
        '/login': (BuildContext context)=> const LoginPage(),
        '/':(BuildContext context) => const HomePage()
      },
      theme: ThemeData.light(useMaterial3: true),
    );
  }
}