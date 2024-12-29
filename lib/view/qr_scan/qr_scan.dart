import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:product_auth_fss/consts/app_style.dart';
import 'package:product_auth_fss/consts/colors.dart';
import 'package:product_auth_fss/controller/qr_scan_controller/qr_scan_controller.dart';
import 'package:product_auth_fss/controller/user_controller/user_controller.dart';
import 'package:qr_code_scanner/qr_code_scanner.dart';

class ScanCodePage extends StatelessWidget {
  const ScanCodePage({super.key});


  @override
  Widget build(BuildContext context) {
    final QrScanner qrController= Get.find();
    final UserController userController= Get.find();
    final GlobalKey qrKey = GlobalKey(debugLabel: 'QR');

    return Scaffold(
      appBar: AppBar(
        title:  const Text("Scan a code ", style: AppStyle.simpleTextStyle,),
        actions: [IconButton(onPressed: () => userController.logOut(), icon: const Icon(Icons.logout,color: ThemeColors.kPrimaryColor,))],
      ),
      body: Column(
        children: <Widget>[
          Expanded(
            flex: 5,
            child: QRView(
              key: qrKey,
              onQRViewCreated: qrController.onQRViewCreated,
            ),
          ),
        ],
      ),
    );
  }
}
