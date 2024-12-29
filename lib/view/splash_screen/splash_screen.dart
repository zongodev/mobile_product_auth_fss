import 'package:animated_splash_screen/animated_splash_screen.dart';
import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:product_auth_fss/consts/app_assets.dart';
import 'package:product_auth_fss/view/sign_up/register.dart';

import '../onboardingscreen/onboarding_screen.dart';

class SplashScreen extends StatelessWidget {
  const SplashScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return AnimatedSplashScreen(
      curve: Curves.bounceIn,
      splash: LottieBuilder.asset(AppAssets.splashIcon),
      nextScreen: const OnBoardingPage(),
     splashIconSize: 400,
      animationDuration: const Duration(seconds: 5),
      backgroundColor: const Color(0xff22292f),

    );
  }
}
