import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:product_auth_fss/consts/app_assets.dart';
import 'package:product_auth_fss/consts/app_style.dart';
import 'package:product_auth_fss/consts/colors.dart';
import 'package:product_auth_fss/controller/user_controller/user_controller.dart';

import '../../shared/header.dart';
import 'Widgets/sign_up_form.dart';

class Register extends StatelessWidget {
  const Register({super.key});

  @override
  Widget build(BuildContext context) {
    Get.put(UserController());

    return const Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            children: [
              Header(title: 'Get Started',),
              SignUpForm(),
            ],
          ),
        ),
      ),
    );
  }
}


