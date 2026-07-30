import 'package:flutter/material.dart';
import '../theme/app_theme.dart';
import 'welcome_screen.dart';

class OnboardingScreen extends StatefulWidget {
  const OnboardingScreen({super.key});

  @override
  State<OnboardingScreen> createState() => _OnboardingScreenState();
}

class _OnboardingScreenState extends State<OnboardingScreen> {
  final PageController _controller = PageController();
  int _currentPage = 0;

  void _goNext() {
    if (_currentPage < 1) {
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
    return Scaffold(
      backgroundColor: AppColors.orange,
      body: Stack(
        children: [
          PageView(
            controller: _controller,
            onPageChanged: (index) => setState(() => _currentPage = index),
            children: [
              _buildSlideOne(),
              _buildSlideTwo(),
            ],
          ),
          Positioned(
            top: 50,
            right: 20,
            child: TextButton(
              onPressed: () {
                Navigator.of(context).pushReplacement(
                  MaterialPageRoute(builder: (_) => const WelcomeScreen()),
                );
              },
              child: const Text(
                'Passer',
                style: TextStyle(color: AppColors.white, fontSize: 14),
              ),
            ),
          ),
          Positioned(
            bottom: 40,
            left: 24,
            right: 24,
            child: Row(
              children: [
                Row(
                  children: List.generate(2, (index) {
                    final bool active = index == _currentPage;
                    return AnimatedContainer(
                      duration: const Duration(milliseconds: 250),
                      margin: const EdgeInsets.only(right: 6),
                      width: active ? 20 : 8,
                      height: 8,
                      decoration: BoxDecoration(
                        color: active ? AppColors.white : AppColors.whiteMuted,
                        borderRadius: BorderRadius.circular(4),
                      ),
                    );
                  }),
                ),
                const Spacer(),
                ElevatedButton(
                  onPressed: _goNext,
                  style: ElevatedButton.styleFrom(
                    backgroundColor: AppColors.white,
                    foregroundColor: AppColors.orangeDark,
                    padding: const EdgeInsets.symmetric(
                      horizontal: 24,
                      vertical: 12,
                    ),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(8),
                    ),
                  ),
                  child: Text(_currentPage == 1 ? 'Commencer' : 'Suivant'),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildSlideOne() {
    return Padding(
      padding: const EdgeInsets.fromLTRB(30, 30, 30, 120),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              const Icon(Icons.shopping_bag, color: AppColors.white, size: 26),
              const SizedBox(width: 8),
              const Text(
                'DavidSTORE',
                style: TextStyle(
                  color: AppColors.white,
                  fontSize: 18,
                  fontWeight: FontWeight.w600,
                ),
              ),
            ],
          ),
          const SizedBox(height: 30),
          const Text(
            'Le shopping intelligent commence, ici.',
            style: AppTextStyles.onboardingTitle,
          ),
          const SizedBox(height: 20),
          const Text(
            'Des milliers de produits à prix compétitifs pour développer votre activité.',
            style: AppTextStyles.onboardingSubtitle,
          ),
          const Spacer(),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              _productIcon(Icons.headphones),
              _productIcon(Icons.shopping_bag_outlined),
              _productIcon(Icons.watch),
              _productIcon(Icons.diamond_outlined),
            ],
          ),
        ],
      ),
    );
  }

  Widget _productIcon(IconData icon) {
    return Container(
      width: 70,
      height: 70,
      decoration: BoxDecoration(
        color: AppColors.white,
        borderRadius: BorderRadius.circular(16),
      ),
      child: Icon(icon, color: AppColors.orangeDark, size: 32),
    );
  }

  Widget _buildSlideTwo() {
    return Column(
      children: [
        Expanded(
          child: Stack(
            alignment: Alignment.center,
            children: [
              const Icon(Icons.person, size: 140, color: AppColors.white),
              const Positioned(
                top: 30,
                right: 40,
                child: Icon(Icons.sports_esports, size: 50, color: AppColors.white),
              ),
              const Positioned(
                top: 90,
                right: 60,
                child: Icon(Icons.visibility_outlined, size: 40, color: AppColors.white),
              ),
            ],
          ),
        ),
        Container(
          width: double.infinity,
          padding: const EdgeInsets.fromLTRB(30, 30, 30, 120),
          decoration: const BoxDecoration(
            color: AppColors.white,
            borderRadius: BorderRadius.only(
              topLeft: Radius.circular(30),
              topRight: Radius.circular(30),
            ),
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Icon(Icons.shopping_cart, color: AppColors.orangeDark, size: 36),
              const SizedBox(height: 12),
              const Text(
                'Sélections tendance prêtes à être expédiées',
                style: AppTextStyles.cardTitle,
              ),
              const SizedBox(height: 8),
              const Text(
                'Découvrez les meilleurs produits, livrés rapidement partout en RDC.',
                style: AppTextStyles.cardBody,
              ),
            ],
          ),
        ),
      ],
    );
  }
}
