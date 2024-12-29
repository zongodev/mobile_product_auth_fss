import 'package:flutter/material.dart';
import 'package:product_auth_fss/consts/colors.dart';

class AppStyle {
  static const h1Style = TextStyle(
    color: Colors.black,
    fontFamily: "Montserrat",
    fontSize: 36,
  );
  static const buttonsStyle = TextStyle(
      color: Colors.white,
      fontFamily: "Montserrat",
      fontSize: 20,
      fontWeight: FontWeight.bold);
  static const simpleTextStyle = TextStyle(
    color: Colors.black,
    fontFamily: "Montserrat",
    fontSize: 14,
  );
  static const specificCaseStyle = TextStyle(
    color: ThemeColors.kPrimaryColor,
    fontFamily: "Montserrat",
    fontSize: 15,
    fontWeight: FontWeight.bold,
  );
  static const detailsTextStyle = TextStyle(
    fontFamily: "Montserrat",
    fontSize: 20,
    color: ThemeColors.kPrimaryColor,
  );
  static const errorAuthProduct = TextStyle(
    fontFamily: "Montserrat",
    fontSize: 16,
    color: Colors.red,
    fontWeight: FontWeight.bold

  );
}
