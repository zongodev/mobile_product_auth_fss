import 'package:get/get.dart';
import 'package:product_auth_fss/controller/qr_scan_controller/qr_scan_controller.dart';

class QrCodeBinding implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => QrScanner());
  }

}