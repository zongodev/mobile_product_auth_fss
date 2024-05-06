import 'package:get/get.dart';
import 'package:product_auth_fss/controller/qr_scan_controller/qr_scan_binding.dart';
import 'package:product_auth_fss/routes/app_routes.dart';
import 'package:product_auth_fss/view/qr_scan/qr_scan.dart';
import 'package:product_auth_fss/view/sign_in/sign_in.dart';
import 'package:product_auth_fss/view/sign_up/register.dart';
import 'package:product_auth_fss/view/splash_screen/splash_screen.dart';

class AppPages {
  static final pages =
      [
        GetPage(name: AppRoutes.initialRoute, page: () => const SplashScreen(),),
        GetPage(name: AppRoutes.login, page: () => const SignIn(),),
        GetPage(name: AppRoutes.register, page: () => const Register(),),
        GetPage(name: AppRoutes.qrScan, page: () => const ScanCodePage(),binding: QrCodeBinding()),
      ];
}