import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:product_auth_fss/routes/app_routes.dart';
import 'package:product_auth_fss/view/sign_in/sign_in.dart';

import '../../../consts/app_style.dart';
class TextButtonRow extends StatelessWidget {
  const TextButtonRow({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.0),
      child: Row(
        children: [
          const Text("Already a member? ",style: AppStyle.simpleTextStyle,),
          InkWell(
            onTap: (){
              Get.toNamed(AppRoutes.login);
            },
            child: const Text(" Log in",style: AppStyle.specificCaseStyle,),
          ),
        ],
      ),
    );
  }
}
