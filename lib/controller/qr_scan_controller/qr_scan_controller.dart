import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:qr_code_scanner/qr_code_scanner.dart';
import 'dart:io';


class QrScanner extends GetxController{
  final GlobalKey qrKey = GlobalKey(debugLabel: 'QR');
  final  RxString result="".obs;
  QRViewController? controller;

  void onQRViewCreated(QRViewController controller) {
    this.controller = controller;
    controller.scannedDataStream.listen((scanData) {
      if(scanData.code!.contains("az")){
        result.value = scanData.code.toString();
        update();

      }
      else {
        result.value="none";
        update();

      }

    });
  }

  @override
  void dispose() {
    controller?.dispose();
    super.dispose();
  }
 /* @override
  void reassemble() {
    super.reassemble();
    if (Platform.isAndroid) {
      controller!.pauseCamera();
    } else if (Platform.isIOS) {
      controller!.resumeCamera();
    }
  }*/
}