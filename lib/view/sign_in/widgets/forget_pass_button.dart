import 'package:flutter/material.dart';

import '../../../consts/app_style.dart';
class ForgetPassButton extends StatelessWidget {
  const ForgetPassButton({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 8.0,bottom: 16),
      child: InkWell(
        onTap: (){},
        child: const Text("Forget password ?",style: AppStyle.specificCaseStyle,),
      ),
    );
  }
}
