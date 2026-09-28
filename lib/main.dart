import 'package:flutter/material.dart';
import 'package:latihankuis/pages/login_page.dart';

void main() {
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Animal App',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(
          seedColor: const Color(0xFF6B9080),
          primary: const Color(0xFF5E8B72),
          surface: const Color(0xFFF6F9F6),
          brightness: Brightness.light,
        ),
        scaffoldBackgroundColor: const Color(0xFFF6F9F6),
        useMaterial3: true,
        fontFamily: 'Roboto',
      ),
      home: const LoginPage(),
    );
  }
}