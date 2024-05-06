import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

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
          SvgPicture.asset(AppAssets.signInUp,width: 321,),
           Align(
            alignment: Alignment.bottomCenter,
            child: Text(title, style: AppStyle.h1Style,),
          ),
        ],
      ),
    );
  }
}
