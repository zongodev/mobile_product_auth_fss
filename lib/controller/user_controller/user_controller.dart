import 'dart:developer';

import 'package:firebase_auth/firebase_auth.dart';
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
  final Stream<User?> userStream = FirebaseAuth.instance.authStateChanges();
  Rx<User?> authUser = Rx<User?>(null);
  final TextEditingController resetController = TextEditingController();


  @override
  void onInit() {
    super.onInit();
    userStream.listen((user) {
      authUser.value = user;
      if (user != null) {
        Get.offAllNamed(AppRoutes.qrScan);
        log(user.email.toString());
      } else {
        Get.offAllNamed(AppRoutes.register);
      }
    });
  }

  Future<void> addUser() async {
    try {
      UserModel user =
          UserModel(fullName: fullName.value.text, email: email.value.text);
      await userService.addUser(user, authUser.value!.uid);
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
                Get.offAllNamed(AppRoutes.qrScan);
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
          Get.offAllNamed(AppRoutes.qrScan);
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

  Future<void> logOut() async {
    try {
      await authService.logOut().then((value) {
        Get.snackbar(
          "Logout Successful",
          "You have been successfully logged out.",
          backgroundColor: Colors.green,
          snackPosition: SnackPosition.BOTTOM,
        );
        Get.offAllNamed(AppRoutes.login);
      });
    } catch (e) {
      throw Exception(e);
    }
  }
  Future<void> resetPass(String email) async {
    try {

      await authService.resetPass(email).then((value) {
        resetController.clear();
        Get.back();
        return Get.snackbar("Success", "A password reset link has been sent to your email. Please check your inbox.",
            snackPosition: SnackPosition.BOTTOM,
            duration: const Duration(seconds: 7),
            icon: const Icon(
              Icons.check,
              color: Colors.white,
              size: 40,
            ),
            maxWidth: 500,
            margin: const EdgeInsets.only(bottom: 10),
            backgroundColor: Colors.green,
            colorText: Colors.white);
      },);

    } on FirebaseAuthException catch (e) {
      Get.snackbar("Error", e.toString(),
          snackPosition: SnackPosition.BOTTOM,
          duration: const Duration(seconds: 7),
          icon: const Icon(
            Icons.error_outline,
            color: Colors.white,
            size: 40,
          ),
          maxWidth: 500,
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
