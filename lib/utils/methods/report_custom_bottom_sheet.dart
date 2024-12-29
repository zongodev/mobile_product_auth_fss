import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'package:lottie/lottie.dart';
import 'package:product_auth_fss/consts/app_style.dart';
import 'package:product_auth_fss/consts/colors.dart';
import 'package:product_auth_fss/view/report/report.dart';

import '../../consts/app_assets.dart';

class Methode {
  static Size size = MediaQuery.of(Get.context!).size;

  static Future<dynamic> reportCustomShowModalBottomSheet(

      ) {
    return showModalBottomSheet(

      showDragHandle: true,
      backgroundColor: Colors.white,
      context: Get.context!,
      builder: (context) {
        return Padding(
          padding: const EdgeInsets.symmetric(horizontal: 18.0),
          child: Column(
            children: [
              LottieBuilder.asset(
                AppAssets.reportProblem,
                height: size.height * 0.2,
              ),
              const Text(
                "Report a Technical Issue",
                style: AppStyle.specificCaseStyle,
              ),
              SizedBox(
                height: size.height * 0.02,
              ),
              const Text(
                "If you've encountered a problem while using the app, please let us know."
                " Your feedback helps us improve our app.",
                style: AppStyle.simpleTextStyle,
              ),
              SizedBox(
                height: size.height * 0.04,
              ),
              ElevatedButton(
                onPressed: () {
                  Get.to(Report());
                },
                style: ElevatedButton.styleFrom(
                  fixedSize: Size(size.width, 40),
                  backgroundColor: ThemeColors.kSecColor,
                  foregroundColor: Colors.white,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(15),
                  ),
                  textStyle: AppStyle.buttonsStyle.copyWith(fontSize: 15),
                ),
                child: const Text("Report Issue"),
              )
            ],
          ),
        );
      },
    );
  }
}
