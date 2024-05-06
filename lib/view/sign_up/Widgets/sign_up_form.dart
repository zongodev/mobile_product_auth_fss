import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:get/get.dart';
import 'package:product_auth_fss/consts/app_style.dart';
import 'package:product_auth_fss/controller/user_controller/user_controller.dart';
import 'package:product_auth_fss/shared/sign_in_up_button.dart';
import 'package:product_auth_fss/shared/form_fiels.dart';
import 'package:product_auth_fss/view/sign_up/Widgets/text_button_row.dart';

import '../../../consts/colors.dart';
import 'package:product_auth_fss/shared/form_fiels.dart';

class SignUpForm extends StatelessWidget {
  const SignUpForm({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final UserController userController = Get.find();
    return Form(
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            CustomFormField(
              label: "Full name",
              icon: const Icon(Icons.person_2_outlined),
              controller: userController.fullName.value,
            ),
            CustomFormField(
              label: "Email",
              icon: const Icon(Icons.email_outlined),
              controller: userController.email.value,
            ),
            CustomFormField(
              label: "Password",
              icon: const Icon(Icons.password_outlined),
              controller: userController.password.value,
            ),
             SignInUpButton(
              btnTitle: 'Sign up', onPress: () async {
               EasyLoading.show(status: "loading ...");
                await userController.createUser();
             },
            ),
            const TextButtonRow(),
          ],
        ),
      ),
    );
  }
}
