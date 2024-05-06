import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:product_auth_fss/controller/qr_scan_controller/qr_scan_controller.dart';
import 'package:qr_code_scanner/qr_code_scanner.dart';

class ScanCodePage extends StatelessWidget {
  const ScanCodePage({super.key});


  @override
  Widget build(BuildContext context) {
    final QrScanner qrController= Get.find();
    return Scaffold(
      body: Column(
        children: <Widget>[
          Expanded(
            flex: 5,
            child: QRView(
              key: qrController.qrKey,
              onQRViewCreated: qrController.onQRViewCreated,
            ),
          ),
          Expanded(
            flex: 1,
            child: Obx(
              () =>  Center(
                child: (qrController.result.value != "")
                    ? Text(
                    '   Data: ${qrController.result.value}')
                    : const Text('Scan a code'),
              ),
            ),
          )
        ],
      ),
    );
  }
}
