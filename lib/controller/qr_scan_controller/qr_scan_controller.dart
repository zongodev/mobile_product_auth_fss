  import 'dart:developer';

  import 'package:audioplayers/audioplayers.dart';
  import 'package:cloud_firestore/cloud_firestore.dart';
  import 'package:firebase_auth/firebase_auth.dart';
  import 'package:flutter/cupertino.dart';
  import 'package:flutter/material.dart';
  import 'package:flutter/widgets.dart';
  import 'package:flutter_easyloading/flutter_easyloading.dart';
  import 'package:flutter_tts/flutter_tts.dart';
  import 'package:get/get.dart';
  import 'package:lottie/lottie.dart';
  import 'package:product_auth_fss/consts/app_style.dart';
  import 'package:product_auth_fss/controller/user_controller/user_controller.dart';
  import 'package:product_auth_fss/model/notification_model.dart';
  import 'package:product_auth_fss/model/product_model.dart';
  import 'package:product_auth_fss/routes/app_routes.dart';
  import 'package:product_auth_fss/services/notification_service.dart';
  import 'package:product_auth_fss/services/qr_service.dart';
  import 'package:product_auth_fss/utils/methods/report_custom_bottom_sheet.dart';
  import 'package:qr_code_scanner/qr_code_scanner.dart';
  import 'package:shake/shake.dart';

  import '../../consts/app_assets.dart';
  import '../../utils/helpercrypt.dart';
import '../../view/qr_scan/widget/authdialog.dart';
  import '../../view/qr_scan/widget/report_problem_dialog.dart';

  class QrScanner extends GetxController {
    final FlutterTts flutterTts = FlutterTts();
    final RxString result = "".obs;
    QRViewController? controller;
    final QrService qrService = QrService();
    final NotificationService notificationService = NotificationService();
    final Rx<ProductModel> scannedProduct = Rx(ProductModel(
        productName: "", category: "", description: "", imageUrl: ""));
    final User? user = Get.find<UserController>().authUser.value;
    final RxString scannedData = "".obs;
    final RxString scannedDataFake = "".obs;
    final RxList allProducts = [].obs;
    ShakeDetector? detector;
    final EncryptionHelper encryptionHelper =
    EncryptionHelper('ug7hItnmetC4atRLpDYxqan1199p9hPr');


    Future<void> onQRViewCreated(QRViewController controller) async {
      this.controller = controller;
      allProducts.value = await fetchProducts();

      controller.scannedDataStream.listen((scanData) async {
        print("Encrypted QR Data: ${scanData.code}");
        scannedDataFake.value=scanData.code ?? "";
        String? decryptedData =  encryptionHelper.decrypt(scanData.code ?? "");
        print("Decrypted QR Data: $decryptedData");
        scannedData.value = decryptedData ?? "";

        controller.pauseCamera();
        await validProduct();
        update();
      });
    }

    Future<void> validProduct() async {
      bool found = false;
      final player = AudioPlayer();
      for (ProductModel product in allProducts) {
        log("prd :${product.productId.toString()}");
        if (scannedData.contains(product.productId.toString())) {
          scannedProduct.value = product;
          result.value = scannedData.value;
          found = true;
          controller?.pauseCamera();
          EasyLoading.showSuccess('Authentication successful.');
          await speakText(
              "Authentication successful. This product is verified as genuine. Thank you for checking.");
          //await player.play(AssetSource("audio/succ.ogg"));
          log("${product.imageUrl}");
          /*speakText("Product authenticated");*/
          EasyLoading.dismiss();
          Get.dialog(
             AuthDialog(controller: controller, prdName: scannedProduct.value.productName!, prdCat: scannedProduct.value.category!, prdDisc: scannedProduct.value.description!, imgUrl: scannedProduct.value.imageUrl!,),
          );
          break;
        }
      }
      if (!found) {
        log("data :${scannedData.value}");
        await sendNotification();
        Get.dialog(
          PopScope(
           canPop: true,
            onPopInvoked: (_)=>controller!.resumeCamera(),
            child: AlertDialog(
              title: const Text(
                "Product not autheticated",
                style: AppStyle.errorAuthProduct,
              ),
              icon: Lottie.asset(
                AppAssets.errorScan,
                height: 120,
              ),
              actions: [
                ElevatedButton(
                    onPressed: () {
                      Get.back();
                      controller!.resumeCamera();
                    },
                    child:  const Text("Scan another QR code"))
              ],
            ),
          ),
        );
        result.value =
            "Oops! Product not authenticated. Please scan an authenticated product.";

        await speakText(result.value);
        EasyLoading.dismiss();
      }
    }

    Future<List> fetchProducts() async {
      return await QrService().products().then((value) =>
          value.map((e) => ProductModel.fromDocumentSnapshot(e)).toList());
    }

    Future<void> speakText(text) async {
      await flutterTts.setLanguage('en-US');
      await flutterTts.setSpeechRate(0.5);
      await flutterTts.speak(text);
      await flutterTts.awaitSpeakCompletion(true);
    }

    Future<void> sendNotification() async {
      NotificationModel notification = NotificationModel(
          title: "Unauthenticated Product Alert",
          content:
              "The user with email ${user!.email} has scanned a product that could not be authenticated.",
          qrData: scannedDataFake.value,
          usedID: user!.uid, userEmail: user!.email,

      );
      await notificationService.addNotification(notification);
    }

    @override
    void dispose() {
      controller?.dispose();
      super.dispose();
    }

    @override
    void onInit() {
      super.onInit();

      detector = ShakeDetector.autoStart(onPhoneShake: () {
        Methode.reportCustomShowModalBottomSheet();
      });
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

