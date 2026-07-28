import 'package:flutter/material.dart';
import 'screens/splash_screen.dart';
import 'theme/app_theme.dart';

void main() {
  runApp(const DavidStoreApp());
}

class DavidStoreApp extends StatelessWidget {
  const DavidStoreApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'DavidSTORE',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        scaffoldBackgroundColor: AppColors.navyDark,
        fontFamily: 'Roboto',
        useMaterial3: true,
      ),
      home: const SplashScreen(),
    );
  }
}
