import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:product_auth_fss/consts/app_style.dart';
import 'package:product_auth_fss/consts/colors.dart';

import '../../controller/qr_scan_controller/qr_scan_controller.dart';

class ProductAuthScreen extends StatelessWidget {
  const ProductAuthScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final QrScanner qrController = Get.find();
    final Size size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          "Product Scanned Details",
          style: AppStyle.specificCaseStyle,
        ),
        leading: IconButton(
          onPressed: () {
            Get.back();
            qrController.controller!.resumeCamera();
          },
          icon: const Icon(Icons.arrow_back),
          color: ThemeColors.kPrimaryColor,
        ),
        elevation: 0,
      ),
      body: Stack(
        children: [
          Positioned(
            left: 0,
            right: 0,
            child: Container(
              width: double.infinity,
              height: size.height / 2.09,
              decoration: BoxDecoration(
                image: DecorationImage(
                  image: NetworkImage(
                    qrController.scannedProduct.value.imageUrl!,
                  ),
                  fit: BoxFit.cover,
                ),
              ),
            ),
          ),
          Positioned(
            left: 0,
            right: 0,
            top: (size.height / 2.09)-30,
            bottom: 0,
            child: Container(
              padding: const  EdgeInsets.only(left: 15,top: 15,right: 15),
              decoration: const BoxDecoration(
                borderRadius: BorderRadius.only(topLeft: Radius.circular(20),topRight: Radius.circular(20)),
                color: Colors.white,
                boxShadow: [
                  BoxShadow(
                    color: Colors.grey,
                    offset: Offset(0.0, 1.0),
                    blurRadius: 6.0,
                  ),
                ],

              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text("Product name :",style:AppStyle.detailsTextStyle ),
                  Text(qrController.scannedProduct.value.productName!,style: AppStyle.simpleTextStyle,),
                  const SizedBox(height: 10,),
                  const Text("Product category :",style:AppStyle.detailsTextStyle),
                  Text(qrController.scannedProduct.value.category!),
                  const SizedBox(height: 10,),
                  const Text("Product description :",style:AppStyle.detailsTextStyle),
                  Text(qrController.scannedProduct.value.description!),



                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
/*Stack(
        fit: StackFit.expand,
        children: [
          Image.network(
            qrController.scannedProduct.value.imageUrl!,
            fit: BoxFit.cover,
          ),
          DraggableScrollableSheet(
            initialChildSize: 0.3,
            maxChildSize: 0.8,
            minChildSize: 0.1,
            builder: (context, scrollController) {
              return Card(
                margin: EdgeInsets.zero,
                surfaceTintColor: Colors.transparent,
                color: Colors.white70,
                shape: const RoundedRectangleBorder(
                    borderRadius: BorderRadiusDirectional.only(
                        topStart: Radius.circular(15),
                        topEnd: Radius.circular(15))),
                child: ListView(
                  padding: EdgeInsets.all(40),
                  controller: scrollController,
                  children: [
                    Text(qrController.scannedProduct.value.productName!),
                    Text(qrController.scannedProduct.value.category!),
                    Text(qrController.scannedProduct.value.description!),
                  ],
                ),
              );
            },
          )
        ],
      ),*/
