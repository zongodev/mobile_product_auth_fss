import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:product_auth_fss/consts/app_style.dart';
import 'package:product_auth_fss/controller/user_controller/user_controller.dart';
class ResetPass extends StatelessWidget {
  const ResetPass({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final UserController authController = Get.find();
    return  Scaffold(
      appBar: AppBar(
        title: const Text("Forgot password"),
      ),
      body:Padding(
        padding: const EdgeInsets.only(top: 70.0,left: 18,right: 18),
        child: Column(

          children: [
            Text(
              "Enter your email and we will send you a password reset link",style: AppStyle.specificCaseStyle,),
            SizedBox(height: 20,),
            TextFormField(
              controller: authController.resetController,
              decoration: InputDecoration(
                enabledBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10),
                  borderSide: const BorderSide(
                      color: Color(0xffD0D5DD), width: 2),
                ),
                focusedBorder: OutlineInputBorder(
                  borderSide: const BorderSide(
                      color: Color(0xffD0D5DD), width: 2),
                  borderRadius: BorderRadius.circular(10),
                ),
                hintText: "user@example.com",
              ),
            ),
            SizedBox(height: 20,),
            Align(
              alignment: Alignment.bottomRight,
              child: ElevatedButton(
                  onPressed: () async {
                    await authController
                        .resetPass(authController.resetController.text);
                  },
                  child: const Text("Reset password")),
            )
          ],
        ),
      ) ,
    );
  }
}
