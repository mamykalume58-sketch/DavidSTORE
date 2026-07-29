git add lib/screens/onboarding_screen.dart
git commit -m "Ajout navigation onboarding (suivant/passer/commencer)"
git push
import 'package:flutter/material.dart';
import '../theme/app_theme.dart';

class OnboardingScreen extends StatefulWidget {
  const OnboardingScreen({super.key});

  @override
  State<OnboardingScreen> createState() => _OnboardingScreenState();
}

class _OnboardingScreenState extends State<OnboardingScreen> {
  final PageController _controller = PageController();

  int _currentPage = 0;

  final List<Map<String, String>> _slides = [
    {
      "title": "Bienvenue sur DavidSTORE",
      "description":
          "Votre boutique digitale moderne pour acheter facilement vos produits préférés.",
      "image": "assets/images/onboarding1.png",
    },
    {
      "title": "Découvrez nos produits",
      "description":
          "Explorez un catalogue riche avec une expérience rapide et élégante.",
      "image": "assets/images/onboarding2.png",
    },
    {
      "title": "Commandez facilement",
      "description":
          "Payez simplement et suivez vos commandes en toute sécurité.",
      "image": "assets/images/onboarding3.png",
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.navyDark,
      body: SafeArea(
        child: Column(
          children: [
            Expanded(
              child: PageView.builder(
                controller: _controller,
                itemCount: _slides.length,
                onPageChanged: (index) {
                  setState(() {
                    _currentPage = index;
                  });
                },
                itemBuilder: (context, index) {
                  return Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Image.asset(
                        _slides[index]["image"]!,
                        height: 280,
                      ),

                      const SizedBox(height: 40),

                      Text(
                        _slides[index]["title"]!,
                        textAlign: TextAlign.center,
                        style: const TextStyle(
                          color: Colors.white,
                          fontSize: 28,
                          fontWeight: FontWeight.bold,
                        ),
                      ),

                      const SizedBox(height: 20),

                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 30),
                        child: Text(
                          _slides[index]["description"]!,
                          textAlign: TextAlign.center,
                          style: TextStyle(
                            color: Colors.white.withOpacity(0.7),
                            fontSize: 16,
                          ),
                        ),
                      ),
                    ],
                  );
                },
              ),
            ),

            // Indicateurs
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: List.generate(
                _slides.length,
                (index) => Container(
                  margin: const EdgeInsets.all(5),
                  width: _currentPage == index ? 28 : 8,
                  height: 8,
                  decoration: BoxDecoration(
                    color: _currentPage == index
                        ? Colors.blueAccent
                        : Colors.white30,
                    borderRadius: BorderRadius.circular(10),
                  ),
                ),
              ),
            ),

            const SizedBox(height: 30),
          ],
        ),
      ),
    );
  }
}
