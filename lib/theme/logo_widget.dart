import 'package:flutter/material.dart';
import 'app_theme.dart';

class DavidStoreLogo extends StatelessWidget {
  final double iconSize;
  final double fontSize;
  final bool showTagline;

  const DavidStoreLogo({
    super.key,
    this.iconSize = 90,
    this.fontSize = 32,
    this.showTagline = false,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        Icon(
          Icons.shopping_bag_outlined,
          size: iconSize,
          color: AppColors.white,
        ),
        const SizedBox(height: 12),
        RichText(
          text: TextSpan(
            children: [
              TextSpan(text: 'DAVID', style: AppTextStyles.logo.copyWith(fontSize: fontSize)),
              TextSpan(text: 'STORE', style: AppTextStyles.logoAccent.copyWith(fontSize: fontSize)),
            ],
          ),
        ),
        if (showTagline) ...[
          const SizedBox(height: 6),
          Text(
            'ACHETEZ PLUS, PAYEZ MOINS, NOUS LIVRONS',
            style: TextStyle(
              fontSize: 10,
              color: AppColors.whiteMuted,
              letterSpacing: 0.5,
            ),
            textAlign: TextAlign.center,
          ),
        ],
      ],
    );
  }
}
