import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:lottie/lottie.dart';

import '../../../consts/app_assets.dart';
import '../../../consts/app_style.dart';

class AuthDialog extends StatelessWidget {
  final controller ;
  final String prdName ;
  final String prdCat ;
  final String prdDisc ;
  final String imgUrl ;
  const AuthDialog({
    super.key, required this.controller, required this.prdName, required this.prdCat, required this.prdDisc, required this.imgUrl,
  });

  @override
  Widget build(BuildContext context) {
    return PopScope(
      canPop: true,
      onPopInvoked: (didPop) => controller!.resumeCamera(),
      child: Dialog(
        surfaceTintColor: Colors.white,
        child: Padding(
          padding: const EdgeInsets.all(18.0),
          child: Column(
            mainAxisSize: MainAxisSize.min,

            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  CircleAvatar(backgroundColor: Colors.white,
                    // backgroundColor: Color(0xffffa78d),
                    radius: 55,
                    backgroundImage: NetworkImage(
                      imgUrl
                    ),
                  ),
                  Lottie.asset(
                    AppAssets.prodauth,
                    height: 90,
                  ),
                ],
              ),
              SizedBox(
                width: double.infinity,
                child: Card(
                  surfaceTintColor: Colors.white,
                  margin: EdgeInsets.only(top: 18),
                  shape: RoundedRectangleBorder(
                    side: BorderSide(
                      color: Colors.grey,
                    ),
                    borderRadius: BorderRadius.circular(6),
                  ),
                  child: Padding(
                    padding: const EdgeInsets.all(10.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const Text("Product name :",style:AppStyle.detailsTextStyle ),
                        Text(prdName,style: AppStyle.simpleTextStyle,),
                        const SizedBox(height: 10,),
                        const Text("Product category :",style:AppStyle.detailsTextStyle),
                        Text(prdCat),
                        const SizedBox(height: 10,),
                        const Text("Product description :",style:AppStyle.detailsTextStyle),
                        Text(prdDisc),
                      ],
                    ),
                  ),
                ),
              ),
              SizedBox(height: 15,),
              Align(
                alignment: Alignment.centerRight,
                child: ElevatedButton(
                    onPressed: () {
                      Get.back();
                      controller!.resumeCamera();
                    },
                    child:  const Text("Scan another QR code")),
              )
            ],
          ),
        ),
      ),
    );
  }
}
