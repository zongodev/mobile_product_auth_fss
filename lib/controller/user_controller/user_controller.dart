import 'dart:developer';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:get/get.dart';
import 'package:product_auth_fss/model/user_model.dart';
import 'package:product_auth_fss/routes/app_pages.dart';
import 'package:product_auth_fss/routes/app_routes.dart';
import 'package:product_auth_fss/services/auth_service.dart';
import 'package:product_auth_fss/services/user_service.dart';

class UserController extends GetxController {
  final Rx<TextEditingController> fullName = TextEditingController().obs;
  final Rx<TextEditingController> email = TextEditingController().obs;
  final Rx<TextEditingController> password = TextEditingController().obs;
  final UserService userService = UserService();
  final AuthService authService = AuthService();

  Future<void> addUser() async {
    try {
      UserModel user =
          UserModel(fullName: fullName.value.text, email: email.value.text);
      await userService.addUser(user);
    } catch (e) {
      log(e.toString());
    }
  }

  Future<void> createUser() async {
    try {
      await authService
          .createUser(email.value.text, password.value.text)
          .then((_) async => await addUser().then((_) {
                clearFields();
                Get.offNamed(AppRoutes.qrScan);
                 EasyLoading.dismiss();
                EasyLoading.showSuccess("Account created !");
              }));
    } catch (e) {
      EasyLoading.dismiss();
      Get.snackbar("Could not Sign Up", e.toString(),
          snackPosition: SnackPosition.BOTTOM,
          duration: const Duration(seconds: 7),
          icon: const Icon(
            Icons.error_outline,
            color: Colors.white,
            size: 40,
          ),
          margin: const EdgeInsets.only(bottom: 10),
          backgroundColor: const Color(0xffE6284A),
          colorText: Colors.white);
    }
  }

  Future<void> signInUser() async {
    try {
      await authService
          .signInUser(email.value.text, password.value.text)
          .then((_) async {
        {
          clearFields();
          Get.offNamed(AppRoutes.qrScan);
          return EasyLoading.dismiss();
        }
      });
    } catch (e) {
      EasyLoading.dismiss();
      Get.snackbar("Could not Sign in", e.toString(),
          snackPosition: SnackPosition.BOTTOM,
          duration: const Duration(seconds: 7),
          icon: const Icon(
            Icons.error_outline,
            color: Colors.white,
            size: 40,
          ),
          margin: const EdgeInsets.only(bottom: 10),
          backgroundColor: const Color(0xffE6284A),
          colorText: Colors.white);
    }
  }

  clearFields() {
    fullName.value.clear();
    email.value.clear();
    password.value.clear();
  }
}
