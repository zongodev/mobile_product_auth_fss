import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:get/get_navigation/src/root/get_material_app.dart';
import 'package:product_auth_fss/consts/colors.dart';
import 'package:product_auth_fss/controller/user_controller/user_binding.dart';
import 'package:product_auth_fss/routes/app_pages.dart';
import 'package:product_auth_fss/routes/app_routes.dart';
import 'package:product_auth_fss/view/qr_scan/qr_scan.dart';
import 'package:product_auth_fss/view/splash_screen/splash_screen.dart';

import 'firebase_options.dart';


void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(const MyApp());
  configLoading();
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      initialRoute: AppRoutes.initialRoute,
      initialBinding: UserBinding(),
      home: const SplashScreen(),
      builder: EasyLoading.init(),
      getPages: AppPages.pages,

    );
  }
}
void configLoading() {
  EasyLoading.instance
    ..indicatorType = EasyLoadingIndicatorType.fadingCircle
    ..loadingStyle = EasyLoadingStyle.custom

    ..radius = 10.0
    ..progressColor = Colors.yellow
    ..backgroundColor = Colors.black87
    ..indicatorColor = ThemeColors.kPrimaryColor
    ..textColor = Colors.white
    ..maskColor = Colors.green
    ..userInteractions = false
    ..dismissOnTap = false
    ..animationStyle = EasyLoadingAnimationStyle.scale;
}

