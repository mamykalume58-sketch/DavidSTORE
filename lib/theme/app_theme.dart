import 'package:flutter/material.dart';

class AppColors {
  static const Color navyDark = Color(0xFF0A1030);
  static const Color navyMid = Color(0xFF141B45);
  static const Color gold = Color(0xFFE8A93A);
  static const Color goldDark = Color(0xFFC9891F);
  static const Color white = Color(0xFFFFFFFF);
  static const Color whiteMuted = Color(0xB3FFFFFF);
}

class AppTextStyles {
  static const TextStyle logo = TextStyle(
    fontSize: 32,
    fontWeight: FontWeight.bold,
    color: AppColors.white,
    letterSpacing: 0.5,
  );

  static const TextStyle logoAccent = TextStyle(
    fontSize: 32,
    fontWeight: FontWeight.bold,
    color: AppColors.gold,
    letterSpacing: 0.5,
  );

  static const TextStyle onboardingTitle = TextStyle(
    fontSize: 22,
    fontWeight: FontWeight.w600,
    color: AppColors.white,
  );

  static const TextStyle onboardingBody = TextStyle(
    fontSize: 14,
    color: AppColors.whiteMuted,
    height: 1.4,
  );

  static const TextStyle buttonText = TextStyle(
    fontSize: 16,
    fontWeight: FontWeight.w600,
    color: AppColors.white,
  );
}
