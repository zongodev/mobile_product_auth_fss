import 'package:flutter/material.dart';

import '../consts/app_style.dart';
import '../consts/colors.dart';
import '../view/qr_scan/qr_scan.dart';
class SignInUpButton extends StatelessWidget {
  const SignInUpButton({
    super.key, required this.btnTitle, required this.onPress,
  });
final String btnTitle;
final void Function() onPress;
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      height: 50,
      child: ElevatedButton(
        onPressed: onPress,
        style: ElevatedButton.styleFrom(
          backgroundColor: ThemeColors.kPrimaryColor,
          foregroundColor: Colors.white,
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15),),
          textStyle: AppStyle.buttonsStyle,
        ),
        child:  Text(btnTitle),
      ),
    );
  }
}
