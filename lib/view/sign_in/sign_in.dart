import 'package:flutter/material.dart';
import 'package:product_auth_fss/shared/header.dart';
import 'package:product_auth_fss/view/sign_in/widgets/sing_in_form.dart';

import '../../shared/form_fiels.dart';
import '../../shared/sign_in_up_button.dart';

class SignIn extends StatelessWidget {
  const SignIn({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            children: [
              Header(
                title: 'Welcome back',
              ),
              SignInForm(),
            ],
          ),
        ),
      ),
    );
  }
}
