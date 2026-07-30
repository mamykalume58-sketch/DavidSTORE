import 'package:flutter/material.dart';
import '../theme/app_theme.dart';

class OnboardingScreen extends StatelessWidget {
  const OnboardingScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        fit: StackFit.expand,
        children: [
          Image.asset(
            'assets/images/onboarding1.png',
            fit: BoxFit.cover,
          ),
          SafeArea(
            child: Padding(
              padding: const EdgeInsets.fromLTRB(24, 20, 24, 0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    children: [
                      Container(
                        width: 32,
                        height: 32,
                        decoration: BoxDecoration(
                          color: AppColors.white,
                          borderRadius: BorderRadius.circular(8),
                        ),
                        child: const Icon(Icons.shopping_bag,
                            color: AppColors.orangeDark, size: 18),
                      ),
                      const SizedBox(width: 10),
                      const Text(
                        'DavidSTORE',
                        style: TextStyle(
                          color: AppColors.white,
                          fontSize: 16,
                          fontWeight: FontWeight.w700,
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 28),
                  const Text(
                    'Le shopping intelligent\ncommence, ici.',
                    style: AppTextStyles.onboardingTitle,
                  ),
                  const SizedBox(height: 16),
                  Container(width: 40, height: 2, color: AppColors.white),
                  const SizedBox(height: 16),
                  const Text(
                    'Des milliers de produits pour\ndévelopper votre activité.',
                    style: AppTextStyles.onboardingSubtitle,
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
