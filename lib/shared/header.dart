import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:lottie/lottie.dart';
import 'package:product_auth_fss/consts/colors.dart';

import '../consts/app_assets.dart';
import '../consts/app_style.dart';
class Header extends StatelessWidget {
  const Header({
    super.key, required this.title,
  });
final String title;
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      height: 250,
      child: Stack(
        alignment: Alignment.center,
        children: [
          title=="Welcome back"?
          Lottie.asset(AppAssets.signIn):Lottie.asset(AppAssets.signUp2),
           Align(
            alignment: Alignment.bottomCenter,
            child: Text(title, style: AppStyle.h1Style,),
          ),
        ],
      ),
    );
  }
}
