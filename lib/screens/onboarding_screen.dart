import 'package:flutter/material.dart';
import '../theme/app_theme.dart';
import 'welcome_screen.dart';

class _OnboardingSlide {
  final IconData icon;
  final String title;
  final String body;

  const _OnboardingSlide({
    required this.icon,
    required this.title,
    required this.body,
  });
}

class OnboardingScreen extends StatefulWidget {
  const OnboardingScreen({super.key});

  @override
  State<OnboardingScreen> createState() => _OnboardingScreenState();
}

class _OnboardingScreenState extends State<OnboardingScreen> {
  final PageController _controller = PageController();
  int _currentPage = 0;

  final List<_OnboardingSlide> _slides = const [
    _OnboardingSlide(
      icon: Icons.workspace_premium_outlined,
      title: 'Qualité Premium',
      body: 'Découvrez des produits soigneusement sélectionnés pour vous '
          'garantir l\'excellence au quotidien.',
    ),
    _OnboardingSlide(
      icon: Icons.local_shipping_outlined,
      title: 'Livraison Rapide',
      body: 'Recevez vos articles directement chez vous ou au bureau dans '
          'les plus brefs délais.',
    ),
    _OnboardingSlide(
      icon: Icons.local_shipping_outlined,
      title: 'Livraison Rapide',
      body: 'Recevez vos articles directement chez vous ou au bureau dans '
          'les plus brefs délais.',
    ),
    _OnboardingSlide(
      icon: Icons.lock_outline,
      title: 'Paiement Sécurisé',
      body: 'Payez en toute confiance via nos options mobiles sécurisées '
          '(M-Pesa, Airtel Money, Orange Money).',
    ),
  ];

  void _goNext() {
    if (_currentPage < _slides.length - 1) {
      _controller.nextPage(
        duration: const Duration(milliseconds: 300),
        curve: Curves.easeInOut,
      );
    } else {
      Navigator.of(context).pushReplacement(
        MaterialPageRoute(builder: (_) => const WelcomeScreen()),
      );
    }
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final bool isLast = _currentPage == _slides.length - 1;

    return Scaffold(
      backgroundColor: AppColors.navyDark,
      body: SafeArea(
        child: Column(
          children: [
            Expanded(
              child: PageView.builder(
                controller: _controller,
                itemCount: _slides.length,
                onPageChanged: (index) => setState(() => _currentPage = index),
                itemBuilder: (context, index) {
                  final slide = _slides[index];
                  return Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 32),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Icon(slide.icon, size: 90, color: AppColors.gold),
                        const SizedBox(height: 28),
                        Text(
                          slide.title,
                          style: AppTextStyles.onboardingTitle,
                          textAlign: TextAlign.center,
                        ),
                        const SizedBox(height: 10),
                        Text(
                          slide.body,
                          style: AppTextStyles.onboardingBody,
                          textAlign: TextAlign.center,
                        ),
                      ],
                    ),
                  );
                },
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: List.generate(_slides.length, (index) {
                final bool active = index == _currentPage;
                return AnimatedContainer(
                  duration: const Duration(milliseconds: 250),
                  margin: const EdgeInsets.symmetric(horizontal: 4),
                  width: active ? 20 : 8,
                  height: 8,
                  decoration: BoxDecoration(
                    color: active ? AppColors.gold : AppColors.whiteMuted,
                    borderRadius: BorderRadius.circular(4),
                  ),
                );
              }),
            ),
            const SizedBox(height: 24),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 24),
              child: SizedBox(
                width: double.infinity,
                child: OutlinedButton(
                  onPressed: _goNext,
                  style: OutlinedButton.styleFrom(
                    side: const BorderSide(color: AppColors.white),
                    padding: const EdgeInsets.symmetric(vertical: 14),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(8),
                    ),
                  ),
                  child: Text(
                    isLast ? 'Commencer' : 'Suivant',
                    style: AppTextStyles.buttonText,
                  ),
                ),
              ),
            ),
            const SizedBox(height: 32),
          ],
        ),
      ),
    );
  }
}
