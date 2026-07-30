import 'package:flutter/material.dart';
import '../theme/app_theme.dart';

class WelcomeScreen extends StatelessWidget {
  const WelcomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.navyDark,
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 24),
          child: Column(
            children: [
              const SizedBox(height: 20),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Icon(Icons.shopping_bag_outlined,
                      color: AppColors.white, size: 28),
                  const SizedBox(width: 8),
                  RichText(
                    text: const TextSpan(
                      children: [
                        TextSpan(
                          text: 'DAVID',
                          style: TextStyle(
                            fontSize: 22,
                            fontWeight: FontWeight.bold,
                            color: AppColors.white,
                          ),
                        ),
                        TextSpan(
                          text: 'STORE',
                          style: TextStyle(
                            fontSize: 22,
                            fontWeight: FontWeight.bold,
                            color: AppColors.orange,
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 16),
              const Text(
                'Le shopping intelligent\ncommence ici.',
                textAlign: TextAlign.center,
                style: TextStyle(
                  color: AppColors.white,
                  fontSize: 22,
                  fontWeight: FontWeight.w600,
                  height: 1.3,
                ),
              ),
              const Spacer(),
              const Icon(Icons.public, size: 130, color: AppColors.orange),
              const Spacer(),
              _socialButton(
                icon: Icons.g_mobiledata,
                label: 'Continuer avec Google',
                background: AppColors.white,
                textColor: AppColors.textDark,
                onTap: () {},
              ),
              const SizedBox(height: 12),
              _socialButton(
                icon: Icons.facebook,
                label: 'Continuer avec Facebook',
                background: const Color(0xFF1877F2),
                textColor: AppColors.white,
                onTap: () {},
              ),
              const SizedBox(height: 16),
              Row(
                children: [
                  Expanded(child: Divider(color: AppColors.whiteMuted)),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 12),
                    child: Text('OU',
                        style: TextStyle(color: AppColors.whiteMuted)),
                  ),
                  Expanded(child: Divider(color: AppColors.whiteMuted)),
                ],
              ),
              const SizedBox(height: 16),
              _socialButton(
                icon: Icons.email_outlined,
                label: 'Continuer avec e-mail',
                background: Colors.transparent,
                textColor: AppColors.orange,
                border: AppColors.orange,
                onTap: () {},
              ),
              const SizedBox(height: 20),
              TextButton(
                onPressed: () {},
                child: const Text(
                  'Continuer en tant qu\'invité',
                  style: TextStyle(color: AppColors.whiteMuted),
                ),
              ),
              const SizedBox(height: 20),
            ],
          ),
        ),
      ),
    );
  }

  Widget _socialButton({
    required IconData icon,
    required String label,
    required Color background,
    required Color textColor,
    Color? border,
    required VoidCallback onTap,
  }) {
    return SizedBox(
      width: double.infinity,
      child: ElevatedButton.icon(
        onPressed: onTap,
        icon: Icon(icon, color: textColor),
        label: Text(
          label,
          style: AppTextStyles.buttonText.copyWith(color: textColor),
        ),
        style: ElevatedButton.styleFrom(
          backgroundColor: background,
          padding: const EdgeInsets.symmetric(vertical: 14),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(30),
            side: border != null
                ? BorderSide(color: border)
                : BorderSide.none,
          ),
          elevation: background == Colors.transparent ? 0 : 2,
        ),
      ),
    );
  }
}
