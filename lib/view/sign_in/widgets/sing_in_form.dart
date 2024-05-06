import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:get/get.dart';

import '../../../controller/user_controller/user_controller.dart';
import '../../../shared/form_fiels.dart';
import '../../../shared/sign_in_up_button.dart';
import 'forget_pass_button.dart';

class SignInForm extends StatelessWidget {
  const SignInForm({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final UserController userController = Get.find();

    return Form(
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
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
            const ForgetPassButton(),
             SignInUpButton(
              btnTitle: 'Sign in', onPress: () async{
               EasyLoading.show(status: "loading ...");
               await userController.signInUser();
             },
            ),
          ],
        ),
      ),
    );
  }
}
